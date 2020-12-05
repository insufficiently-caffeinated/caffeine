#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

#include "Z3Solver.h"

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
  if (expr.is_bv() && expr.get_sort().bv_size() == 1)
    return bv_to_bool(expr);
  return expr;
}

static z3::expr normalize_to_bv(const z3::expr& expr) {
  if (expr.is_bool())
    return bool_to_bv(expr);
  return expr;
}

static Z3Model::SymbolName op_name(const Constant& constant) {
  if (constant.is_numbered()) {
    return constant.number();
  }

  return std::string(constant.name());
}

static z3::symbol name_to_symbol(z3::context& ctx,
                                 const Z3Model::SymbolName& name) {
  if (auto ptr = std::get_if<std::string>(&name))
    return ctx.str_symbol(ptr->c_str());
  if (auto ptr = std::get_if<uint64_t>(&name)) {
    CAFFEINE_ASSERT(*ptr <= (uint64_t)INT_MAX);
    return ctx.int_symbol(*ptr);
  }

  CAFFEINE_UNREACHABLE();
}

static z3::sort type_to_sort(z3::context& ctx, const Type& type) {
  switch (type.kind()) {
  case Type::Integer:
    return ctx.bv_sort(type.bitwidth());
  case Type::FloatingPoint:
    return ctx.fpa_sort(type.exponent_bits(), type.mantissa_bits());
  case Type::Array:
    CAFFEINE_ABORT("Symbolic arrays are unimplemented");
  case Type::Void:
    CAFFEINE_ABORT("Cannot make symbolic void constants");
  case Type::Pointer:
    CAFFEINE_ABORT("Cannot make symbolic pointer constants");
  case Type::FunctionPointer:
    CAFFEINE_ABORT("Cannot make symbolic function constants");
  }

  CAFFEINE_UNREACHABLE();
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
Z3Model::Z3Model(SolverResult result, z3::model model, const ConstMap& map)
    : Model(result), model(model), constants(map) {}

Value Z3Model::lookup(const Constant& constant) const {
  CAFFEINE_ASSERT(result() == SolverResult::SAT, "Model is not SAT");

  auto it = constants.find(op_name(constant));
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
Z3Solver::Z3Solver() : ctx(std::make_unique<z3::context>()) {
  // We want z3 to generate models
  ctx->set("model", true);
  // Automatically select and configure the solver
  ctx->set("auto_config", true);
}

Z3Solver::~Z3Solver() {}

std::unique_ptr<Model> Z3Solver::resolve(std::vector<Assertion>& assertions,
                                         const Assertion& extra) {
  z3::solver solver = z3::tactic(*ctx, "default").mk_solver();
  Z3Model::ConstMap constMap;

  Z3OpVisitor visitor{ctx.get(), constMap};
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
    return std::make_unique<Z3Model>(SolverResult::SAT, solver.get_model(),
                                     constMap);

  case z3::unsat:
    return std::make_unique<EmptyModel>(SolverResult::UNSAT);

  default:
    return std::make_unique<EmptyModel>(SolverResult::Unknown);
  }
}

/***************************************************
 * Z3OpVisitor                                     *
 ***************************************************/
Z3OpVisitor::Z3OpVisitor(z3::context* ctx, Z3Model::ConstMap& constMap)
    : ctx(ctx), constMap(constMap) {}

z3::expr Z3OpVisitor::visitOperation(const Operation& op) {
  CAFFEINE_ABORT(fmt::format("Z3Solver does not have support for opcode {}",
                             op.opcode_name()));
}

z3::expr Z3OpVisitor::visitConstant(const Constant& op) {
  auto type = op.type();
  auto name = op_name(op);

  // Reuse already created constants (otherwise Z3 will view them as different?)
  auto it = constMap.find(name);
  if (it != constMap.end()) {
    // TODO: Ensure that they're the same type?
    return it->second;
  }

  auto sort = type_to_sort(*ctx, type);
  auto expr = ctx->constant(name_to_symbol(*ctx, name), sort);
  constMap.insert({name, expr});
  return expr;
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
    auto lhs = normalize_to_bv(visit(*op.lhs()));                              \
    auto rhs = normalize_to_bv(visit(*op.rhs()));                              \
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

// Special cases for and and or which try to keep values as booleans
z3::expr Z3OpVisitor::visitAnd(const BinaryOp& op) {
  auto lhs = normalize_to_bool(visit(*op.lhs()));
  auto rhs = normalize_to_bool(visit(*op.rhs()));

  if (lhs.is_bool())
    return lhs && rhs;

  return lhs & rhs;
}
z3::expr Z3OpVisitor::visitOr(const BinaryOp& op) {
  auto lhs = normalize_to_bool(visit(*op.lhs()));
  auto rhs = normalize_to_bool(visit(*op.rhs()));

  if (lhs.is_bool())
    return lhs || rhs;

  return lhs | rhs;
}

z3::expr Z3OpVisitor::visitICmp(const ICmpOp& op) {
  auto lhs = normalize_to_bv(visit(*op.lhs()));
  auto rhs = normalize_to_bv(visit(*op.rhs()));

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

  return expr;
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

  return expr;
}

z3::expr Z3OpVisitor::visitNot(const UnaryOp& op) {
  auto expr = normalize_to_bool(visit(*op.operand()));

  if (expr.is_bool())
    return !expr;
  return ~expr;
}

z3::expr Z3OpVisitor::visitFNeg(const UnaryOp& op) {
  return -visit(*op.operand());
}

z3::expr Z3OpVisitor::visitSelectOp(const SelectOp& op) {
  auto selectCond = visit(*op.condition());
  auto trueVal = visit(*op.true_value());
  auto falseVal = visit(*op.false_value());

  auto cond = normalize_to_bool(selectCond);
  auto t_val = normalize_to_bv(trueVal);
  auto f_val = normalize_to_bv(falseVal);

  return z3::ite(cond, t_val, f_val);
}

z3::expr Z3OpVisitor::visitTrunc(const UnaryOp& op) {
  auto operand = visit(*op.operand());
  auto src = normalize_to_bv(operand);

  return src.extract(op.type().bitwidth() - 1, 0);
}

z3::expr Z3OpVisitor::visitZExt(const UnaryOp& op) {
  auto operand = visit(*op.operand());
  auto src = normalize_to_bv(operand);

  return z3::zext(src, op.type().bitwidth() - operand.get_sort().bv_size());
}
z3::expr Z3OpVisitor::visitSExt(const UnaryOp& op) {
  auto operand = visit(*op.operand());
  auto src = normalize_to_bv(operand);

  return z3::sext(src, op.type().bitwidth() - operand.get_sort().bv_size());
}

} // namespace caffeine
