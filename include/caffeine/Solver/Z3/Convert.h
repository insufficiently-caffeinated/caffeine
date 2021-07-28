
#pragma once

#include <caffeine/IR/Visitor.h>
#include <tsl/hopscotch_map.h>
#include <z3++.h>

namespace caffeine {

using Z3SymbolName = std::variant<std::string, uint64_t>;
using Z3ConstMap = tsl::hopscotch_map<Z3SymbolName, z3::expr>;

class Z3OpVisitor : public ConstOpVisitor<Z3OpVisitor, z3::expr> {
private:
  z3::context* ctx;
  z3::solver* solver;
  Z3ConstMap* constMap;
  tsl::hopscotch_map<const Operation*, z3::expr> cache;

  // Used for temporary constants that are needed as an implementation detail
  // but aren't otherwise exposed to clients.
  uint32_t tmpConstNum = (1u << 30) / 2;

  static constexpr uint32_t tmpConstMax = (1u << 30) - 1;

public:
  Z3OpVisitor(z3::solver* solver, Z3ConstMap& constMap);

  z3::expr visit(const Operation& op);
  z3::expr visit(const Operation* op) {
    return visit(*op);
  }

  z3::expr visitOperation(const Operation& op);

#define HANDLE_OPCLASS(opname, opclass)                                        \
  z3::expr visit##opname(const opclass& op);
#include "caffeine/IR/Operation.def"

  /**
   * When a temporary constant is needed then use this function.
   *
   * It explicitly creates constants with high-integer names that won't collide
   * unless the running program creates more than 2^29 constant names.
   */
  z3::expr next_const(const z3::sort& sort) {
    CAFFEINE_ASSERT(tmpConstNum != tmpConstMax,
                    "ran out of temporary constant names");

    unsigned const_num = tmpConstNum++;
    return ctx->constant(ctx->int_symbol(const_num), sort);
  }
};

class Z3ExprConverter {
  tsl::hopscotch_map<unsigned, OpRef> cached;

  class UnsupportedConversion {};

public:
  Z3ExprConverter() = default;

  std::optional<OpRef> convert(const z3::expr& expr);

private:
  OpRef visit(const z3::expr& expr);
  OpRef visit_detail(const z3::expr& expr);

  OpRef visit_app(const z3::expr& expr);
};

} // namespace caffeine
