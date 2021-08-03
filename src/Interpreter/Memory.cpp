#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

LLVMValue Interpreter::memoryAllocate(llvm::CallBase& call, const OpRef& size,
                                      const OpRef& alignment,
                                      const llvm::DataLayout& layout,
                                      int address_space) {
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

  return LLVMValue(Pointer(
      alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)), address_space));
}

} // namespace caffeine
