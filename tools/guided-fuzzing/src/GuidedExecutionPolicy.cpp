#include "GuidedExecutionPolicy.h"

#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

GuidedExecutionPolicy::GuidedExecutionPolicy(AssertionList& list,
                                             CaffeineMutator* mutator,
                                             TestCaseStoragePtr cases)
    : requiredAssertions_{list}, mutator{mutator}, cases{cases} {
  CAFFEINE_ASSERT(mutator, "Mutator must not be null in GuidedExecutionPolicy");
  CAFFEINE_ASSERT(mutator->solver->check(list) == SolverResult::SAT,
                  "GuidedExecutionPolicy requires satisfiable premise");
}

bool GuidedExecutionPolicy::should_queue_path(const Context& ctx) {
  AssertionList combined = ctx.assertions;

  for (const auto& i : requiredAssertions_) {
    combined.insert(i);
  }

  return mutator->solver->check(combined) == SolverResult::SAT;
}

void GuidedExecutionPolicy::on_path_complete(const Context& ctx,
                                             ExitStatus status,
                                             const Assertion& assertion) {
  if (status == ExitStatus::Fail) {
    Context ctx_copy = ctx;
    cases->push_back(mutator->model_to_testcase(
        ctx_copy.resolve(mutator->solver, assertion).model(), ctx_copy));
  }
}

} // namespace caffeine
