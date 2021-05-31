#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

ExecutionResult
Interpreter::visitSMulWithOverflowIntrinsic(llvm::IntrinsicInst& inst) {
  auto a = ctx->lookup(inst.getArgOperand(0));
  auto b = ctx->lookup(inst.getArgOperand(1));

  auto vals = transform_exprs(
      [&](const auto& a, const auto& b) { return BinaryOp::CreateMul(a, b); },
      a, b);
  auto overflow = transform_exprs(
      [&](const auto& a, const auto& b) {
        return BinaryOp::CreateSMulOverflow(a, b);
      },
      a, b);

  ctx->stack_top().insert(&inst,
                          LLVMValue(llvm::ArrayRef<LLVMValue>{vals, overflow}));

  return ExecutionResult::Continue;
}

} // namespace caffeine
