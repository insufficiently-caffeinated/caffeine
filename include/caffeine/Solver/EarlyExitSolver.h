#pragma once

#include "caffeine/Solver/Solver.h"

namespace caffeine {

class EarlyExitSolver : public Solver {
public:
  EarlyExitSolver(const std::shared_ptr<Solver>& solver);

  SolverResult check(AssertionList& assertions,
                     const Assertion& extra) override;
  SolverResult resolve(AssertionList& assertions,
                       const Assertion& extra) override;

private:
  std::shared_ptr<Solver> inner;
};

} // namespace caffeine
