#include "caffeine/Interpreter/ExternalFuncs/SetjmpLongjmp.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <boost/range/algorithm/find_if.hpp>
#include <fmt/format.h>
#include <iterator>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {
using namespace setjmp;

namespace {

  class LongJmpFrame final : public ExternalStackFrameMixin<LongJmpFrame> {
  private:
    enum : uint8_t {
      INITIAL,
      SEARCHING,
      DONE,
    };

  public:
    using ExternalStackFrameMixin<LongJmpFrame>::ExternalStackFrameMixin;

    void step(InterpreterContext& ctx) override {
      const auto& layout = ctx.getModule()->getDataLayout();

      switch (state) {
      case INITIAL: {
        auto jmpbuf_ty = getJmpBufType(ctx.getModule()->getContext());
        auto jmpbuf_size = layout.getTypeStoreSize(jmpbuf_ty);

        auto unresolved = args[0].scalar().pointer();
        auto resolved = ctx.resolve_ptr(unresolved, jmpbuf_size,
                                        "invalid pointer read in LongJmp");

        ctx.fork_external<LongJmpFrame>(resolved, [=](InterpreterContext& ctx,
                                                      LongJmpFrame* frame,
                                                      const Pointer& ptr) {
          frame->jmpbuf = ctx.mem_read(ptr, jmpbuf_ty);
          frame->state = SEARCHING;
        });
        return;
      }
      case SEARCHING: {
        state = DONE;

        CAFFEINE_ASSERT(jmpbuf);

        uint64_t frame_id =
            llvm::cast<ConstantInt>(jmpbuf->member(0).scalar().expr().get())
                ->value()
                .getLimitedValue();
        uint64_t inst_id =
            llvm::cast<ConstantInt>(jmpbuf->member(1).scalar().expr().get())
                ->value()
                .getLimitedValue();

        uint32_t block_idx = inst_id >> 32;
        uint32_t inst_idx = (uint32_t)inst_id;

        auto frame_idx = findJumpTargetFrame(ctx, frame_id);
        if (!frame_idx) {
          ctx.fail("longjmp was unable to find target setjmp call");
          return;
        }

        auto func = ctx.context()
                        .stack.at(*frame_idx)
                        .get_regular()
                        .current_block->getParent();
        if (block_idx >= func->getBasicBlockList().size()) {
          ctx.fail("jmp_buf contained invalid target");
          return;
        }

        auto block = func->getBasicBlockList().begin();
        std::advance(block, block_idx);

        if (inst_idx >= block->getInstList().size()) {
          ctx.fail("jmp_buf contained invalid target");
          return;
        }

        auto inst = block->getInstList().begin();
        std::advance(inst, inst_idx);

        auto call = llvm::dyn_cast<llvm::CallBase>(&*inst);
        if (!call || !call->getType()->isIntegerTy()) {
          ctx.fail("jmp_buf target was not a valid instruction");
          return;
        }

        auto value = UnaryOp::CreateTruncOrZExt(
            Type::int_ty(call->getType()->getIntegerBitWidth()),
            args[1].scalar().expr());
        auto& state = ctx.context();
        // After this line this has been deleted
        state.stack.erase(state.stack.begin() + *frame_idx, state.stack.end());
        auto& frame = state.stack_top().get_regular();
        frame.jump_to(&*block);
        while (frame.current != inst) {
          ++frame.current;
          CAFFEINE_ASSERT(frame.current != frame.current_block->end());
        }

        ++frame.current;
        ctx.jump_return(LLVMValue(value));
        return;
      }

      default:
        CAFFEINE_ABORT(
            "longjmp function implementation entered an invalid state");
      }
    }

  private:
    static std::optional<size_t>
    findJumpTargetFrame(const InterpreterContext& ctx, uint64_t frame_id) {
      auto& stack = ctx.context().stack;

      for (size_t i = stack.size(); i != 0; --i) {
        size_t idx = i - 1;
        const auto& frame = stack[idx];

        if (frame.frame_id != frame_id)
          continue;

        return idx;
      }

      return std::nullopt;
    }

  private:
    uint8_t state = INITIAL;

    std::optional<LLVMValue> jmpbuf = std::nullopt;
  };

  class LongJmpFunction : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 2) {
        ctx.fail("invalid longjmp signature (invalid number of arguments)");
        return;
      }

      if (!func->getArg(0)->getType()->isPointerTy()) {
        ctx.fail("invalid longjmp signature (invalid first argument)");
        return;
      }

      if (!func->getArg(1)->getType()->isIntegerTy()) {
        ctx.fail("invalid longjmp signature (invalid second argument)");
        return;
      }

      const auto& layout = ctx.getModule()->getDataLayout();
      auto jmpbuf_ty = getJmpBufType(ctx.getModule()->getContext());

      unsigned jmpbuf_size = layout.getTypeStoreSize(jmpbuf_ty);
      unsigned real_size = layout.getTypeStoreSize(
          func->getArg(0)->getType()->getPointerElementType());

      if (real_size < jmpbuf_size) {
        ctx.fail(fmt::format(
            "platform jmp_buf is too small for caffeine to use: {} > {}",
            real_size, jmpbuf_size));
        return;
      }

      ctx.call_external_function(std::make_unique<LongJmpFrame>(
          std::vector<LLVMValue>(args.begin(), args.end()), func));
    }
  };

} // namespace

std::unique_ptr<ExternalFunction> ExternalFunctions::longjmp() {
  return std::make_unique<LongJmpFunction>();
}

} // namespace caffeine
