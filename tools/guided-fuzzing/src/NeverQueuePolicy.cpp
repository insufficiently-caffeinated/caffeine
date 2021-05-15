#include "include/NeverQueuePolicy.h"

namespace caffeine {

NeverQueuePolicy::NeverQueuePolicy(TestCaseStoragePtr cases, CaffeineMutator *mutator)
    : cases{cases}, mutator{mutator} {
  CAFFEINE_ASSERT(mutator, "Mutator must not be null in NeverQueuePolicy");
}

bool NeverQueuePolicy::should_queue_path(const Context&) {
  return false;
}

void NeverQueuePolicy::on_path_complete(const Context& ctx, ExitStatus status) {
  if (status != ExitStatus::Success) {
    return;
  }

  auto ctx_copy = ctx;
  auto solver_result = ctx_copy.resolve(solver);

  if (solver_result.kind() == SolverResult::UNSAT) {
    return;
  }

  cases->push_back(mutator->model_to_testcase(solver_result.model(), ctx_copy));
}

} // namespace caffeine
