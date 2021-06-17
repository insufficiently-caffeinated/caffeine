#include "caffeine/Interpreter/Interpreter.h"
#include <fmt/format.h>

namespace caffeine {
namespace {
  llvm::StructType* getJmpBufType(llvm::LLVMContext& ctx) {
    return llvm::StructType::get(
        llvm::Type::getInt64Ty(ctx),
        llvm::Type::getIntNTy(ctx, sizeof(void*) * CHAR_BIT));
  }

  // TODO: This stores a interpreter pointer in the memory of the interpreted
  //       program. This will not work when we want to make caffeine
  //       distributed. However, I don't see another good way to write this for
  //       now so I'm leaving it.
  LLVMValue getJmpBuf(uint64_t stack_id, llvm::CallInst& inst) {
    return LLVMValue(llvm::ArrayRef<LLVMValue>{
        LLVMValue(ConstantInt::Create(llvm::APInt(64, stack_id))),
        LLVMValue(ConstantInt::Create(llvm::APInt(
            sizeof(void*) * CHAR_BIT, reinterpret_cast<uintptr_t>(&inst))))});
  }
} // namespace

ExecutionResult Interpreter::visitSetjmp(llvm::CallInst& inst) {
  CAFFEINE_ASSERT(inst.getNumArgOperands() == 1,
                  "Invalid signature for _setjmp");

  const auto& layout = inst.getModule()->getDataLayout();
  auto& frame = ctx->stack_top();

  auto pointer = ctx->lookup(inst.getArgOperand(0)).scalar().pointer();
  auto jmpbuf = getJmpBuf(frame.frame_id, inst);
  auto jmpbuf_ty = getJmpBufType(inst.getContext());

  CAFFEINE_ASSERT(
      layout.getTypeStoreSize(inst.getArgOperand(0)->getType()) <=
          layout.getTypeStoreSize(jmpbuf_ty),
      fmt::format("Platform jmp_buf is too small for caffeine to use: {} > {}",
                  layout.getTypeStoreSize(inst.getArgOperand(0)->getType()),
                  layout.getTypeStoreSize(jmpbuf_ty)));

  auto assertion =
      ctx->heaps.check_valid(pointer, layout.getTypeStoreSize(jmpbuf_ty));
  if (ctx->check(solver, !assertion) == SolverResult::SAT) {
    logFailure(*ctx, !assertion, "invalid pointer store");

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Dead;
  }

  frame.insert(&inst,
               ConstantInt::CreateZero(inst.getType()->getIntegerBitWidth()));

  auto resolved = ctx->heaps.resolve(solver, pointer, *ctx);
  auto forks = ctx->fork(resolved.size());

  for (auto [fork, ptr] : llvm::zip(forks, resolved)) {
    Allocation& alloc = fork.heaps[ptr.heap()][ptr.alloc()];
    fork.add(
        alloc.check_inbounds(ptr.offset(), layout.getTypeStoreSize(jmpbuf_ty)));
    alloc.write(ptr.offset(), jmpbuf_ty, jmpbuf, fork.heaps, layout);

    if (!ptr.is_resolved()) {
      fork.backprop(pointer, ptr);
    }
  }

  return forks;
}

ExecutionResult Interpreter::visitLongjmp(llvm::CallInst& inst) {
  CAFFEINE_UNIMPLEMENTED("test");
}
} // namespace caffeine
