#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

Z3Model::Z3Model(SolverResult result, z3::context* ctx, z3::model model,
                 const std::unordered_map<std::string, z3::expr>& map)
    : Model(result), ctx(ctx), model(model), constants(map) {}

Value Z3Model::lookup(const Constant& constant) const {
  CAFFEINE_ASSERT(result() == SolverResult::SAT, "Model is not SAT");

  auto it = constants.find(std::string(constant.name()));
  if (it == constants.end()) {
    return Value();
  }

  if (it->second.is_int()) {
    return Value(llvm::APInt(it->second.get_sort().bv_size(),
                             it->second.get_numeral_int()));
  } else {
    return Value(); // I cant find the way to extract fpa
  }
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
  std::unordered_map<std::string, z3::expr> constMap;

  Z3OpVisitor visitor{&ctx, constMap};
  for (Assertion assertion : assertions) {
    if (assertion.is_empty()) {
      continue;
    }

    auto exp = visitor.visit(*assertion.value());
    solver.add(exp);
  }

  if (!extra.is_empty()) {
    solver.add(visitor.visit(*extra.value()));
  }

  auto result = solver.check();

  switch (result) {
  case z3::sat:
    return std::make_unique<Z3Model>(SolverResult::SAT, &ctx,
                                     solver.get_model(), constMap);
  case z3::unsat:
    return std::make_unique<Z3Model>(SolverResult::UNSAT, &ctx,
                                     solver.get_model(), constMap);
  default:
    return std::make_unique<Z3Model>(SolverResult::Unknown, &ctx,
                                     solver.get_model(), constMap);
  }
}

// #########################################################

Z3OpVisitor::Z3OpVisitor(z3::context* ctx,
                         std::unordered_map<std::string, z3::expr>& constMap)
    : ctx(ctx), constMap(constMap) {}

z3::expr Z3OpVisitor::visitConstant(const Constant& op) {
  auto type = op.type();
  std::string name(op.name());

  // Reuse already created constants (otherwise Z3 will view them as different?)
  auto it = constMap.find(name);
  if (it != constMap.end()) {
    // TODO: Ensure that they're the same type?
    return it->second;
  }

  switch (type.kind()) {
  case Type::Kind::Integer: {
    auto expr = ctx->int_const(name.c_str());
    constMap.insert({name, expr});
    return expr;
  }
  case Type::Kind::FloatingPoint: {
    auto expr = ctx->fpa_const(name.c_str(), type.exponent_bits(),
                               type.mantissa_bits());
    constMap.insert({name, expr});
    return expr;
  }
  case Type::Kind::Array: {
    auto expr = ctx->bv_const(name.c_str(), type.bitwidth());
    constMap.insert({name, expr});
    return expr;
  }
  case Type::Kind::Void:
    CAFFEINE_ABORT("Cannot make symbolic void constants");
  case Type::Kind::Pointer:
    CAFFEINE_ABORT("Cannot make symbolic pointer constants");
  case Type::Kind::FunctionPointer:
    CAFFEINE_ABORT("Cannot make symbolic function constants");
  }

  CAFFEINE_UNREACHABLE("Unknown type kind");
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
  // TODO: Reimplement this correctly
  return ctx->fpa_val(op.value().convertToFloat());
}

#define CAFFEINE_BINOP_IMPL(name, op_code)                                     \
  z3::expr Z3OpVisitor::visit##name(const BinaryOp& op) {                      \
    auto lhs = visit(*op.lhs());                                               \
    auto rhs = visit(*op.rhs());                                               \
    return op_code;                                                            \
  }

// clang-format off
CAFFEINE_BINOP_IMPL(Add, lhs + rhs)
CAFFEINE_BINOP_IMPL(Sub, lhs - rhs)
CAFFEINE_BINOP_IMPL(Mul, lhs * rhs)
CAFFEINE_BINOP_IMPL(UDiv, z3::udiv(lhs, rhs))
CAFFEINE_BINOP_IMPL(SDiv, lhs / rhs)
CAFFEINE_BINOP_IMPL(URem, z3::urem(lhs, rhs))
CAFFEINE_BINOP_IMPL(SRem, lhs % rhs)
CAFFEINE_BINOP_IMPL(And, lhs & rhs)
CAFFEINE_BINOP_IMPL(Or, lhs | rhs)
CAFFEINE_BINOP_IMPL(Xor, lhs ^ rhs)
CAFFEINE_BINOP_IMPL(Shl, z3::shl(lhs, rhs))
CAFFEINE_BINOP_IMPL(LShr, z3::lshr(lhs, rhs))
CAFFEINE_BINOP_IMPL(AShr, z3::ashr(lhs, rhs))
CAFFEINE_BINOP_IMPL(FAdd, lhs + rhs)
CAFFEINE_BINOP_IMPL(FSub, lhs - rhs)
CAFFEINE_BINOP_IMPL(FDiv, lhs / rhs)
CAFFEINE_BINOP_IMPL(FRem, lhs % rhs)
#undef CAFFEINE_BINOP_IMPL
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
    CAFFEINE_ABORT("Unknown ICmpOpcode");
  }
}

z3::expr Z3OpVisitor::visitFCmp(const FCmpOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  switch (op.comparison()) {
  case FCmpOpcode::OEQ:
    return lhs == rhs && lhs == lhs && rhs == rhs;
  case FCmpOpcode::OGT:
    return lhs > rhs && lhs == lhs && rhs == rhs;
  case FCmpOpcode::OGE:
    return lhs >= rhs && lhs == lhs && rhs == rhs;
  case FCmpOpcode::OLT:
    return lhs < rhs && lhs == lhs && rhs == rhs;
  case FCmpOpcode::OLE:
    return lhs <= rhs && lhs == lhs && rhs == rhs;
  case FCmpOpcode::ONE:
    return lhs != rhs && lhs == lhs && rhs == rhs;
  case FCmpOpcode::ORD:
    return lhs == lhs && rhs == rhs;
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
    return lhs != lhs || rhs != rhs;
  default:
    CAFFEINE_ABORT("Unknown FCmpOpcode");
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
