#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

Z3Model::Z3Model(SolverResult result, z3::context* ctx, z3::model model)
    : Model(result), ctx(ctx), model(model) {}

ref<Operation> Z3Model::evaluate(const ref<Operation>& expr) const {
  CAFFEINE_ASSERT(result() == SolverResult::SAT, "Model is not SAT");
}

ref<Operation> Z3Model::lookup(const Constant& constant) const {
  CAFFEINE_ASSERT(result() == SolverResult::SAT, "Model is not SAT");

  // TODO convert to operation
}

Z3Solver::Z3Solver() {
  // We want z3 to generate models
  ctx.set("model", true);
  // Automatically select and configure the solver
  ctx.set("auto_config", true);
}

std::unique_ptr<Model> Z3Solver::resolve(std::vector<Assertion>& assertions,
                                         const Assertion& extra) {
  z3::solver solver = z3::tactic(ctx, "default").mk_solver();
}

Z3OpVisitor::Z3OpVisitor(z3::context* ctx, z3::solver* solver)
    : ctx(ctx), solver(solver) {}

z3::expr Z3OpVisitor::visitConstant(const Constant& op) {
  return ctx->real_const(op.name().c_str()); // Is this right?
}

z3::expr Z3OpVisitor::visitConstantInt(const ConstantInt& op) {
  if (op.value().getBitWidth() <= 64) {
    return ctx->bv_val(op.value().getLimitedValue(), op.value().getBitWidth());
  }

  // This isn't particularly efficient. Unfortunately, when it comes
  // to integers larger than uint64_t there's no efficient way to get
  // them into Z3. The options are either
  //  - Convert to base-10 string and use that
  //  - Put every single bit into a separate boolean then load that
  // I've opted to go the string route since it's easier here. Maybe
  // in the future we can get an API for doing this more efficiently
  // added to Z3.
  llvm::SmallString<64> str;
  op.value().toStringUnsigned(str, 10);

  return ctx->bv_val(str.c_str(), op.value().getBitWidth());
}

z3::expr Z3OpVisitor::visitConstantFloat(const ConstantFloat& op) {
  return ctx->fpa_val(op.value().convertToFloat()); // TODO: Is this corret?
}

#define CAFFEINE_OP_IMPL_DELEGATE(name, op_code)                               \
  z3::expr Z3OpVisitor::visit##name(const BinaryOp& op) {                      \
    auto lhs = visit(*op.lhs());                                               \
    auto rhs = visit(*op.rhs());                                               \
    return op_code;                                                            \
  }

// clang-format off
CAFFEINE_OP_IMPL_DELEGATE(Add, lhs + rhs)
CAFFEINE_OP_IMPL_DELEGATE(Sub, lhs - rhs)
CAFFEINE_OP_IMPL_DELEGATE(Mul, lhs * rhs)
CAFFEINE_OP_IMPL_DELEGATE(UDiv, z3::udiv(lhs, rhs))
CAFFEINE_OP_IMPL_DELEGATE(SDiv, lhs / rhs)
CAFFEINE_OP_IMPL_DELEGATE(URem, z3::urem(lhs, rhs))
CAFFEINE_OP_IMPL_DELEGATE(SRem, lhs % rhs)
CAFFEINE_OP_IMPL_DELEGATE(And, lhs & rhs)
CAFFEINE_OP_IMPL_DELEGATE(Or, lhs | rhs)
CAFFEINE_OP_IMPL_DELEGATE(Xor, lhs ^ rhs)
CAFFEINE_OP_IMPL_DELEGATE(Shl, z3::shl(lhs, rhs))
CAFFEINE_OP_IMPL_DELEGATE(LShr, z3::lshr(lhs, rhs))
CAFFEINE_OP_IMPL_DELEGATE(AShr, z3::ashr(lhs, rhs))
CAFFEINE_OP_IMPL_DELEGATE(FAdd, lhs + rhs) // I did not see specific functions for floats?
CAFFEINE_OP_IMPL_DELEGATE(FSub, lhs - rhs)
CAFFEINE_OP_IMPL_DELEGATE(FDiv, lhs / rhs)
CAFFEINE_OP_IMPL_DELEGATE(FRem, lhs % rhs)
#undef CAFFEINE_OP_IMPL_DELEGATE
// clang-format on

z3::expr Z3OpVisitor::visitICmp(const ICmpOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  switch (op.comparison()) {
  case ICmpOpcode::EQ:
    return lhs == rhs;
  case ICmpOpcode::NE:
    return lhs != rhs;
  case ICmpOpcode::UGT:
    return z3::ugt(lhs, rhs);
  case ICmpOpcode::UGE:
    return z3::uge(lhs, rhs);
  case ICmpOpcode::ULT:
    return z3::ult(lhs, rhs);
  case ICmpOpcode::ULE:
    return z3::ule(lhs, rhs);
  case ICmpOpcode::SGT:
    return lhs > rhs;
  case ICmpOpcode::SGE:
    return lhs >= rhs;
  case ICmpOpcode::SLT:
    return lhs < rhs;
  case ICmpOpcode::SLE:
    return lhs <= rhs;
  default:
    CAFFEINE_ASSERT(false, "Unknown ICmpOpcode");
  }
}

z3::expr Z3OpVisitor::visitFCmp(const FCmpOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  // TODO: Need to fix ordered checks to have an is NaN check
  switch (op.comparison()) {
  case FCmpOpcode::OEQ:
    return lhs == rhs;
  case FCmpOpcode::OGT:
    return lhs > rhs;
  case FCmpOpcode::OGE:
    return lhs >= rhs;
  case FCmpOpcode::OLT:
    return lhs < rhs;
  case FCmpOpcode::OLE:
    return lhs <= rhs;
  case FCmpOpcode::ONE:
    return lhs != rhs;
  case FCmpOpcode::ORD:
    return lhs;
  case FCmpOpcode::UEQ:
    return lhs == rhs;
  case FCmpOpcode::UGT:
    return lhs > rhs;
  case FCmpOpcode::UGE:
    return lhs >= rhs;
  case FCmpOpcode::ULT:
    return lhs < rhs;
  case FCmpOpcode::ULE:
    return lhs <= rhs;
  case FCmpOpcode::UNE:
    return lhs != rhs;
  case FCmpOpcode::UNO:
    return rhs;
  default:
    CAFFEINE_ASSERT(false, "Unknown FCmpOpcode");
  }
}

z3::expr Z3OpVisitor::visitNot(const UnaryOp& op) {
  auto val = visit(*op.operand());
  return ~val;
}

z3::expr Z3OpVisitor::visitFNeg(const UnaryOp& op) {
  auto val = visit(*op.operand());
  return ~val;
}

} // namespace caffeine
