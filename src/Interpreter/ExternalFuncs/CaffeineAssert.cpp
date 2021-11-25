#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssert.h"
#include "caffeine/Interpreter/InterpreterContext.h"

namespace caffeine {

void CaffeineAssertFunction::call(InterpreterContext& ctx,
                                  Span<LLVMValue> args) const {
  if (args.size() != 1) {
    ctx.fail("caffeine_assert called with bad signature (wrong number of "
             "arguments)");
    return;
  }

  ctx.assert_or_fail(args[0].scalar().expr(), "assertion failure");
}

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
