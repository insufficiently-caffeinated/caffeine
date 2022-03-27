#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Module.h>

namespace caffeine {

namespace {
  class VaStartIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function*, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      CAFFEINE_ASSERT(args.size() == 1);
      CAFFEINE_ASSERT(args[0].is_scalar());
      CAFFEINE_ASSERT(args[0].scalar().is_pointer());

      const auto& layout = ctx.getModule()->getDataLayout();
      const auto& unresolved = args[0].scalar().pointer();

      auto value = ctx.createConstantZero(layout.getPointerSizeInBits(0));

      auto resolved =
          ctx.resolve_ptr(unresolved, value->type().byte_size(layout),
                          "invalid pointer write in va_start");
      ctx.kill();
      for (const Pointer& ptr : resolved) {
        auto fork = ctx.fork();
        fork.add_assertion(fork.createICmpEQ(ptr, unresolved));
        auto alloc = ctx.ptr_allocation(ptr);

        alloc->write(value, value, layout);
      }
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::vastart() {
  return std::make_unique<VaStartIntrinsic>();
}

} // namespace caffeine
