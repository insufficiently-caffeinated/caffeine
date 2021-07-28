#include "caffeine/Solver/Z3/Convert.h"
#include "../Z3Solver.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/ADT/SmallString.h>

namespace caffeine {
namespace {
  z3::expr bool_to_bv(const z3::expr& expr) {
    CAFFEINE_ASSERT(expr.is_bool());

    auto& ctx = expr.ctx();
    return z3::ite(expr, ctx.bv_val(1, 1), ctx.bv_val(0, 1));
  }

  z3::expr bv_to_bool(const z3::expr& expr) {
    CAFFEINE_ASSERT(expr.is_bv() && expr.get_sort().bv_size() == 1);
    return expr == 1;
  }

  z3::expr normalize_to_bool(const z3::expr& expr) {
    if (expr.is_bv() && expr.get_sort().bv_size() == 1)
      return bv_to_bool(expr);
    return expr;
  }

  z3::expr normalize_to_bv(const z3::expr& expr) {
    if (expr.is_bool())
      return bool_to_bv(expr);
    return expr;
  }

  Z3SymbolName op_name(const Symbol& symbol) {
    if (symbol.is_numbered()) {
      return symbol.number();
    }

    return std::string(symbol.name());
  }

  z3::symbol name_to_symbol(z3::context& ctx, const Z3SymbolName& name) {
    if (auto ptr = std::get_if<std::string>(&name))
      return ctx.str_symbol(ptr->c_str());
    if (auto ptr = std::get_if<uint64_t>(&name)) {
      CAFFEINE_ASSERT(*ptr <= (uint64_t)INT_MAX);
      return ctx.int_symbol(static_cast<int>(*ptr));
    }

    CAFFEINE_UNREACHABLE();
  }

  z3::sort type_to_sort(z3::context& ctx, const Type& type) {
    switch (type.kind()) {
    case Type::Integer:
      return ctx.bv_sort(type.bitwidth());
    case Type::FloatingPoint:
      return ctx.fpa_sort(type.exponent_bits(), type.mantissa_bits());
    case Type::Array:
      return ctx.array_sort(ctx.bv_sort(type.bitwidth()), ctx.bv_sort(8));
    case Type::Void:
      CAFFEINE_ABORT("Cannot make symbolic void constants");
    case Type::Pointer:
      CAFFEINE_ABORT("Cannot make symbolic pointer constants");
    case Type::Function:
      CAFFEINE_ABORT("Cannot make symbolic function constants");
    case Type::Vector:
      CAFFEINE_ABORT("Cannot make symbolic vector constants");
    }

    CAFFEINE_UNREACHABLE();
  }

} // namespace

/***************************************************
 * Operation to Z3                                 *
 ***************************************************/

Z3OpVisitor::Z3OpVisitor(z3::solver* solver, Z3ConstMap& constMap)
    : ctx(&solver->ctx()), solver(solver), constMap(&constMap) {}

z3::expr Z3OpVisitor::visit(const Operation& op) {
  // Memoize visited expressions to avoid combinatorial explosion
  auto it = cache.find(&op);
  if (it != cache.end())
    return it->second;

  z3::expr value = ConstOpVisitor<Z3OpVisitor, z3::expr>::visit(op);
  cache.emplace(&op, value);
  return value;
}

z3::expr Z3OpVisitor::visitOperation(const Operation& op) {
  CAFFEINE_ABORT(fmt::format("Z3Solver does not have support for opcode {}",
                             op.opcode_name()));
}

z3::expr Z3OpVisitor::visitConstant(const Constant& op) {
  auto type = op.type();
  auto name = op_name(op.symbol());

  // Reuse already created constants (otherwise Z3 will view them as different?)
  auto it = constMap->find(name);
  if (it != constMap->end()) {
    // TODO: Ensure that they're the same type?
    return it->second;
  }

  auto sort = type_to_sort(*ctx, type);
  auto expr = ctx->constant(name_to_symbol(*ctx, name), sort);
  constMap->insert({name, expr});
  return expr;
}
z3::expr Z3OpVisitor::visitConstantArray(const ConstantArray& op) {
  auto name = op_name(op.symbol());

  auto it = constMap->find(name);
  if (it != constMap->end()) {
    return it->second;
  }

  auto sort = type_to_sort(*ctx, op.type());
  auto expr = ctx->constant(name_to_symbol(*ctx, name), sort);
  constMap->insert({std::move(name), expr});
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
  auto expr = z3::expr(
      *ctx, Z3_mk_fpa_numeral_double(*ctx, op.value().convertToDouble(),
                                     ctx->fpa_sort(op.type().exponent_bits(),
                                                   op.type().mantissa_bits())));
  expr.check_error();
  return expr;
}
z3::expr Z3OpVisitor::visitUndef(const Undef& op) {
  // TODO: Semantically, we can return absolutely any value when working with
  //       undef. In the future we'll probably want to do something a bit more
  //       useful than just picking an arbitrary value.

  auto type = op.type();

  if (type.is_int())
    return ctx->bv_val(0, op.type().bitwidth());
  if (type.is_float()) {
    z3::expr val(*ctx, Z3_mk_fpa_zero(*ctx,
                                      ctx->fpa_sort(type.exponent_bits(),
                                                    type.mantissa_bits()),
                                      false));
    ctx->check_error();
    return val;
  }

  CAFFEINE_UNIMPLEMENTED(
      fmt::format(FMT_STRING("Unsupported undef type {}"), type));
}
z3::expr Z3OpVisitor::visitFixedArray(const FixedArray& op) {
  const auto& data = op.data();

  z3::expr array = next_const(
      ctx->array_sort(ctx->bv_sort((op.type().bitwidth())), ctx->bv_sort(8)));

  for (size_t i = 0; i < data.size(); ++i) {
    z3::expr value = visit(*data[i]);
    solver->add(z3::select(array, ctx->bv_val(i, op.type().bitwidth())) ==
                value);
  }

  return array;
}

#define CAFFEINE_BINOP_IMPL(name, op_code)                                     \
  z3::expr Z3OpVisitor::visit##name(const BinaryOp& op) {                      \
    auto lhs = normalize_to_bv(visit(*op.lhs()));                              \
    auto rhs = normalize_to_bv(visit(*op.rhs()));                              \
    return op_code;                                                            \
  }

