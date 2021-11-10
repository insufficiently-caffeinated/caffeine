#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssert.h"
#include "caffeine/Interpreter/InterpreterContext.h"

namespace caffeine {

std::unique_ptr<ExternalStackFrame> CaffeineAssertFunc::clone() const {
  return std::make_unique<CaffeineAssertFunc>(*this);
}

ExternalStackFrame::CoroutineExecutionResult
CaffeineAssertFunc::step(InterpreterContext& ic,
                         const std::vector<LLVMValue>& args) {
  auto& ctx = ic.context();
  auto cond = args.at(0);
  auto assertion = Assertion(cond.scalar().expr());

  ic.assert_or_fail(assertion, "assertion failure");

  ctx.add(assertion);

  return ExternalStackFrame::CoroutineExecutionResult::Stop;
}

} // namespace caffeine
