#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Interpreter/StackFrame.h"
#include <caffeine/Solver/Solver.h>
#include <memory>

namespace caffeine {

namespace {
  class Memset : public ExternalStackFrameMixin<Memset> {
  public:
    using ExternalStackFrameMixin<Memset>::ExternalStackFrameMixin;

    void step(InterpreterContext& ctx) override {
      const OpRef& val = args.at(1).scalar().expr();
      const OpRef& len = args.at(2).scalar().expr();

      switch (state) {
      case Entry: {
        auto resolved = ctx.resolve_ptr(args.at(0).scalar().pointer(), len,
                                        "invalid pointer write");

        ctx.fork_external<Memset>(
            resolved,
            [&](InterpreterContext& ctx, Memset* frame, Pointer& resolved) {
              frame->offset = ctx.createConstantZero(len->type().bitwidth());
              frame->dst = std::move(resolved);
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
        Allocation* alloc = ctx.ptr_allocation(*dst);

        alloc->overwrite(ctx.createStore(
            alloc->data(), ctx.createAdd(dst->offset(), offset), val));
        offset = ctx.createAdd(offset, 1);
        state = Head;
        break;
      }
      }
    }

  private:
    enum { Entry, Head, Body } state = Entry;

    std::optional<Pointer> dst;
    OpRef offset;
  };

  class MemsetIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const {
      if (args.size() != 4) {
        ctx.fail("invalid llvm.memset signature (invalid number of arguments)");
        return;
      }

      ctx.call_external_function(std::make_unique<Memset>(
          std::vector<LLVMValue>(args.begin(), args.end()), func));
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::memset() {
  return std::make_unique<MemsetIntrinsic>();
}

} // namespace caffeine