#define CAFFEINE_UNOP_UNIMPLEMENTED(op) return visitOperation(op)

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

// Z3's C++ API doesn't include this so we need to use the C API
static z3::expr is_nan(const z3::expr& e) {
  auto expr = z3::expr(e.ctx(), Z3_mk_fpa_is_nan(e.ctx(), e));
  expr.check_error();
  return expr;
}

static z3::expr fpa_leq(const z3::expr& a, const z3::expr& b) {
  auto val = z3::expr(a.ctx(), Z3_mk_fpa_leq(a.ctx(), a, b));
  val.check_error();
  return val;
}
static z3::expr fpa_lt(const z3::expr& a, const z3::expr& b) {
  auto val = z3::expr(a.ctx(), Z3_mk_fpa_lt(a.ctx(), a, b));
  val.check_error();
  return val;
}
static z3::expr fpa_geq(const z3::expr& a, const z3::expr& b) {
  auto val = z3::expr(a.ctx(), Z3_mk_fpa_geq(a.ctx(), a, b));
  val.check_error();
  return val;
}
static z3::expr fpa_gt(const z3::expr& a, const z3::expr& b) {
  auto val = z3::expr(a.ctx(), Z3_mk_fpa_gt(a.ctx(), a, b));
  val.check_error();
  return val;
}

