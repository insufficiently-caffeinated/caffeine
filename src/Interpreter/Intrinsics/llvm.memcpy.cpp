#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Interpreter/StackFrame.h"
#include <memory>

namespace caffeine {

namespace {
  class Memcpy : public ExternalStackFrameMixin<Memcpy> {
  public:
    using ExternalStackFrameMixin<Memcpy>::ExternalStackFrameMixin;

    void step(InterpreterContext& ctx) override {
      const OpRef& len = args.at(2).scalar().expr();

      switch (state) {
      case Start: {
        const Pointer& src = args.at(0).scalar().pointer();
        const Pointer& dst = args.at(1).scalar().pointer();

        offset = ctx.createConstantZero(len->type().bitwidth());
        state = ResolveDst;

        // Don't need to check overlap if the pointers belong to different
        // address spaces.
        if (func->getArg(0)->getType()->getPointerAddressSpace() !=
            func->getArg(1)->getType()->getPointerAddressSpace()) {
          break;
        }

        auto ldst = ctx.createTruncOrZExt(dst.offset()->type(), len);
        auto lsrc = ctx.createTruncOrZExt(src.offset()->type(), len);

        if (src.is_resolved() && dst.is_resolved()) {
          if (src.alloc() != dst.alloc())
            break;

          auto assertion =
              ctx.createOr(ctx.createICmpULE(ctx.createAdd(dst.offset(), ldst),
                                             src.offset()),
                           ctx.createICmpULE(ctx.createAdd(src.offset(), lsrc),
                                             dst.offset()));
          ctx.assert_or_fail(assertion,
                             "memcpy called with overlapping pointer ranges");
        } else {
          auto pdst = ctx.ptr_value(dst);
          auto psrc = ctx.ptr_value(src);

          auto assertion =
              ctx.createOr(ctx.createICmpULE(ctx.createAdd(pdst, ldst), psrc),
                           ctx.createICmpULE(ctx.createAdd(psrc, lsrc), pdst));
          ctx.assert_or_fail(assertion,
                             "memcpy called with overlapping pointer ranges");
        }

        break;
      }
      case ResolveDst: {
        auto resolved = ctx.resolve_ptr(args.at(0).scalar().pointer(), len,
                                        "invalid pointer write");

        ctx.fork_external<Memcpy>(
            resolved,
            [&](InterpreterContext&, Memcpy* frame, Pointer& resolved) {
              frame->dst = std::move(resolved);
              frame->state = ResolveSrc;
            });
        break;
      }
      case ResolveSrc: {
        auto resolved = ctx.resolve_ptr(args.at(1).scalar().pointer(), len,
                                        "invalid pointer read");

        ctx.fork_external<Memcpy>(
            resolved,
            [&](InterpreterContext&, Memcpy* frame, Pointer& resolved) {
              frame->src = std::move(resolved);
              frame->state = Head;
            });
        break;
      }
      case Head: {
        Assertion cond = ctx.createICmpULT(offset, len);
        auto is_t = ctx.check(cond);
        auto is_f = ctx.check(!cond);

        if (is_f != SolverResult::UNSAT) {
          auto fork = ctx.fork();
          fork.add_assertion(ctx.createICmpEQ(offset, len));
          fork.function_return();
        }

        if (is_t != SolverResult::UNSAT) {
          state = Body;
        } else {
          ctx.kill();
        }

        break;
      }
      case Body: {
        Allocation* asrc = ctx.ptr_allocation(*src);
        Allocation* adst = ctx.ptr_allocation(*dst);

        auto val =
            ctx.createLoad(asrc->data(), ctx.createAdd(src->offset(), offset));
        auto data = ctx.createStore(adst->data(),
                                    ctx.createAdd(dst->offset(), offset), val);

        adst->overwrite(std::move(data));
        offset = ctx.createAdd(offset, 1);

        state = Head;
        break;
      }
      }
    }

  private:
    enum { Start, ResolveDst, ResolveSrc, Head, Body } state = Start;

    OpRef offset;
    std::optional<Pointer> dst;
    std::optional<Pointer> src;
  };

  class MemcpyIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 4) {
        ctx.fail("invalid llvm.memcpy signature (invalid number of arguments)");
        return;
      }

      ctx.call_external_function(std::make_unique<Memcpy>(
          std::vector<LLVMValue>(args.begin(), args.end()), func));
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::memcpy() {
  return std::make_unique<MemcpyIntrinsic>();
}

} // namespace caffeine
