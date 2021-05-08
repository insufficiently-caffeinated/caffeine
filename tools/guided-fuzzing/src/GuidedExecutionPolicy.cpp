#include "include/GuidedExecutionPolicy.h"

namespace caffeine {

GuidedExecutionPolicy::GuidedExecutionPolicy(AssertionList& list,
                                             std::shared_ptr<Solver> solver)
    : requiredAssertions_{list}, solver_{solver} {
  if (solver_->check(list) == SolverResult::UNSAT) {
    CAFFEINE_ABORT("GuidedExecutionPolicy requires satisfiable premise");
  }
}

bool GuidedExecutionPolicy::should_queue_path(const Context& ctx) {
  AssertionList combined = ctx.assertions;

  for (const auto& i : requiredAssertions_) {
    combined.insert(i);
  }

  return solver_->check(combined) != SolverResult::UNSAT;
}

} // namespace caffeine
