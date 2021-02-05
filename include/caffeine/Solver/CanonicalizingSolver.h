#pragma once

#include "caffeine/Solver/Solver.h"

namespace caffeine {

/**
 * Solver that attempts to convert expressions to a canonical form.
 *
 * What exactly the canonical form for expressions are hasn't been defined yet
 * but currently there are two guarantees from this solver:
 *  - There will be no unevaluated constant subexpressions (e.g. 3 + 4)
 *  - There will be no repeated duplicate assertions
 *
 * Always returns unknown.
 */
class CanonicalizingSolver final : public Solver {
public:
  CanonicalizingSolver() = default;

  SolverResult check(std::vector<Assertion>& assertions,
                     const Assertion& extra) override;

  std::unique_ptr<Model> resolve(std::vector<Assertion>& assertions,
                                 const Assertion& extra) override;
};

} // namespace caffeine
