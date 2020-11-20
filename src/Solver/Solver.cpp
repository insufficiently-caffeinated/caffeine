#include "caffeine/Solver/Solver.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Value.h"
#include "caffeine/IR/Visitor.h"

#include <fmt/format.h>

namespace caffeine {

class ExprEvaluator : public ConstOpVisitor<ExprEvaluator, Value> {
public:
  ExprEvaluator(const Model* model) : model_(model) {}

  Value visitOperation(const Operation& op) {
    CAFFEINE_ABORT(fmt::format("Unknown operation: {}", op.opcode_name()));
  }

  Value visitConstant(const Constant& op) {
    return model_->lookup(op);
  }
  Value visitConstantInt(const ConstantInt& op) {
    return op.value();
  }
  Value visitConstantFloat(const ConstantFloat& op) {
    return op.value();
  }

#define DECL_BINOP(opcode, func)                                               \
  Value visit##opcode(const BinaryOp& op) {                                    \
    return Value::func(visit(op[0]), visit(op[1]));                            \
  }                                                                            \
  static_assert(true)

  DECL_BINOP(Add, bvadd);
  DECL_BINOP(Sub, bvsub);
  DECL_BINOP(Mul, bvmul);
  DECL_BINOP(UDiv, bvudiv);
  DECL_BINOP(SDiv, bvsdiv);
  DECL_BINOP(URem, bvurem);
  DECL_BINOP(SRem, bvsrem);
  DECL_BINOP(And, bvand);
  DECL_BINOP(Or, bvor);
  DECL_BINOP(Xor, bvxor);
  DECL_BINOP(Shl, bvshl);
  DECL_BINOP(LShr, bvlshr);
  DECL_BINOP(AShr, bvashr);
  DECL_BINOP(FAdd, fadd);
  DECL_BINOP(FSub, fsub);
  DECL_BINOP(FMul, fmul);
  DECL_BINOP(FDiv, fdiv);
  DECL_BINOP(FRem, frem);

  Value visitNot(const UnaryOp& op) {
    return Value::bvnot(visit(op[0]));
  }
  Value visitFNeg(const UnaryOp& op) {
    return Value::fneg(visit(op[0]));
  }

  Value visitSelectOp(const SelectOp& select) {
    return Value::select(visit(select[0]), visit(select[1]), visit(select[2]));
  }

private:
  const Model* model_;
};

Model::Model(SolverResult result) : result_(result) {}

Value Model::evaluate(const Operation& expr) const {
  return ExprEvaluator(this).visit(expr);
}

SolverResult Solver::check(std::vector<Assertion>& assertions) {
  return check(assertions, Assertion());
}

SolverResult Solver::check(std::vector<Assertion>& assertions,
                           const Assertion& extra) {
  return resolve(assertions, extra)->result();
}

std::unique_ptr<Model> Solver::resolve(std::vector<Assertion>& assertions) {
  return resolve(assertions, Assertion());
}

} // namespace caffeine
