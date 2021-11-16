#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssert.h"
#include "caffeine/Interpreter/InterpreterContext.h"

namespace caffeine {

std::unique_ptr<ExternalStackFrame> CaffeineAssertFunc::clone() const {
  return std::make_unique<CaffeineAssertFunc>(*this);
}

void CaffeineAssertFunc::step(InterpreterContext& ic) {
  auto cond = args.at(0);
  auto assertion = Assertion(cond.scalar().expr());

  ic.assert_or_fail(assertion, "assertion failure");
  ic.function_return();
}

} // namespace caffeine
