#include "caffeine/Interpreter/ExternalFuncs/Abort.h"
#include "caffeine/Interpreter/InterpreterContext.h"

#include <llvm/IR/InstrTypes.h>

namespace caffeine {

void AbortFunction::call(llvm::Function*, InterpreterContext& ctx,
                         Span<LLVMValue> args) const {
  if (args.size() != 0) {
    ctx.fail("abort called with bad signature (wrong number of "
             "arguments)");
    return;
  }

  ctx.fail("program called abort");
}

std::unique_ptr<ExternalFunction> ExternalFunctions::abort() {
  return std::make_unique<AbortFunction>();
}

} // namespace caffeine
