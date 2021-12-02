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
  ctx.jump_return();
}

} // namespace caffeine
