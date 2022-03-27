#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Module.h>

namespace caffeine {

namespace {
  // We implement va_copy by just using memcpy to move the pointer
  class VaCopyIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      CAFFEINE_ASSERT(args.size() == 2);

      const auto& layout = ctx.getModule()->getDataLayout();
      auto memcpy = ctx.caffeine().intrinsic(llvm::Intrinsic::memcpy);

      llvm::SmallVector<LLVMValue, 3> memcpy_args{
          args[0], args[1],
          LLVMValue(ctx.createConstantInt(layout.getPointerSizeInBits(0),
                                          layout.getPointerSize(0)))};
      memcpy->call(func, ctx, memcpy_args);
    }
  };
} // namespace


std::unique_ptr<ExternalFunction> Intrinsics::vacopy() {
  return std::make_unique<VaCopyIntrinsic>();
}

} // namespace caffeine
