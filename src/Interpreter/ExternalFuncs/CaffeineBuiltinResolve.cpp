#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {
namespace {

  class CaffeineBuiltinResolveFunction : public ExternalFunction {
  public:
    void call(llvm::CallBase*, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 2) {
        ctx.fail("invalid caffeine_builtin_resolve signature (invalid number "
                 "of arguments)");
        return;
      }

      if (auto inst = ctx.getCurrentInstruction()) {
        auto call = llvm::dyn_cast<llvm::CallBase>(inst);
        if (!call) {
          ctx.fail("expected a call/invoke instruction");
          return;
        }

        if (call->getType() != call->getArgOperand(0)->getType() ||
            !call->getType()->isPointerTy()) {
          ctx.fail("invalid caffeine_builtin_resolve signature (invalid first "
                   "argument)");
          return;
        }

        if (!call->getArgOperand(1)->getType()->isIntegerTy()) {
          ctx.fail("invalid caffeine_builtin_resolve signature (invalid second "
                   "argument)");
          return;
        }
      }

      const auto& layout = ctx.getModule()->getDataLayout();

      auto mem = args[0].scalar().pointer();
      auto size = UnaryOp::CreateTruncOrZExt(
          Type::int_ty(layout.getPointerSizeInBits(mem.heap())),
          args[1].scalar().expr());

      auto resolved = ctx.resolve_ptr(mem, size, "invalid pointer access");
      ctx.kill();

      for (auto ptr : resolved) {
        auto fork = ctx.fork();

        if (!mem.is_resolved()) {
          fork.context().backprop(mem, ptr);
        }

        fork.add_assertion(ICmpOp::CreateICmpEQ(
            mem.value(fork.context().heaps), ptr.value(fork.context().heaps)));
        fork.jump_return(LLVMValue(ptr));
      }
    }
  };

} // namespace

std::unique_ptr<ExternalFunction>
ExternalFunctions::caffeine_builtin_resolve() {
  return std::make_unique<CaffeineBuiltinResolveFunction>();
}

} // namespace caffeine
