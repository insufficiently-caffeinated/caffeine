#include "caffeine/Interpreter/ExprEval.h"

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Value.h"
#include <fmt/format.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

namespace caffeine {

namespace {
  OpRef scalarize(const LLVMScalar& scalar, const MemHeap& heap) {
    if (scalar.is_expr())
      return scalar.expr();
    return scalar.pointer().value(heap);
  }
} // namespace

ExprEvaluator::Unevaluatable::Unevaluatable(llvm::Value* expr,
                                            const char* context)
    : expr_(expr), context_(context) {
  CAFFEINE_ASSERT(expr != nullptr);
}

const char* ExprEvaluator::Unevaluatable::what() const throw() {
  if (msg_cache_.empty()) {
    std::string printed;
    llvm::raw_string_ostream os{printed};
    expr_->print(os, true);

    msg_cache_ = fmt::format(
        "Unable to evaluate expression: {}. Expression: {}", context_, printed);
  }

  return msg_cache_.c_str();
}
llvm::Value* ExprEvaluator::Unevaluatable::expr() const {
  return expr_;
}

ExprEvaluator::ExprEvaluator(Context* ctx, Options options)
    : ctx(ctx), options(options) {}

LLVMValue ExprEvaluator::visit(llvm::Value* val) {
  const auto& frame = ctx->stack_top();
  auto it = frame.variables.find(val);
  if (it != frame.variables.end())
    return static_cast<LLVMValue>(it->second);

  if (auto* inst = llvm::dyn_cast<llvm::Instruction>(val))
    return BaseType::visit(inst);

  std::string msg = "Unsupported expression: ";
  llvm::raw_string_ostream os{msg};
  val->print(os, true);

  CAFFEINE_ABORT(msg);
}
LLVMValue ExprEvaluator::visit(llvm::Value& val) {
  return visit(&val);
}

LLVMValue ExprEvaluator::visitInstruction(llvm::Instruction& inst) {
  std::string msg = "";
  llvm::raw_string_ostream os{msg};
  inst.print(os, true);

  CAFFEINE_ABORT(
      fmt::format("Instruction '{}' not implemented! Full expression: {}",
                  inst.getOpcodeName(), msg));
}

/*********************************************
 * InstVisitor override methods              *
 *********************************************/

#define DECL_BINARY_OP_VISIT(opcode)                                           \
  LLVMValue ExprEvaluator::visit##opcode(llvm::BinaryOperator& op) {           \
    LLVMValue lhs = visit(op.getOperand(0));                                   \
    LLVMValue rhs = visit(op.getOperand(1));                                   \
                                                                               \
    return transform_elements(                                                 \
        [&](const LLVMScalar& lhs, const LLVMScalar& rhs) -> LLVMScalar {      \
          const auto& heap = ctx->heap();                                      \
          return BinaryOp::Create##opcode(scalarize(lhs, heap),                \
                                          scalarize(rhs, heap));               \
        },                                                                     \
        lhs, rhs);                                                             \
  }                                                                            \
  static_assert(true)

#define DECL_CAST_OP_VISIT(opcode, castname)                                   \
  LLVMValue ExprEvaluator::visit##opcode(llvm::CastInst& op) {                 \
    LLVMValue value = visit(op.getOperand(0));                                 \
    Type type = Type::from_llvm(op.getType());                                 \
                                                                               \
    return transform_elements(                                                 \
        [&](const LLVMScalar& value) -> LLVMScalar {                           \
          return UnaryOp::Create##castname(type, value.expr());                \
        },                                                                     \
        value);                                                                \
  }                                                                            \
  static_assert(true)

DECL_BINARY_OP_VISIT(Add);
DECL_BINARY_OP_VISIT(Sub);
DECL_BINARY_OP_VISIT(Mul);
DECL_BINARY_OP_VISIT(UDiv);
DECL_BINARY_OP_VISIT(SDiv);
DECL_BINARY_OP_VISIT(URem);
DECL_BINARY_OP_VISIT(SRem);

DECL_BINARY_OP_VISIT(Shl);
DECL_BINARY_OP_VISIT(LShr);
DECL_BINARY_OP_VISIT(AShr);
DECL_BINARY_OP_VISIT(And);
DECL_BINARY_OP_VISIT(Or);
DECL_BINARY_OP_VISIT(Xor);

DECL_BINARY_OP_VISIT(FAdd);
DECL_BINARY_OP_VISIT(FSub);
DECL_BINARY_OP_VISIT(FMul);
DECL_BINARY_OP_VISIT(FDiv);

DECL_CAST_OP_VISIT(Trunc, Trunc);
DECL_CAST_OP_VISIT(SExt, SExt);
DECL_CAST_OP_VISIT(ZExt, ZExt);
DECL_CAST_OP_VISIT(FPTrunc, FpTrunc);
DECL_CAST_OP_VISIT(FPExt, FpExt);
DECL_CAST_OP_VISIT(UIToFP, UIToFp);
DECL_CAST_OP_VISIT(SIToFP, SIToFp);

LLVMValue ExprEvaluator::visitFNeg(llvm::UnaryOperator& op) {
  LLVMValue value = visit(op.getOperand(0));

  return transform_elements(
      [&](const LLVMScalar& value) -> LLVMScalar {
        return UnaryOp::CreateFNeg(value.expr());
      },
      value);
}

} // namespace caffeine
