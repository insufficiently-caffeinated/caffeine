#include "caffeine/IR/Value.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

namespace {
  class UMulWithOverflowIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function*, InterpreterContext& ctx,
              Span<LLVMValue> args) const {
      CAFFEINE_ASSERT(args.size() == 2);

      auto values = transform_exprs(
          [](const auto& a, const auto& b) {
            return BinaryOp::CreateMul(a, b);
          },
          args[0], args[1]);
      auto overflow = transform_exprs(
          [&](const auto& a, const auto& b) {
            return BinaryOp::CreateUMulOverflow(a, b);
          },
          args[0], args[1]);

      ctx.jump_return(LLVMValue(llvm::ArrayRef<LLVMValue>{values, overflow}));
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::umul_with_overflow() {
  return std::make_unique<UMulWithOverflowIntrinsic>();
}

} // namespace caffeine
