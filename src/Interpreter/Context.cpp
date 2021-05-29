#include "caffeine/Interpreter/Context.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Interpreter/ExprEval.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Support/LLVMFmt.h"

#include <boost/algorithm/string.hpp>
#include <fmt/format.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

namespace caffeine {

static void assert_valid_arg(llvm::Type* type) {
  if (type->isIntegerTy() || type->isFloatingPointTy()) {
    return;
  }

  std::string message;
  llvm::raw_string_ostream os{message};
  os << "Unsupported LLVM type: ";
  type->print(os);

  CAFFEINE_ABORT(message);
}

Context::Context(llvm::Function* function,
                 const std::unordered_map<llvm::Value*, OpRef>& args)
    : mod(function->front().getModule()) {
  stack.emplace_back(function);
  StackFrame& frame = stack_top();

  init_args(args);
}
Context::Context(llvm::Function* function)
    : mod(function->front().getModule()) {
  stack.emplace_back(function);
  StackFrame& frame = stack_top();

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
    init_args(
        {{arg0, ConstantInt::CreateZero(arg0->getType()->getIntegerBitWidth())},
         {arg1, ConstantInt::CreateZero(layout.getPointerSizeInBits(
                    arg1->getType()->getPointerAddressSpace()))}});
  } else {
    init_args({});
  }
}

void Context::init_args(const std::unordered_map<llvm::Value*, OpRef>& args) {
  llvm::Function* function = stack.front().current_block->getParent();
  CAFFEINE_ASSERT(function->arg_size() == args.size(),
                  "Attempted to pass an invalid number of arguments to an "
                  "entry-point function");

  auto& frame = stack_top();
  for (auto arg : function->args()) {
    auto it = args.find(&arg);
    CAFFEINE_ASSERT(
        it != args.end(),
        fmt::format("Argument '{}' was missing from argument map", arg));

    frame.insert(&arg, it->second);
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

  auto& frame = stack.back();
  for (auto [allocid, heap] : frame.allocations) {
    CAFFEINE_ASSERT(heaps[heap][allocid].kind() == AllocationKind::Alloca,
                    "found non-stack allocation on the stack");

    heaps[heap].deallocate(allocid);
  }

  stack.pop_back();
}

bool Context::empty() const {
  return stack.empty();
}

void Context::add(const Assertion& assertion) {
  assertions.insert(assertion);
}
void Context::add(Assertion&& assertion) {
  assertions.insert(std::move(assertion));
}

std::optional<LLVMValue> Context::lookup_const(llvm::Value* value) const {
  ExprEvaluator::Options options;
  options.create_allocations = false;

  // The const cast is a bit ugly here but ExprEvaluator will not modify the
  // context if we have specified create_allocations = false.
  if (auto v = ExprEvaluator{const_cast<Context*>(this)}.try_visit(value))
    return (LLVMValue)*v;
  return std::nullopt;
}

LLVMValue Context::lookup(llvm::Value* value) {
  return (LLVMValue)ExprEvaluator{this}.visit(value);
}

SolverResult Context::check(std::shared_ptr<Solver> solver,
                            const Assertion& extra) {
  auto result = solver->check(assertions, extra);
  if (result == SolverResult::SAT)
    assertions.mark_sat();
  return result;
}
SolverResult Context::resolve(std::shared_ptr<Solver> solver,
                              const Assertion& extra) {
  auto result = solver->resolve(assertions, extra);
  if (result == SolverResult::SAT)
    assertions.mark_sat();
  return result;
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
  StackFrame& frame = stack_top();

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
