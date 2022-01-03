#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssume.h"
#include "caffeine/Interpreter/InterpreterContext.h"

#include <llvm/IR/InstrTypes.h>

namespace caffeine {

void CaffeineAssumeFunction::call(llvm::CallBase*, InterpreterContext& ctx,
                                  Span<LLVMValue> args) const {
  if (args.size() != 1) {
    ctx.fail("caffeine_assume called with bad signature (wrong number of "
             "arguments)");
    return;
  }

  ctx.add_assertion(args[0].scalar().expr());
  ctx.jump_return();
}

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_assume() {
  return std::make_unique<CaffeineAssumeFunction>();
}

} // namespace caffeine
