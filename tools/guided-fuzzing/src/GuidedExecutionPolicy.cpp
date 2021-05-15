#include "include/GuidedExecutionPolicy.h"
#include "include/NeverQueuePolicy.h"
#include "include/NopStore.h"

#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

GuidedExecutionPolicy::GuidedExecutionPolicy(AssertionList& list,
                                             CaffeineMutator* mutator,
                                             TestCaseStoragePtr cases)
    : requiredAssertions_{list}, mutator{mutator}, cases{cases} {
  CAFFEINE_ASSERT(mutator, "Mutator must not be null in GuidedExecutionPolicy");
  CAFFEINE_ASSERT(mutator->solver->check(list) == SolverResult::SAT, "GuidedExecutionPolicy requires satisfiable premise");
}

bool GuidedExecutionPolicy::should_queue_path(const Context& ctx) {
  AssertionList combined = ctx.assertions;

  for (const auto& i : requiredAssertions_) {
    combined.insert(i);
  }

  if (mutator->solver->check(combined) == SolverResult::SAT) {
    return true;
  }

  // If the path that we're checking isn't SAT given the assumptions, we want
  // to see if it's SAT in general without our additional assumption so that
  // we can create a testcase out of it. The key here is that the `NeverQueuePolicy`
  // will turn our `ctx_copy` into a testcase after it is done running (assuming
  // it is SAT)
  auto store = NopStore();
  auto policy = NeverQueuePolicy(cases, mutator);
  auto ctx_copy = ctx;
  Interpreter interp(&ctx_copy, &policy, &store, nullptr, mutator->solver);
  interp.execute();

  return false;
}

} // namespace caffeine
