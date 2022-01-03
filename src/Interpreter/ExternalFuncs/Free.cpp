#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {
namespace {

  class CaffeineFreeFunction : public ExternalFunction {
  public:
    void call(llvm::CallBase*, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 1) {
        ctx.fail(
            "invalid caffeine_free signature (invalid number of arguments)");
        return;
      }

      auto inst = ctx.getCurrentInstruction();
      CAFFEINE_ASSERT(inst,
                      "caffeine_free called without a current instruction");

      auto call = llvm::dyn_cast<llvm::CallBase>(inst);
      if (!call) {
        ctx.fail("caffeine_free called from a non-call/invoke instruction");
        return;
      }

      if (!call->getType()->isVoidTy()) {
        ctx.fail("invalid caffeine_free signature (invalid return type)");
        return;
      }

      if (!call->getArgOperand(0)->getType()->isPointerTy()) {
        ctx.fail("invalid caffeine_free signature (invalid first argument)");
        return;
      }

      auto memptr = args[0].scalar().pointer();
      const auto& layout = ctx.getModule()->getDataLayout();
      unsigned address_space = memptr.heap();
      unsigned ptr_width = layout.getPointerSizeInBits(address_space);

      ctx.assert_ptr_starts_allocation(memptr,
                                       "free called with an invalid pointer");

      auto resolved =
          ctx.resolve_ptr(memptr, ConstantInt::CreateZero(ptr_width),
                          "free called with a pointer not allocated by malloc");

      ctx.kill();
      for (auto ptr : resolved) {
        auto fork = ctx.fork();
        fork.add_assertion(
            ICmpOp::CreateICmpEQ(memptr.value(fork.context().heaps),
                                 ptr.value(fork.context().heaps)));
        fork.context().heaps[ptr.heap()].deallocate(ptr.alloc());
      }
    }
  };

} // namespace

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_free() {
  return std::make_unique<CaffeineFreeFunction>();
}

} // namespace caffeine
