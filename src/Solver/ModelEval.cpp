#include "caffeine/Solver/ModelEval.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Assert.h"
#include "include/caffeine/IR/EGraph.h"
#include <fmt/format.h>
#include <fmt/ostream.h>

namespace caffeine {

ModelEvaluator::ModelEvaluator(const Model* model, const EGraph* egraph)
    : model(model), egraph(egraph) {
  CAFFEINE_ASSERT(model);
  CAFFEINE_ASSERT(egraph);
}

Value ModelEvaluator::visitOperation(const Operation& op) {
  CAFFEINE_ABORT(fmt::format("Unknown operation: {}", op.opcode_name()));
}

Value ModelEvaluator::visitConstant(const Constant& op) {
  Value value = model->lookup(op.symbol());

  if (value.type().is_void()) {
    const Type& srcty = op.type();

    // For some symbols that are not used within the model we can get away
    // with creating some default values
    if (srcty.is_int())
      return Value(llvm::APInt::getNullValue(srcty.bitwidth()));
    if (srcty.is_float()) {
      if (auto semantics = srcty.llvm_flt_semantics())
        return Value(llvm::APFloat::getZero(*semantics));
    }
  }

  CAFFEINE_ASSERT(
      value.type() != Type::void_ty(),
      fmt::format("Symbol {} was not contained in the model", op.symbol()));
  return value;
}

Value ModelEvaluator::visitConstantArray(const ConstantArray& op) {
  size_t size = visit(*op.size()).apint().getLimitedValue(SIZE_MAX);
  Value value = model->lookup(op.symbol(), size);
  CAFFEINE_ASSERT(
      value.type() != Type::void_ty(),
      fmt::format("Symbol {} was not contained in the model", op.symbol()));
  return value;
}

Value ModelEvaluator::visitConstantInt(const ConstantInt& op) {
  return op.value();
}
Value ModelEvaluator::visitConstantFloat(const ConstantFloat& op) {
  return op.value();
}

Value ModelEvaluator::visitFixedArray(const FixedArray& op) {
  auto size_val = op.size();
  uint64_t size = visit(*size_val).apint().getLimitedValue();
  uint32_t bitwidth = size_val->type().bitwidth();

  CAFFEINE_ASSERT(size <= (uint64_t)SIZE_MAX);

  std::vector<char> bytes;
  bytes.reserve(size);

  for (uint64_t i = 0; i < size; ++i) {
    auto val = visit(*op.data()[i]).apint();

    CAFFEINE_ASSERT(val.getBitWidth() == 8);

    bytes.push_back(static_cast<char>(
        val.getLimitedValue(std::numeric_limits<uint8_t>::max())));
  }

  return Value(SharedArray(std::move(bytes)), Type::int_ty(bitwidth));
}

#define VISIT_BINOP(opcode, func)                                              \
  Value ModelEvaluator::visit##opcode(const BinaryOp& op) {                    \
    return Value::func(visit(op[0]), visit(op[1]));                            \
  }                                                                            \
  static_assert(true)

VISIT_BINOP(Add, bvadd);
VISIT_BINOP(Sub, bvsub);
VISIT_BINOP(Mul, bvmul);
VISIT_BINOP(UDiv, bvudiv);
VISIT_BINOP(SDiv, bvsdiv);
VISIT_BINOP(URem, bvurem);
VISIT_BINOP(SRem, bvsrem);
VISIT_BINOP(And, bvand);
VISIT_BINOP(Or, bvor);
VISIT_BINOP(Xor, bvxor);
VISIT_BINOP(Shl, bvshl);
VISIT_BINOP(LShr, bvlshr);
VISIT_BINOP(AShr, bvashr);
VISIT_BINOP(FAdd, fadd);
VISIT_BINOP(FSub, fsub);
VISIT_BINOP(FMul, fmul);
VISIT_BINOP(FDiv, fdiv);
VISIT_BINOP(FRem, frem);

#define VISIT_UNOP(opcode, func)                                               \
  Value ModelEvaluator::visit##opcode(const UnaryOp& op) {                     \
    return Value::func(visit(op[0]));                                          \
  }                                                                            \
  static_assert(true)

VISIT_UNOP(Not, bvnot);
VISIT_UNOP(FNeg, fneg);
VISIT_UNOP(FIsNaN, FIsNaN);

Value ModelEvaluator::visitSelect(const SelectOp& select) {
  return visit(select[0]).apint() == 1 ? visit(select[1]) : visit(select[2]);
}

Value ModelEvaluator::visitTrunc(const UnaryOp& op) {
  return Value::trunc(visit(op[0]), op.type().bitwidth());
}
Value ModelEvaluator::visitZExt(const UnaryOp& op) {
  return Value::zext(visit(op[0]), op.type().bitwidth());
}
Value ModelEvaluator::visitSExt(const UnaryOp& op) {
  return Value::sext(visit(op[0]), op.type().bitwidth());
}

Value ModelEvaluator::visitBitcast(const UnaryOp& op) {
  return Value::bitcast(visit(op[0]), op.type());
}

Value ModelEvaluator::visitFpTrunc(const UnaryOp&) {
  CAFFEINE_UNIMPLEMENTED();
}
Value ModelEvaluator::visitFpExt(const UnaryOp&) {
  CAFFEINE_UNIMPLEMENTED();
}
Value ModelEvaluator::visitFpToUI(const UnaryOp&) {
  CAFFEINE_UNIMPLEMENTED();
}
Value ModelEvaluator::visitFpToSI(const UnaryOp&) {
  CAFFEINE_UNIMPLEMENTED();
}
Value ModelEvaluator::visitUIToFp(const UnaryOp&) {
  CAFFEINE_UNIMPLEMENTED();
}
Value ModelEvaluator::visitSIToFp(const UnaryOp&) {
  CAFFEINE_UNIMPLEMENTED();
}

Value ModelEvaluator::visitEGraphNode(const EGraphNode& op) {
  return visit(*egraph->extract(op));
}

Value ModelEvaluator::visitAlloc(const AllocOp& op) {
  auto size = visit(*op.size()).apint().getLimitedValue();
  CAFFEINE_ASSERT(size <= (uint64_t)SIZE_MAX);

  std::vector<char> bytes;
  bytes.resize(size, 0);

  return Value(SharedArray(std::move(bytes)),
               Type::int_ty(op.size()->type().bitwidth()));
}

Value ModelEvaluator::visitLoad(const LoadOp& op) {
  return Value::load(visit(op[0]), visit(op[1]));
}
Value ModelEvaluator::visitStore(const StoreOp& op) {
  return Value::store(visit(op[0]), visit(op[1]), visit(op[2]));
}

Value ModelEvaluator::visitFunctionObject(const FunctionObject&) {
  CAFFEINE_ABORT("Attempted to evaluate a function object directly?");
}

Value ModelEvaluator::visitUndef(const Undef&) {
  CAFFEINE_ABORT("Attempted to evaluate an undef value");
}

Value ModelEvaluator::visitICmp(const ICmpOp& op) {
  Value lhs = visit(op[0]);
  Value rhs = visit(op[1]);

  switch (op.comparison()) {
  case ICmpOpcode::EQ:
    return Value(lhs == rhs);
  case ICmpOpcode::NE:
    return Value(lhs != rhs);
  default:
    CAFFEINE_UNIMPLEMENTED();
  }
}

Value ModelEvaluator::visitFCmp(const FCmpOp&) {
  CAFFEINE_UNIMPLEMENTED();
}

} // namespace caffeine
