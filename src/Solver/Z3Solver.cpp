#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

#include <climits>
#include <fmt/format.h>

namespace caffeine {

static llvm::APInt z3_to_apint(const z3::expr& expr) {
  CAFFEINE_ASSERT(expr.is_bv());

  unsigned bitwidth = expr.get_sort().bv_size();

  try {
    return llvm::APInt(bitwidth, expr.get_numeral_uint64());
  } catch (z3::exception&) {
    auto decimal = expr.get_decimal_string(INT_MAX);
    return llvm::APInt(bitwidth, decimal, 10);
  }
}

static z3::expr bool_to_bv(const z3::expr& expr) {
  CAFFEINE_ASSERT(expr.is_bool());

  auto& ctx = expr.ctx();
  return z3::ite(expr, ctx.bv_val(1, 1), ctx.bv_val(0, 1));
}

static z3::expr bv_to_bool(const z3::expr& expr) {
  CAFFEINE_ASSERT(expr.is_bv() && expr.get_sort().bv_size() == 1);
  return expr == 1;
}

static z3::expr normalize_to_bool(const z3::expr& expr) {
  if (expr.is_bv())
    return bv_to_bool(expr);
  return expr;
}

static z3::expr normalize_to_int(const z3::expr& expr) {
  auto sort = expr.get_sort();

  if (sort.is_bv() && sort.bv_size() == 1)
    return expr == 1;

  return expr;
}

class EmptyModel : public Model {
public:
  EmptyModel(SolverResult result) : Model(result) {
    CAFFEINE_ASSERT(result != SolverResult::SAT);
  }

  Value lookup(const Constant&) const override {
    CAFFEINE_ABORT("Model was empty");
  }
};

/***************************************************
 * Z3Model                                         *
 ***************************************************/
Z3Model::Z3Model(SolverResult result, z3::context* ctx, z3::model model,
                 const std::unordered_map<std::string, z3::expr>& map)
    : Model(result), ctx(ctx), model(model), constants(map) {}

Value Z3Model::lookup(const Constant& constant) const {
  CAFFEINE_ASSERT(result() == SolverResult::SAT, "Model is not SAT");

  auto it = constants.find(std::string(constant.name()));
  if (it == constants.end()) {
    return Value();
  }

  auto evaluated = model.eval(it->second, true);

  if (evaluated.is_bv()) {
    return Value(z3_to_apint(evaluated));
  } else {
    CAFFEINE_ABORT("FPA numerals are not supported right now");
  }
}

/***************************************************
 * Z3Solver                                        *
 ***************************************************/
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
    solver.add(normalize_to_bool(exp));
  }

  if (!extra.is_empty()) {
    auto exp = visitor.visit(*extra.value());
    solver.add(normalize_to_bool(exp));
  }

  auto result = solver.check();

  switch (result) {
  case z3::sat:
    return std::make_unique<Z3Model>(SolverResult::SAT, &ctx,
                                     solver.get_model(), constMap);

  case z3::unsat:
    return std::make_unique<EmptyModel>(SolverResult::UNSAT);

  default:
    return std::make_unique<EmptyModel>(SolverResult::Unknown);
  }
}

/***************************************************
 * Z3OpVisitor                                     *
 ***************************************************/
Z3OpVisitor::Z3OpVisitor(z3::context* ctx,
                         std::unordered_map<std::string, z3::expr>& constMap)
    : ctx(ctx), constMap(constMap) {}

