#include "caffeine/Interpreter/Context.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Interpreter/StackFrame.h"

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

Context::Context(llvm::Function* function, std::shared_ptr<Solver> solver)
    : solver_(std::move(solver)), module_(function->front().getModule()) {
  stack.emplace_back(function);
  StackFrame& frame = stack_top();

  size_t i = 0;
  for (auto& arg : function->args()) {
    assert_valid_arg(arg.getType());

    std::string name = arg.getName().str();

    if (name.empty())
      name = fmt::format("arg{}", i);

    frame.insert(&arg, Constant::Create(Type::from_llvm(arg.getType()), name));

    i += 1;
  }
}

Context Context::fork() const {
  return Context{*this};
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
  stack.pop_back();
}

bool Context::empty() const {
  return stack.empty();
}

std::shared_ptr<Solver> Context::solver() const {
  return solver_;
}

llvm::iterator_range<std::vector<Assertion>::const_iterator>
Context::assertions() const {
  return {std::begin(assertions_), std::end(assertions_)};
}

void Context::add(const Assertion& assertion) {
  assertions_.push_back(assertion);
}
void Context::add(Assertion&& assertion) {
  assertions_.push_back(std::move(assertion));
}

ContextValue Context::lookup(llvm::Value* value) {
  if (auto* constant = llvm::dyn_cast_or_null<llvm::Constant>(value))
    return evaluate_constant(constant);

  return stack_top().lookup(value);
}

SolverResult Context::check(const Assertion& extra) {
  return solver_->check(assertions_, extra);
}
std::unique_ptr<Model> Context::resolve(const Assertion& extra) {
  return solver_->resolve(assertions_, extra);
}

uint64_t Context::next_constant() {
  // Constant numbers greater than 2^29-1 are reserved for the solvers
  // themselves to create internal constants. If this assertion fires
  // then we'll have to revisit the naming allocations.
  CAFFEINE_ASSERT(constant_num_ < (1 << 29),
                  "ran out of temporary constant names");
  return constant_num_++;
}

} // namespace caffeine
