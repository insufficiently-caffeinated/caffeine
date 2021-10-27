#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/ADT/Guard.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Solver/Z3/Convert.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/Tracing.h"

#include "Z3Solver.h"
#include "z3_fpa.h"

#include <climits>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <sstream>

#include <llvm/ADT/SmallString.h>

namespace caffeine {

llvm::APInt z3_to_apint(const z3::expr& expr) {
  CAFFEINE_ASSERT(expr.is_bv());

  unsigned bitwidth = expr.get_sort().bv_size();

  try {
    return llvm::APInt(bitwidth, expr.get_numeral_uint64());
  } catch (z3::exception&) {
    auto decimal = expr.get_decimal_string(INT_MAX);
    return llvm::APInt(bitwidth, decimal, 10);
  }
}

llvm::APFloat z3_to_apfloat(const z3::expr& expr) {
  CAFFEINE_ASSERT(expr.is_fpa());

  unsigned int sbits = expr.get_sort().fpa_sbits();
  unsigned int ebits = expr.get_sort().fpa_ebits();

  llvm::APInt mantissa;
  uint64_t s = 0;
  if (Z3_fpa_is_numeral_nan(expr.ctx(), expr)) {
    mantissa = llvm::APInt::getAllOnesValue(sbits);
  } else if (Z3_fpa_get_numeral_significand_uint64(expr.ctx(), expr, &s)) {
    mantissa = llvm::APInt(sbits, s);
  } else {
    llvm::StringRef str =
        Z3_fpa_get_numeral_significand_string(expr.ctx(), expr);
    mantissa = llvm::APInt(sbits, str, 10);
  }

  // Remove leading bit from mantissa to get it in IEEE-754 representation
  mantissa = mantissa.trunc(mantissa.getBitWidth() - 1);

  llvm::APInt exponent;
  int64_t e = 0;
  if (Z3_fpa_is_numeral_nan(expr.ctx(), expr)) {
    // Z3 doesn't allow us to extract the exponent of NaNs. However there's only
    // one possible exponent for a NaN so just hardcode it here.
    exponent = llvm::APInt::getAllOnesValue(ebits);
  } else if (Z3_fpa_is_numeral_inf(expr.ctx(), expr)) {
    // Reading the exponent numeral doesn't seem to work correctly so here we
    // manually set the exponent as well.
    exponent = llvm::APInt::getAllOnesValue(ebits);
  } else if (Z3_fpa_get_numeral_exponent_int64(expr.ctx(), expr, &e, true)) {
    exponent = llvm::APInt(ebits, e, true);
  } else {
    // Not worth implementing until we have a float implementation that supports
    // more than 16-bit exponents.
    CAFFEINE_UNIMPLEMENTED();
  }

  int sign = 0;
  if (Z3_fpa_is_numeral_nan(expr.ctx(), expr)) {
    // There's no way to extract the sign bit from Z3 for NaNs
    sign = 0;
  } else if (!Z3_fpa_get_numeral_sign(expr.ctx(), expr, &sign)) {
    CAFFEINE_ABORT("broken fpa numeral");
  }

  llvm::APInt total = mantissa.zext(ebits + sbits) |
                      (exponent.zext(ebits + sbits) << (sbits - 1));
  if (sign)
    total.setSignBit();

  return std::move(
      Value::bitcast(Value(std::move(total)), Type::float_ty(ebits, sbits))
          .apfloat());
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

static Z3Model::SymbolName op_name(const Symbol& symbol) {
  if (symbol.is_numbered()) {
    return symbol.number();
  }

  return std::string(symbol.name());
}

/***************************************************
 * Z3Model                                         *
 ***************************************************/
Z3Model::Z3Model(const z3::model& model, const ConstMap& map)
    : model(model), constants(map) {}
Z3Model::Z3Model(const z3::model& model, ConstMap&& map)
    : model(model), constants(std::move(map)) {}

Value Z3Model::lookup(const Symbol& symbol, std::optional<size_t> size) const {
  auto it = constants.find(op_name(symbol));
  if (it == constants.end()) {
    return Value();
  }

  if (it->second.is_bv()) {
    return Value(z3_to_apint(model.eval(it->second, true)));
  } else if (it->second.is_fpa()) {
    return Value(z3_to_apfloat(model.eval(it->second, true)));
  } else if (it->second.is_array()) {
    auto domain = it->second.get_sort().array_domain();
    auto range = it->second.get_sort().array_range();

    CAFFEINE_ASSERT(size.has_value(),
                    "Called lookup for array constant without size");
    CAFFEINE_ASSERT(domain.is_bv());
    CAFFEINE_ASSERT(range.is_bv() && range.bv_size() == 8);

    std::vector<char> data;
    data.reserve(*size);

    for (size_t i = 0; i < *size; ++i) {
      auto value = model.eval(
          z3::select(it->second,
                     model.ctx().bv_val((uint64_t)i, domain.bv_size())),
          true);
      data.push_back((char)(uint8_t)value.get_numeral_uint64());
    }

    return Value(SharedArray(std::move(data)), Type::int_ty(domain.bv_size()));
  } else {
    CAFFEINE_ABORT("Unsupported numeral type");
  }
}

/***************************************************
 * Z3Solver                                        *
 ***************************************************/
Z3Solver::Z3Solver() : impl(std::make_unique<Impl>()) {}

Z3Solver::Z3Solver(Z3Solver&& solver) noexcept : impl(std::move(solver.impl)) {}
Z3Solver& Z3Solver::operator=(Z3Solver&& solver) noexcept {
  impl = std::move(solver.impl);
  return *this;
}

Z3Solver::~Z3Solver() {}

SolverResult Z3Solver::check(AssertionList& assertions,
                             const Assertion& extra) {
  if (assertions.unproven().empty() && extra.is_constant_value(true))
    return SolverResult::SAT;
  if (extra.is_constant_value(false))
    return SolverResult::UNSAT;

  size_t checkpoint = assertions.checkpoint();
  auto guard = make_guard([&]() { assertions.restore(checkpoint); });
  assertions.insert(extra);

  if (assertions.unproven().empty())
    return SolverResult::SAT;
  return SolverResult(resolve(assertions, Assertion()).kind());
}

SolverResult Z3Solver::resolve(AssertionList& assertions,
                               const Assertion& extra) {
  if (extra.is_constant_value(false))
    return SolverResult::UNSAT;

  for (const Assertion& assertion : assertions) {
    if (assertion.is_constant_value(false))
      return SolverResult::UNSAT;
  }

  auto block = CAFFEINE_TRACE_SPAN("Z3Solver::resolve");

  z3::solver solver = impl->tactic.mk_solver();
  Z3Model::ConstMap constMap;

  Z3OpVisitor visitor{&solver, constMap};
  for (const Assertion& assertion : assertions) {
    if (assertion.is_empty()) {
      continue;
    }

    auto exp = visitor.visit(*assertion.value());
    solver.add(normalize_to_bool(exp));
  }

  if (!extra.is_constant_value(true)) {
    auto exp = visitor.visit(*extra.value());
    solver.add(normalize_to_bool(exp));
  }

  auto result = solver.check();

  if (block.is_enabled()) {
    std::stringstream ss;
    for (Assertion assertion : assertions) {
      // Avoid doing extra serialization work when we'd end up not using it.
      if ((size_t)ss.tellp() > tracing::AutoTraceBlock::MAX_ANNOTATION_SIZE)
        break;
      ss << assertion << '\n';
    }
    if (!extra.is_constant_value(true))
      ss << extra << '\n';

    block.annotate("query", ss.str());
    block.annotate("result", magic_enum::enum_name(result));

    if (result == z3::sat) {
      block.annotate("model",
                     Z3_model_to_string(impl->ctx, solver.get_model()));
    }
  }

  switch (result) {
  case z3::sat:
    return SolverResult(
        SolverResult::SAT,
        std::make_unique<Z3Model>(solver.get_model(), std::move(constMap)));

  case z3::unsat:
    return SolverResult::UNSAT;

  default:
    return SolverResult::Unknown;
  }
}

z3::context& Z3Solver::context() {
  return impl->ctx;
}
z3::expr Z3Solver::evaluate(const OpRef& expr, z3::solver& solver) {
  CAFFEINE_ASSERT(&solver.ctx() == &context());
  Z3Model::ConstMap constMap;
  Z3OpVisitor visitor{&solver, constMap};

  return normalize_to_bool(visitor.visit(*expr));
}

} // namespace caffeine
