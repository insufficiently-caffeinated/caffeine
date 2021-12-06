#include "caffeine/Interpreter/ExternalFuncs/SetjmpLongjmp.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <boost/range/algorithm/find_if.hpp>
#include <fmt/format.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {

namespace setjmp {
  llvm::StructType* getJmpBufType(llvm::LLVMContext& ctx) {
    return llvm::StructType::get(llvm::Type::getInt64Ty(ctx),
                                 llvm::Type::getInt64Ty(ctx));
  }
} // namespace setjmp

using namespace setjmp;

namespace {

  class SetJmpFunction : public ExternalFunction {
  public:
    void call(InterpreterContext& ctx, Span<LLVMValue> args) const override {
      if (args.size() != 1) {
        ctx.fail("invalid number of arguments for setjmp");
        return;
      }

      auto inst = ctx.getCurrentInstruction();
      CAFFEINE_ASSERT(inst);

      auto call = llvm::dyn_cast<llvm::CallBase>(inst);
      if (!call) {
        ctx.fail("setjmp was not called from a call/invoke instruction");
        return;
      }

      if (!call->getType()->isIntegerTy()) {
        ctx.fail("invalid setjmp signature (invalid return type)");
        return;
      }

      if (!call->getArgOperand(0)->getType()->isPointerTy()) {
        ctx.fail("invalid setjmp signature (invalid first argument)");
        return;
      }

      const auto& layout = ctx.getModule()->getDataLayout();
      const auto& frame = ctx.context().stack_top();

      LLVMValue jmpbuf = getJmpBuf(frame.frame_id, call);
      llvm::Type* jmpbuf_ty = getJmpBufType(ctx.getModule()->getContext());

      unsigned jmpbuf_size = layout.getTypeStoreSize(jmpbuf_ty);
      unsigned real_size = layout.getTypeStoreSize(
          call->getArgOperand(0)->getType()->getPointerElementType());

      if (real_size < jmpbuf_size) {
        ctx.fail(fmt::format(
            "platform jmp_buf is too small for caffeine to use: {} > {}",
            real_size, jmpbuf_size));
        return;
      }

      auto unresolved = args[0].scalar().pointer();
      auto resolved =
          ctx.resolve_ptr(unresolved, jmpbuf_size, "invalid pointer write");
      ctx.kill();

      for (const Pointer& ptr : resolved) {
        auto fork = ctx.fork();
        fork.add_assertion(
            ICmpOp::CreateICmpEQ(unresolved.value(ctx.context().heaps),
                                 ptr.value(ctx.context().heaps)));
        fork.mem_write(ptr, jmpbuf_ty, jmpbuf);
        fork.jump_return(LLVMValue(
            ConstantInt::CreateZero(inst->getType()->getIntegerBitWidth())));
      }
    }

  private:
    static LLVMValue getJmpBuf(uint64_t stack_id, llvm::Instruction* inst) {
      llvm::BasicBlock* block = inst->getParent();
      llvm::Function* func = block->getParent();

      auto block_it = boost::find_if(func->getBasicBlockList(),
                                     [&](auto& x) { return &x == block; });
      auto inst_it =
          boost::find_if(*block, [&](auto& x) { return &x == inst; });
      CAFFEINE_ASSERT(!(block_it == func->getBasicBlockList().end()));
      CAFFEINE_ASSERT(!(inst_it == block->end()));

      uint32_t block_idx =
          std::distance(func->getBasicBlockList().begin(), block_it);
      uint32_t inst_idx = std::distance(block->begin(), inst_it);

      uint64_t inst_id = ((uint64_t)block_idx << 32) | (uint64_t)inst_idx;

      return LLVMValue(llvm::ArrayRef<LLVMValue>{
          LLVMValue(ConstantInt::Create(llvm::APInt(64, stack_id))),
          LLVMValue(ConstantInt::Create(llvm::APInt(64, inst_id)))});
    }
  };

} // namespace

std::unique_ptr<ExternalFunction> ExternalFunctions::setjmp() {
  return std::make_unique<SetJmpFunction>();
}

} // namespace caffeine