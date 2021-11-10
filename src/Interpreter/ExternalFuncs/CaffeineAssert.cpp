#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssert.h"
#include "caffeine/Interpreter/InterpreterContext.h"

namespace caffeine {

std::unique_ptr<ExternalStackFrame> CaffeineAssertFunc::clone() const {
  return std::make_unique<CaffeineAssertFunc>(*this);
}

void CaffeineAssertFunc::step(InterpreterContext& ic) {
  auto& ctx = ic.context();
  auto cond = args.at(0);
  auto assertion = Assertion(cond.scalar().expr());

  ic.assert_or_fail(assertion, "assertion failure");

  ctx.add(assertion);

  ic.context().stack.pop_back();
  ic.context().stack_top().set_result(std::nullopt, std::nullopt);
}

} // namespace caffeine
