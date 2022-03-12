#include "caffeine/Solver/InterruptSolver.h"
#include "caffeine/Model/AssertionList.h"

namespace caffeine {

InterruptSolver::InterruptSolver(
    const std::shared_ptr<Solver>& solver,
    const std::shared_ptr<std::atomic<bool>> should_stop)
    : inner(solver), should_stop(should_stop) {}

SolverResult InterruptSolver::check(AssertionList& assertions,
                                    const Assertion& extra) {
  if (should_stop->load())
    return SolverResult::Unknown;

  return inner->check(assertions, extra);
}

SolverResult InterruptSolver::resolve(AssertionList& assertions,
                                      const Assertion& extra) {
  if (should_stop->load())
    return SolverResult::Unknown;

  return inner->resolve(assertions, extra);
}

void InterruptSolver::interrupt() {
  inner->interrupt();
}

} // namespace caffeine
