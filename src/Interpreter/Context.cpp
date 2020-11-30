#include "caffeine/Interpreter/Context.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"

#include <llvm/Support/raw_ostream.h>

namespace caffeine {

void assert_int(llvm::Type* type) {
  if (type->isIntegerTy()) {
    return;
  }

  std::string message;
  llvm::raw_string_ostream os{message};
  os << "Unsupported LLVM type: ";
  type->print(os);

  CAFFEINE_ABORT(message);
}

Context::Context(llvm::Function* function, std::shared_ptr<Solver> solver)
    : solver_(std::move(solver)) {
  stack.emplace_back(function);
  StackFrame& frame = stack_top();

  for (auto& arg : function->args()) {
    assert_int(arg.getType());
    frame.insert(&arg, Constant::Create(
                           Type::int_ty(arg.getType()->getIntegerBitWidth()),
                           arg.getName().str()));
  }
}

Context Context::fork() const {
  return Context{*this};
}

std::shared_ptr<Solver> Context::solver() const {
  return solver_;
}

void Context::add(const Assertion& assertion) {
  assertions_.push_back(assertion);
}
void Context::add(Assertion&& assertion) {
  assertions_.push_back(std::move(assertion));
}

SolverResult Context::check(const Assertion& extra) {
  return solver_->check(assertions_, extra);
}
std::unique_ptr<Model> Context::resolve(const Assertion& extra) {
  return solver_->resolve(assertions_, extra);
}

} // namespace caffeine