z3::expr Z3OpVisitor::visitOperation(const Operation& op) {
  CAFFEINE_ABORT(fmt::format("Z3Solver does not have support for opcode {}",
                             op.opcode_name()));
}

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
    auto expr = ctx->bv_const(name.c_str(), type.bitwidth());
    constMap.insert({name, expr});
    std::cout << "v = " << expr << std::endl;
    return expr;
  }
  case Type::Kind::FloatingPoint: {
    auto expr = ctx->fpa_const(name.c_str(), type.exponent_bits(),
                               type.mantissa_bits());
    constMap.insert({name, expr});
    return expr;
  }
  case Type::Kind::Array: {
    CAFFEINE_ABORT("Symbolic arrays are unimplemented");
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
CAFFEINE_BINOP_IMPL(FMul, lhs * rhs)
CAFFEINE_BINOP_IMPL(FDiv, lhs / rhs)
CAFFEINE_BINOP_IMPL(FRem, lhs % rhs)
#undef CAFFEINE_BINOP_IMPL
// clang-format on

z3::expr Z3OpVisitor::visitICmp(const ICmpOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  z3::expr expr = z3::expr(lhs.ctx(), nullptr);

  switch (op.comparison()) {
  case ICmpOpcode::EQ:
    expr = lhs == rhs;
    break;
  case ICmpOpcode::NE:
    expr = lhs != rhs;
    break;
  case ICmpOpcode::UGT:
    expr = z3::ugt(lhs, rhs);
    break;
  case ICmpOpcode::UGE:
    expr = z3::uge(lhs, rhs);
    break;
  case ICmpOpcode::ULT:
    expr = z3::ult(lhs, rhs);
    break;
  case ICmpOpcode::ULE:
    expr = z3::ule(lhs, rhs);
    break;
  case ICmpOpcode::SGT:
    expr = lhs > rhs;
    break;
  case ICmpOpcode::SGE:
    expr = lhs >= rhs;
    break;
  case ICmpOpcode::SLT:
    expr = lhs < rhs;
    break;
  case ICmpOpcode::SLE:
    expr = lhs <= rhs;
    break;
  default:
    CAFFEINE_ABORT("Unknown ICmpOpcode");
  }

  return bool_to_bv(expr);
}

z3::expr Z3OpVisitor::visitFCmp(const FCmpOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  z3::expr expr = z3::expr(lhs.ctx(), nullptr);
  switch (op.comparison()) {
  case FCmpOpcode::OEQ:
    expr = lhs == rhs && lhs == lhs && rhs == rhs;
    break;
  case FCmpOpcode::OGT:
    expr = lhs > rhs && lhs == lhs && rhs == rhs;
    break;
  case FCmpOpcode::OGE:
    expr = lhs >= rhs && lhs == lhs && rhs == rhs;
    break;
  case FCmpOpcode::OLT:
    expr = lhs < rhs && lhs == lhs && rhs == rhs;
    break;
  case FCmpOpcode::OLE:
    expr = lhs <= rhs && lhs == lhs && rhs == rhs;
    break;
  case FCmpOpcode::ONE:
    expr = lhs != rhs && lhs == lhs && rhs == rhs;
    break;
  case FCmpOpcode::ORD:
    expr = lhs == lhs && rhs == rhs;
    break;
  case FCmpOpcode::UEQ:
    expr = lhs == rhs;
    break;
  case FCmpOpcode::UGT:
    expr = lhs > rhs;
    break;
  case FCmpOpcode::UGE:
    expr = lhs >= rhs;
    break;
  case FCmpOpcode::ULT:
    expr = lhs < rhs;
    break;
  case FCmpOpcode::ULE:
    expr = lhs <= rhs;
    break;
  case FCmpOpcode::UNE:
    expr = lhs != rhs;
    break;
  case FCmpOpcode::UNO:
    expr = lhs != lhs || rhs != rhs;
    break;
  default:
    CAFFEINE_ABORT("Unknown FCmpOpcode");
  }

  return bool_to_bv(expr);
}

z3::expr Z3OpVisitor::visitNot(const UnaryOp& op) {
  return ~visit(*op.operand());
}

z3::expr Z3OpVisitor::visitFNeg(const UnaryOp& op) {
  return -visit(*op.operand());
}

z3::expr Z3OpVisitor::visitSelectOp(const SelectOp& op) {
  auto selectCond = visit(*op.condition());
  auto trueVal = visit(*op.true_value());
  auto falseVal = visit(*op.false_value());

  auto cond = normalize_to_bool(selectCond);
  auto t_val = normalize_to_int(trueVal);
  auto f_val = normalize_to_int(falseVal);

  return z3::ite(cond, t_val, f_val);
}

} // namespace caffeine
