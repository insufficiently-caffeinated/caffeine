#include "caffeine/IR/Value.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

namespace {
  class AbsIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const {
      CAFFEINE_ASSERT(args.size() == 2);
      CAFFEINE_ASSERT(args[0].is_scalar(),
                      "Vector operation not supported yet");

      auto should_poison = args[1].scalar().expr();
      auto val_to_abs = args[0].scalar().expr();
      auto ret_ty = func->getReturnType();

      auto min_val = ConstantInt::Create(
          llvm::APInt::getSignedMinValue(ret_ty->getIntegerBitWidth()));
      auto is_min = ICmpOp::CreateICmpEQ(val_to_abs, min_val);

      Assertion will_succeed = Assertion(BinaryOp::CreateOr(
          ctx.createNot(should_poison), UnaryOp::CreateNot(is_min)));

      ctx.assert_or_fail(will_succeed,
                         "Taking absolute number of minimum value");

      auto result = SelectOp::Create(
          is_min, min_val,
          SelectOp::Create(ICmpOp::CreateICmpSLT(val_to_abs, 0),
                           BinaryOp::CreateMul(-1, val_to_abs), val_to_abs));

      ctx.jump_return(LLVMValue(result));
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::abs() {
  return std::make_unique<AbsIntrinsic>();
}

} // namespace caffeine
