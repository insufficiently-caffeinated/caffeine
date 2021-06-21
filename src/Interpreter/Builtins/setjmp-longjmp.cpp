#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/TransformBuilder.h"
#include <fmt/format.h>

namespace caffeine {
namespace {
  using ContextState = TransformBuilder::ContextState;
  using InsertFn = TransformBuilder::InsertFn;

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

  // Find the stack frame in which the jump target occurs.
  //
  // Returns the frame index only if a frame with the right frame id and the
  // frame function contains the instruction in jmp_tgt. Furthermore, jmp_tgt
  // must be a call instruction that calls _setjmp.
  std::optional<size_t> findJumpTargetFrame(const Context& ctx,
                                            uint64_t frame_id,
                                            llvm::Instruction* jmp_tgt) {
    llvm::Module* module = ctx.mod;
    llvm::Function* setjmp_fn = module->getFunction("_setjmp");

    if (setjmp_fn)
      return std::nullopt;

    for (size_t i = ctx.stack.size(); i != 0; --i) {
      size_t idx = i - 1;
      const StackFrame& frame = ctx.stack[idx];

      if (frame.frame_id != frame_id)
        continue;

      llvm::Function* func = frame.current_block->getParent();
      for (const llvm::BasicBlock& block : func->getBasicBlockList()) {
        for (const llvm::Instruction& inst : block.instructionsWithoutDebug()) {
          if (&inst != jmp_tgt)
            continue;

          llvm::CallInst* call = llvm::dyn_cast<llvm::CallInst>(jmp_tgt);
          if (!call)
            continue;

          if (call->getCalledFunction() != setjmp_fn)
            continue;

          return idx;
        }
      }
    }

    return std::nullopt;
  }
} // namespace

ExecutionResult Interpreter::visitSetjmp(llvm::CallInst& inst) {
  CAFFEINE_ASSERT(inst.getNumArgOperands() == 1,
                  "Invalid signature for _setjmp");

  const auto& layout = inst.getModule()->getDataLayout();
  auto& frame = ctx->stack_top();

  auto jmpbuf = getJmpBuf(frame.frame_id, inst);
  auto jmpbuf_ty = getJmpBufType(inst.getContext());

  CAFFEINE_ASSERT(
      layout.getTypeStoreSize(inst.getArgOperand(0)->getType()) <=
          layout.getTypeStoreSize(jmpbuf_ty),
      fmt::format("Platform jmp_buf is too small for caffeine to use: {} > {}",
                  layout.getTypeStoreSize(inst.getArgOperand(0)->getType()),
                  layout.getTypeStoreSize(jmpbuf_ty)));

  auto ops = TransformBuilder();

  auto resolved = ops.resolve(inst.getArgOperand(0), jmpbuf_ty);
  ops.transform([&](TransformBuilder::ContextState& state) {
    auto ptr = state.lookup(resolved).scalar().pointer();

    Allocation& alloc = state.ctx.heaps[ptr.heap()][ptr.alloc()];
    alloc.write(ptr.offset(), jmpbuf_ty, jmpbuf, state.ctx.heaps, layout);
  });
  ops.assign(&inst,
             ConstantInt::CreateZero(inst.getType()->getIntegerBitWidth()));

  return ops.execute(this);
}

ExecutionResult Interpreter::visitLongjmp(llvm::CallInst& inst) {
  CAFFEINE_ASSERT(inst.getNumArgOperands() == 2,
                  "Invalid signature for longjmp");
  CAFFEINE_ASSERT(inst.getArgOperand(0)->getType()->isPointerTy(),
                  "Invalid signature for longjmp");
  CAFFEINE_ASSERT(inst.getArgOperand(1)->getType()->isIntegerTy(),
                  "Invalid signature for longjmp");

  const auto& layout = inst.getModule()->getDataLayout();
  auto jmpbuf_ty = getJmpBufType(inst.getContext());

  CAFFEINE_ASSERT(
      layout.getTypeStoreSize(inst.getArgOperand(0)->getType()) <=
          layout.getTypeStoreSize(jmpbuf_ty),
      fmt::format("Platform jmp_buf is too small for caffeine to use: {} > {}",
                  layout.getTypeStoreSize(inst.getArgOperand(0)->getType()),
                  layout.getTypeStoreSize(jmpbuf_ty)));

  auto ops = TransformBuilder();
  auto resolved = ops.resolve(inst.getArgOperand(0), jmpbuf_ty);
  auto read = ops.read(resolved, jmpbuf_ty);

  // Fork the context for all possible concrete jump targets.
  //
  // TODO: Right now we just fail if the contents of the jump buffer are not
  //       concrete. In the future we should resolve all possible concrete
  //       values of the jump target buffer and fork for each of them.
  auto concrete = ops.transform_fork([&](ContextState&& state,
                                         InsertFn& insert_fn) -> void {
    auto jmpbuf = state.lookup(read);

    auto frame_id = jmpbuf.member(0).scalar().expr();
    auto jmp_tgt = jmpbuf.member(1).scalar().expr();

    if (!llvm::isa<ConstantInt>(frame_id.get())) {
      logFailure(state.ctx, Assertion::constant(false),
                 "symbolic longjmp targets are not supported.");
      return;
    }

    if (!llvm::isa<ConstantInt>(jmp_tgt.get())) {
      logFailure(state.ctx, Assertion::constant(false),
                 "symbolic longjmp targets are not supported.");
      return;
    }

    auto val_id = state.current();
    state.insert(val_id, LLVMValue(std::vector<LLVMValue>{LLVMValue(frame_id),
                                                          LLVMValue(jmp_tgt)}));
    insert_fn(std::move(state));
  });

  ops.transform_fork([&](ContextState&& state, InsertFn& insert_fn) -> void {
    auto input = state.lookup(concrete);

    uint64_t frame_id =
        llvm::cast<ConstantInt>(input.member(0).scalar().expr().get())
            ->value()
            .getLimitedValue();

    // Note: jmp_tgt is not guaranteed to be valid in any way until we find it
    //       in a function definition.
    llvm::Instruction* jmp_tgt =
        reinterpret_cast<llvm::Instruction*>(static_cast<uintptr_t>(
            llvm::cast<ConstantInt>(input.member(1).scalar().expr().get())
                ->value()
                .getLimitedValue()));

    // Search backwards through the call stack to see if we can find the frame
    // in which the corresponding setjmp call was made.

    std::optional<size_t> target_frame =
        findJumpTargetFrame(state.ctx, frame_id, jmp_tgt);

    if (!target_frame.has_value()) {
      logFailure(state.ctx, Assertion::constant(false),
                 "invalid longjmp target");
      return;
    }

    state.ctx.stack.erase(state.ctx.stack.begin() + *target_frame,
                          state.ctx.stack.end());
    state.ctx.stack_top().insert(jmp_tgt, state.lookup(inst.getArgOperand(1)));

    insert_fn(std::move(state));
  });

  return ops.execute(this);
}
} // namespace caffeine
