#include "caffeine/IR/Type.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/TransformBuilder.h"

#include <cerrno>

namespace caffeine {

// Used to implement posix_memalign
ExecutionResult Interpreter::visitMallocAlign(llvm::CallBase& call) {
  auto size = ctx->lookup(call.getArgOperand(0)).scalar().expr();
  auto alignment = ctx->lookup(call.getArgOperand(1)).scalar().expr();

  CAFFEINE_ASSERT(call.getNumArgOperands() == 2,
                  "Invalid malloc align signature");
  CAFFEINE_ASSERT(call.getType()->isPointerTy(),
                  "Invalid malloc align signature");

  const llvm::DataLayout& layout = call.getModule()->getDataLayout();
  unsigned address_space = call.getType()->getPointerAddressSpace();

  CAFFEINE_ASSERT(size->type().is_int(), "Invalid malloc align signature");
  CAFFEINE_ASSERT(size->type().bitwidth() ==
                      layout.getIndexSizeInBits(address_space),
                  "Invalid malloc align signature");

  LLVMValue res = memoryAllocate(call, size, alignment, layout, address_space);

  ctx->stack_top().insert(&call, res);

  return ExecutionResult::Continue;
}

} // namespace caffeine