z3::expr Z3OpVisitor::visitFCmp(const FCmpOp& op) {
  auto lhs = visit(*op.lhs());
  auto rhs = visit(*op.rhs());

  z3::expr expr = z3::expr(lhs.ctx(), nullptr);
  switch (op.comparison()) {
  case FCmpOpcode::EQ:
    expr = lhs == rhs;
    break;
  case FCmpOpcode::GT:
    expr = fpa_gt(lhs, rhs);
    break;
  case FCmpOpcode::GE:
    expr = fpa_geq(lhs, rhs);
    break;
  case FCmpOpcode::LT:
    expr = fpa_lt(lhs, rhs);
    break;
  case FCmpOpcode::LE:
    expr = fpa_leq(lhs, rhs);
    break;
  case FCmpOpcode::NE:
    expr = lhs != rhs;
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

z3::expr Z3OpVisitor::visitFIsNaN(const UnaryOp& op) {
  return is_nan(visit(*op.operand()));
}

z3::expr Z3OpVisitor::visitSelect(const SelectOp& op) {
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
z3::expr Z3OpVisitor::visitBitcast(const UnaryOp& op) {
  auto src = normalize_to_bv(visit(*op.operand()));

  if (op.type() == op.operand()->type())
    return src;
  if (op.type().is_int() && op.operand()->type().is_float()) {
    z3::expr expr{src.ctx(), Z3_mk_fpa_to_ieee_bv(src.ctx(), src)};
    ctx->check_error();
    return expr;
  }
  if (op.type().is_float() && op.operand()->type().is_int()) {
    unsigned ebits = op.type().exponent_bits();
    unsigned sbits = op.type().mantissa_bits();
    unsigned tbits = ebits + sbits;

    z3::expr sig = src.extract(sbits - 2, 0);
    z3::expr exp = src.extract(tbits - 2, sbits - 1);
    z3::expr sgn = src.extract(tbits - 1, tbits - 1);

    z3::expr expr{src.ctx(), Z3_mk_fpa_fp(src.ctx(), sgn, exp, sig)};
    ctx->check_error();
    return expr;
  }

  CAFFEINE_UNIMPLEMENTED();
}

z3::expr Z3OpVisitor::visitZExt(const UnaryOp& op) {
  auto operand = visit(*op.operand());
  auto src = normalize_to_bv(operand);

  return z3::zext(src, op.type().bitwidth() - src.get_sort().bv_size());
}
z3::expr Z3OpVisitor::visitSExt(const UnaryOp& op) {
  auto operand = visit(*op.operand());
  auto src = normalize_to_bv(operand);

  return z3::sext(src, op.type().bitwidth() - src.get_sort().bv_size());
}
z3::expr Z3OpVisitor::visitSIToFp(const UnaryOp& op) {
  CAFFEINE_UNOP_UNIMPLEMENTED(op);
}
z3::expr Z3OpVisitor::visitUIToFp(const UnaryOp& op) {
  CAFFEINE_UNOP_UNIMPLEMENTED(op);
}
z3::expr Z3OpVisitor::visitFpToSI(const UnaryOp& op) {
  CAFFEINE_UNOP_UNIMPLEMENTED(op);
}
z3::expr Z3OpVisitor::visitFpToUI(const UnaryOp& op) {
  CAFFEINE_UNOP_UNIMPLEMENTED(op);
}
z3::expr Z3OpVisitor::visitFpExt(const UnaryOp& op) {
  CAFFEINE_UNOP_UNIMPLEMENTED(op);
}
z3::expr Z3OpVisitor::visitFpTrunc(const UnaryOp& op) {
  CAFFEINE_UNOP_UNIMPLEMENTED(op);
}

z3::expr Z3OpVisitor::visitLoad(const LoadOp& op) {
  return z3::select(visit(op[0]), visit(op[1]));
}
z3::expr Z3OpVisitor::visitStore(const StoreOp& op) {
  return z3::store(visit(op[0]), visit(op[1]), visit(op[2]));
}
z3::expr Z3OpVisitor::visitAlloc(const AllocOp& op) {
  auto value = visit(*op.default_value());
  auto index_width = op.size()->type().bitwidth();

  return z3::const_array(ctx->bv_sort(index_width), value);
}

z3::expr Z3OpVisitor::visitFunctionObject(const FunctionObject&) {
  CAFFEINE_ABORT("Encountered a symbolic FunctionObject instance");
}

/***************************************************
 * Z3 to Operation                                 *
 ***************************************************/

std::optional<OpRef> Z3ExprConverter::convert(const z3::expr& expr) {
  try {
    return visit(expr);
  } catch (UnsupportedConversion&) { return std::nullopt; }
}

OpRef Z3ExprConverter::visit(const z3::expr& expr) {
  auto it = cached.find(expr.id());
  if (it != cached.end())
    return it->second;

  auto value = visit(expr);
  cached.emplace(expr.id(), value);
  return value;
}

OpRef Z3ExprConverter::visit_detail(const z3::expr& expr) {
  switch (expr.kind()) {
  case Z3_APP_AST:
    return visit_app(expr);
  case Z3_NUMERAL_AST:
    return visit_numeral(expr);
  case Z3_VAR_AST:
  case Z3_QUANTIFIER_AST:
  case Z3_SORT_AST:
  case Z3_FUNC_DECL_AST:

  default:
    throw UnsupportedConversion(
        fmt::format(FMT_STRING("Unable to convert expr of kind {}"),
                    magic_enum::enum_name(expr.kind())));
  }
}

OpRef Z3ExprConverter::visit_app(const z3::expr& expr) {
#define CASE_2(fn, msg)                                                        \
  do {                                                                         \
    if (expr.num_args() != 2)                                                  \
      throw UnsupportedConversion(                                             \
          fmt::format("Invalid number of arguments for Z3 expression kind {} " \
                      "(expected 2). Full expression:\n{}",                    \
                      msg, expr.to_string()));                                 \
    return fn(visit(expr.arg(0)), visit(expr.arg(1)));                         \
  } while (false)

  auto decl = expr.decl();

  switch (decl.decl_kind()) {
  case Z3_OP_TRUE:
  case Z3_OP_BIT1:
    return ConstantInt::Create(true);
  case Z3_OP_FALSE:
  case Z3_OP_BIT0:
    return ConstantInt::Create(false);
  case Z3_OP_EQ:
    CAFFEINE_ASSERT(expr.num_args() == 2);
    return ICmpOp::CreateICmpEQ(visit(expr.arg(0)), visit(expr.arg(1)));
  case Z3_OP_DISTINCT: {
    auto num_args = expr.num_args();
    auto value = ConstantInt::Create(true);

    for (size_t i = 0; i < num_args; ++i) {
      for (size_t j = i + 1; j < num_args; ++j) {
        value = BinaryOp::CreateAnd(
            value,
            ICmpOp::CreateICmpNE(visit(expr.arg(i)), visit(expr.arg(j))));
      }
    }

    return value;
  }
  case Z3_OP_ITE:
    CAFFEINE_ASSERT(expr.num_args() == 3);
    return SelectOp::Create(visit(expr.arg(0)), visit(expr.arg(1)),
                            visit(expr.arg(2)));

  case Z3_OP_BAND:
  case Z3_OP_AND: {
    auto num_args = expr.num_args();
    auto value = ConstantInt::Create(true);

    for (size_t i = 0; i < num_args; ++i) {
      value = BinaryOp::CreateAnd(value, visit(expr.arg(i)));
    }

    return value;
  }

  case Z3_OP_BOR:
  case Z3_OP_OR: {
    auto num_args = expr.num_args();
    auto value = ConstantInt::Create(false);

    for (size_t i = 0; i < num_args; ++i) {
      value = BinaryOp::CreateOr(value, visit(expr.arg(i)));
    }

    return value;
  }

  case Z3_OP_BXOR:
  case Z3_OP_XOR:
    CASE_2(BinaryOp::CreateXor, "Z3_OP_BXOR or Z3_OP_XOR");

  case Z3_OP_BNOT:
  case Z3_OP_NOT:
    CAFFEINE_ASSERT(expr.num_args() == 1);
    return UnaryOp::CreateNot(visit(expr.arg(0)));

  case Z3_OP_BNEG:
    CAFFEINE_ASSERT(expr.num_args() == 1);
    return UnaryOp::CreateNeg(visit(expr.arg(0)));

  // clang-format off
  case Z3_OP_BADD:  CASE_2(BinaryOp::CreateAdd, "Z3_OP_BADD");
  case Z3_OP_BSUB:  CASE_2(BinaryOp::CreateSub, "Z3_OP_BSUB");
  case Z3_OP_BMUL:  CASE_2(BinaryOp::CreateMul, "Z3_OP_BMUL");
  case Z3_OP_BSDIV: CASE_2(BinaryOp::CreateSDiv, "Z3_OP_BSDIV");
  case Z3_OP_BUDIV: CASE_2(BinaryOp::CreateUDiv, "Z3_OP_BUDIV");
  case Z3_OP_BSREM: CASE_2(BinaryOp::CreateSRem, "Z3_OP_BSREM");
  case Z3_OP_BUREM: CASE_2(BinaryOp::CreateURem, "Z3_OP_BUREM");
  case Z3_OP_BSMOD: throw UnsupportedConversion();

  case Z3_OP_ULEQ: CASE_2(ICmpOp::CreateICmpULE, "Z3_OP_ULEQ");
  case Z3_OP_SLEQ: CASE_2(ICmpOp::CreateICmpSLE, "Z3_OP_SLEQ");
  case Z3_OP_UGEQ: CASE_2(ICmpOp::CreateICmpUGE, "Z3_OP_UGEQ");
  case Z3_OP_SGEQ: CASE_2(ICmpOp::CreateICmpSGE, "Z3_OP_SGEQ");
  case Z3_OP_ULT:  CASE_2(ICmpOp::CreateICmpULT, "Z3_OP_ULT");
  case Z3_OP_SLT:  CASE_2(ICmpOp::CreateICmpSLT, "Z3_OP_SLT");
  case Z3_OP_UGT:  CASE_2(ICmpOp::CreateICmpUGT, "Z3_OP_UGT");
  case Z3_OP_SGT:  CASE_2(ICmpOp::CreateICmpSGT, "Z3_OP_SGT");

  case Z3_OP_BNAND: CASE_2(BinaryOp::CreateNand, "Z3_OP_BNAND");
  case Z3_OP_BNOR:  CASE_2(BinaryOp::CreateNor,  "Z3_OP_BNOR");
  case Z3_OP_BXNOR: CASE_2(BinaryOp::CreateXnor, "Z3_OP_BXNOR");
  case Z3_OP_BSHL:  CASE_2(BinaryOp::CreateShl,  "Z3_OP_BSHL");
  case Z3_OP_BLSHR: CASE_2(BinaryOp::CreateLShr, "Z3_OP_BLSHR");
  case Z3_OP_BASHR: CASE_2(BinaryOp::CreateAShr, "Z3_OP_BASHR");

  // clang-format on
  case Z3_OP_BNUM:
    return ConstantInt::Create(z3_to_apint(expr));

  default:
    throw UnsupportedConversion(fmt::format(
        FMT_STRING("Unsupported Z3 AST type {}"), decl.decl_kind()));
  }
}

OpRef Z3ExprConverter::visit_numeral(const z3::expr&) {
  throw UnsupportedConversion("numerals are unsupported right now");
}

} // namespace caffeine
