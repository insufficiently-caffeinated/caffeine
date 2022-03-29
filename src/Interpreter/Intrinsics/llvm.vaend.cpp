#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Module.h>

namespace caffeine {

namespace {
  class VaCopyIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function*, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      CAFFEINE_ASSERT(args.size() == 1);
      ctx.jump_return();
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::vaend() {
  return std::make_unique<VaCopyIntrinsic>();
}

} // namespace caffeine
