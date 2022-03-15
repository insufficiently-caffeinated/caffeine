#pragma once

#include <atomic>

#include "caffeine/Solver/Solver.h"

namespace caffeine {

class InterruptSolver : public Solver {
public:
  InterruptSolver(const std::shared_ptr<Solver>& solver,
                  const std::shared_ptr<std::atomic<bool>> should_stop);

  SolverResult check(AssertionList& assertions,
                     const Assertion& extra) override;
  SolverResult resolve(AssertionList& assertions,
                       const Assertion& extra) override;

  void interrupt() override;

private:
  std::shared_ptr<Solver> inner;
  std::shared_ptr<std::atomic<bool>> should_stop;
};

} // namespace caffeine
