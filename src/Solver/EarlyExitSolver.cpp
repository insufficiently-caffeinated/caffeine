#include "caffeine/Solver/EarlyExitSolver.h"
#include "caffeine/Model/AssertionList.h"

namespace caffeine {

EarlyExitSolver::EarlyExitSolver(const std::shared_ptr<Solver>& solver)
    : inner(solver) {}

SolverResult EarlyExitSolver::check(AssertionList& assertions,
                                    const Assertion& extra) {
  if (extra.is_constant_value(false))
    return SolverResult::UNSAT;

  if (assertions.unproven().empty() && extra.is_constant_value(true))
    return SolverResult::SAT;

  return inner->check(assertions, extra);
}

SolverResult EarlyExitSolver::resolve(AssertionList& assertions,
                                      const Assertion& extra) {
  if (extra.is_constant_value(false))
    return SolverResult::UNSAT;

  return inner->resolve(assertions, extra);
}

} // namespace caffeine
