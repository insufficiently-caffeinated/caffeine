#include "caffeine/Interpreter/Context.h"
#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Interpreter/ExprEval.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Model/AssertionList.h"
#include "caffeine/Support/LLVMFmt.h"

#include <boost/algorithm/string.hpp>
#include <fmt/format.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

namespace caffeine {

Context::Context(llvm::Function* function, llvm::ArrayRef<OpRef> args)
    : mod(function->front().getModule()) {
  stack.push_back(StackFrame::RegularFrame(function));
  init_args(args);
}
Context::Context(llvm::Function* function)
    : mod(function->front().getModule()) {
  stack.push_back(StackFrame::RegularFrame(function));

  const llvm::DataLayout& layout = mod->getDataLayout();
  if (function->getName() == "main" && function->arg_size() == 2) {
    auto arg0 = function->arg_begin();
    auto arg1 = arg0 + 1;

    // For main we expect the signature to be
    //   int main(int argc, char** argv)
    // However, we currently don't do anything with this so we'll effectively
    // call main like this:
    //   main(0, nullptr)
    // which is not completely valid but close enough that it works.
    init_args({ConstantInt::CreateZero(arg0->getType()->getIntegerBitWidth()),
               ConstantInt::CreateZero(layout.getPointerSizeInBits(
                   arg1->getType()->getPointerAddressSpace()))});
  } else {
    init_args({});
  }
}

void Context::init_args(llvm::ArrayRef<OpRef> args) {
  llvm::Function* function =
      stack.front().get_regular().current_block->getParent();
  CAFFEINE_ASSERT(function->arg_size() == args.size(),
                  "Attempted to pass an invalid number of arguments to an "
                  "entry-point function");

  auto& frame = stack_top().get_regular();
  for (auto&& [arg_ptr, arg_val] : llvm::zip(function->args(), args)) {
    frame.insert(&arg_ptr, arg_val);
  }
}

Context Context::fork_once() const {
  return Context{*this};
}

llvm::SmallVector<Context, 2> Context::fork(size_t count) {
  if (count == 0)
    return {};

  llvm::SmallVector<Context, 2> forks;
  for (size_t i = 0; i < count - 1; ++i) {
    forks.push_back(*this);
  }

  forks.push_back(std::move(*this));
  return forks;
}

const StackFrame& Context::stack_top() const {
  CAFFEINE_ASSERT(!stack.empty());
  return stack.back();
}

StackFrame& Context::stack_top() {
  CAFFEINE_ASSERT(!stack.empty());
  return stack.back();
}

void Context::push(const StackFrame& frame) {
  stack.push_back(frame);
}
void Context::push(StackFrame&& frame) {
  stack.push_back(frame);
}
void Context::pop() {
  CAFFEINE_ASSERT(!stack.empty());

  if (stack.back().is_regular()) {
    auto& frame = stack.back().get_regular();
    for (auto [allocid, heap] : frame.allocations) {
      CAFFEINE_ASSERT(heaps[heap][allocid].kind() == AllocationKind::Alloca,
                      "found non-stack allocation on the stack");

      heaps[heap].deallocate(allocid);
    }
  }

  stack.pop_back();
}

bool Context::empty() const {
  return stack.empty();
}

void Context::add(const Assertion& assertion) {
  assertions.insert(egraph.add(*assertion.value()));
}

SolverResult Context::check(std::shared_ptr<Solver> solver,
                            const Assertion& extra) {
  AssertionList assertions = extract_assertions();

  auto result = solver->check(assertions, egraph.extract(*extra.value()));
  if (result == SolverResult::SAT)
    assertions.mark_sat();
  return result;
}
SolverResult Context::resolve(std::shared_ptr<Solver> solver,
                              const Assertion& extra) {
  AssertionList assertions = extract_assertions();

  auto result = solver->resolve(assertions, egraph.extract(*extra.value()));
  if (result == SolverResult::SAT)
    assertions.mark_sat();
  return result;
}

AssertionList Context::extract_assertions() {
  egraph.constprop();
  egraph.rebuild();

  assertions.canonicalize(egraph);

  EGraphExtractor extractor{&egraph};
  AssertionList list;

  for (size_t assertion : assertions.proven())
    list.insert(extractor.extract(assertion));
  list.mark_sat();

  for (size_t assertion : assertions.unproven())
    list.insert(extractor.extract(assertion));

  return list;
}
AssertionList Context::extract_assertions() const {
  EGraphExtractor extractor{&egraph};
  AssertionList list;

  for (size_t assertion : assertions.proven())
    list.insert(extractor.extract(assertion));
  list.mark_sat();

  for (size_t assertion : assertions.unproven())
    list.insert(extractor.extract(assertion));

  return list;
}

uint64_t Context::next_constant() {
  // Constant numbers greater than 2^29-1 are reserved for the solvers
  // themselves to create internal constants. If this assertion fires
  // then we'll have to revisit the naming allocations.
  CAFFEINE_ASSERT(constant_num_ < (1 << 29),
                  "ran out of temporary constant names");
  return constant_num_++;
}

void Context::backprop(const Pointer& unresolved, const Pointer& resolved) {
  auto& frame_wrapper = stack_top();
  auto& frame = frame_wrapper.get_regular();

  for (auto& [key, value] : frame.variables) {
    if (!value.is_scalar())
      continue;

    auto& scalar = value.scalar();
    if (!scalar.is_pointer())
      continue;

    auto& pointer = scalar.pointer();
    if (pointer == unresolved)
      value = LLVMValue(resolved);
  }
}

} // namespace caffeine
