#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssume.h"
#include "caffeine/Interpreter/InterpreterContext.h"

#include <llvm/IR/InstrTypes.h>

namespace caffeine {

void CaffeineAssumeFunction::call(llvm::Function* func, InterpreterContext& ctx,
                                  Span<LLVMValue> args) const {
  if (args.size() != 1) {
    ctx.fail("caffeine_assume called with bad signature (wrong number of "
             "arguments)");
    return;
  }

  if (func->getArg(0)->getType() != llvm::Type::getInt1Ty(func->getContext())) {
    ctx.fail("caffeine_assume had invalid signature (invalid parameter type)");
    return;
  }

  if (!func->getReturnType()->isVoidTy()) {
    ctx.fail("caffeine_assume has invalid signature (invalid return type)");
    return;
  }

  ctx.add_assertion(args[0].scalar().expr());
  ctx.jump_return();
}

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_assume() {
  return std::make_unique<CaffeineAssumeFunction>();
}

} // namespace caffeine
