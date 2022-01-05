#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/InterpreterContext.h"

namespace caffeine {
void ExternalFunction::call(llvm::Function* func, InterpreterContext& ctx,
                            Span<LLVMValue> args) const {
  auto cb = llvm::cast<llvm::CallBase>(ctx.getCurrentInstruction());

  this->call(cb, ctx, args);
}
} // namespace caffeine
