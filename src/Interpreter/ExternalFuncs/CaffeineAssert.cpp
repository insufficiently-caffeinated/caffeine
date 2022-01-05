#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssert.h"
#include "caffeine/Interpreter/InterpreterContext.h"

#include <llvm/IR/InstrTypes.h>

namespace caffeine {

void CaffeineAssertFunction::call(llvm::Function* func, InterpreterContext& ctx,
                                  Span<LLVMValue> args) const {
  if (args.size() != 1) {
    ctx.fail("caffeine_assert called with bad signature (wrong number of "
             "arguments)");
    return;
  }

  if (func->getArg(0)->getType() != llvm::Type::getInt1Ty(func->getContext())) {
    ctx.fail("caffeine_assert had invalid signature (invalid parameter type)");
    return;
  }

  if (!func->getReturnType()->isVoidTy()) {
    ctx.fail("caffeine_assert has invalid signature (invalid return type)");
    return;
  }

  ctx.assert_or_fail(args[0].scalar().expr(), "assertion failure");
  ctx.jump_return();
}

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_assert() {
  return std::make_unique<CaffeineAssertFunction>();
}

} // namespace caffeine
