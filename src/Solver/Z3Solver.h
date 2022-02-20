
#pragma once

#include "caffeine/Solver/Z3Solver.h"

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Value.h"
#include "caffeine/IR/Visitor.h"
#include "caffeine/Solver/Z3/Convert.h"

#include <z3++.h>

#include <limits>
#include <string>
#include <unordered_map>
#include <variant>

namespace caffeine {

class Z3Solver::Impl {
public:
  z3::context ctx;
  z3::tactic tactic;

  Impl() : tactic(ctx, "default") {
    // We want z3 to generate models
    ctx.set("model", true);
    // Automatically select and configure the solver
    ctx.set("auto_config", true);
  }
};

class Z3Model : public Model {
public:
  using SymbolName = Z3SymbolName;
  using ConstMap = Z3ConstMap;

private:
  z3::model model;
  ConstMap constants;

public:
  Z3Model(const z3::model& model, const ConstMap& map);
  Z3Model(const z3::model& model, ConstMap&& map);

  Value lookup(const Symbol& symbol, std::optional<size_t> size) const override;
};

// Convert a Z3 expression to an APInt
llvm::APInt z3_to_apint(const z3::expr& expr);

// Convert a Z3 expression to an APFloat
llvm::APFloat z3_to_apfloat(const z3::expr& expr);

} // namespace caffeine
