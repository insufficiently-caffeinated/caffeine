#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

Z3Model::Z3Model(SolverResult result, z3::context *ctx, z3::model model)
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

Z3OpVisitor::Z3OpVisitor(z3::context* ctx, z3::solver* solver) : ctx(ctx), solver(solver) {}

z3::expr Z3OpVisitor::visitConstant(Constant& op) {

}

z3::expr Z3OpVisitor::visitConstantInt(ConstantInt& op) {
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

z3::expr Z3OpVisitor::visitConstantFloat(ConstantFloat& op) {
  return ctx->fpa_val(op.value().convertToFloat()); // TODO: Is this corret?
}

z3::expr Z3OpVisitor::visitAdd(BinaryOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  return lhs + rhs;
}

z3::expr Z3OpVisitor::visitSub(BinaryOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  return lhs - rhs;
}

z3::expr Z3OpVisitor::visitMul(BinaryOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());
}

} // namespace caffeine
