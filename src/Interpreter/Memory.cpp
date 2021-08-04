#include "caffeine/Interpreter/Interpreter.h"

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

  auto ptr_width = layout.getPointerSizeInBits(address_space);

  if (options.malloc_can_return_null) {
    Context forked = ctx->fork_once();
    forked.stack_top().insert(
        &call, LLVMValue(Pointer(ConstantInt::Create(llvm::APInt(ptr_width, 0)),
                                 address_space)));
    queueContext(std::move(forked));
  }

  auto size_op = UnaryOp::CreateTruncOrZExt(Type::int_ty(ptr_width), size);
  auto alloc = ctx->heaps[address_space].allocate(
      size_op, alignment,
      AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0xDD))),
      AllocationKind::Malloc, AllocationPermissions::ReadWrite, *ctx);

  ctx->stack_top().insert(
      &call,
      LLVMValue(Pointer(alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)),
                        address_space)));

  return ExecutionResult::Continue;
}

} // namespace caffeine
