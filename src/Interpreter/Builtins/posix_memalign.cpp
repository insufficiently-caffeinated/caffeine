#include "caffeine/IR/Type.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/TransformBuilder.h"

#include <cerrno>

namespace caffeine {

ExecutionResult Interpreter::visitPosixMemalign(llvm::CallBase& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 3,
                  "Invalid posix_memalign signature");

  auto ptr_ty = call.getArgOperand(0)->getType();
  CAFFEINE_ASSERT(ptr_ty->isPointerTy(), "Invalid posix_memalign signature");
  CAFFEINE_ASSERT(call.getArgOperand(1)->getType()->isIntegerTy(),
                  "Invalid posix_memalign signature");
  CAFFEINE_ASSERT(call.getArgOperand(2)->getType()->isIntegerTy(),
                  "Invalid posix_memalign signature");

  const llvm::DataLayout& layout = call.getModule()->getDataLayout();

  unsigned address_space = ptr_ty->getPointerAddressSpace();
  auto ptr_width = layout.getPointerSizeInBits(address_space);
  auto size_t_width = call.getArgOperand(2)->getType()->getIntegerBitWidth();
  auto result_width = call.getType()->getIntegerBitWidth();
  auto size = ctx->lookup(call.getArgOperand(2)).scalar().expr();

  auto ops = TransformBuilder();

  auto resolved = ops.resolve(call.getArgOperand(0), ptr_ty);

  ops.transform([&](TransformBuilder::ContextState& state) {
    Context& ctx = state.ctx;

    auto memptr = state.lookup(resolved).scalar().pointer();
    Allocation& memptr_allocation = ctx.heaps.ptr_allocation(memptr);
    MemHeap& memheap = ctx.heaps[address_space];

    // It's possible that there is no memory on the system
    if (options.malloc_can_return_null) {
      Context forked = ctx.fork_once();
      forked.stack_top().insert(
          &call, LLVMValue(Pointer(
                     ConstantInt::Create(llvm::APInt(result_width, ENOMEM)),
                     address_space)));
      queueContext(std::move(forked));
    }

    auto size_op = UnaryOp::CreateTruncOrZExt(Type::int_ty(size_t_width), size);
    auto alignment = ctx.lookup(call.getArgOperand(1)).scalar().expr();
    auto new_alloc = memheap.allocate(
        size_op, alignment,
        AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0xDD))),
        AllocationKind::Malloc, AllocationPermissions::ReadWrite, ctx);

    auto new_alloc_ptr = LLVMValue(
        Pointer(new_alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)),
                address_space));
    memptr_allocation.write(memptr.offset(), ptr_ty, new_alloc_ptr, ctx.heaps,
                            layout);

    ctx.stack_top().insert(&call, ConstantInt::CreateZero(result_width));
  });

  return ops.execute(this);
}

} // namespace caffeine
