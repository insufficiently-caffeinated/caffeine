#include "include/GuidedExecutionPolicy.h"

#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

GuidedExecutionPolicy::GuidedExecutionPolicy(AssertionList& list,
                                             std::shared_ptr<Solver> solver)
    : requiredAssertions_{list}, solver_{solver} {
  if (solver_->check(list) == UNSAT) {
    CAFFEINE_ABORT("GuidedExecutionPolicy requires satisfiable premise");
  }
}

bool GuidedExecutionPolicy::should_queue_path(const Context& ctx) {
  AssertionList combined = ctx.assertions;

  for (const auto& i : requiredAssertions_) {
    combined.insert(i);
  }

  if (solver_->check(combined) == SAT) {
    return true;
  }

  // If the path that we're checking isn't SAT given the assumptions, we want
  // to see if it's SAT in general without our additional assumption so that
  // we can create a testcase out of it
  Interpreter interp(ctx, exec->policy, store, logger, solver);
      interp.execute();
}

} // namespace caffeine
