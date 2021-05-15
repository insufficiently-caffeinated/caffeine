#include "include/TestCaseFailureLogger.h"

namespace caffeine {

TestCaseFailureLogger::TestCaseFailureLogger(TestCaseStoragePtr cases, CaffeineMutator* mutator)
    : mutator{mutator}, cases{cases} {
  CAFFEINE_ASSERT(mutator, "Mutator must not be null in TestCaseFailureLogger");
}

void TestCaseFailureLogger::log_failure(const Model* model, const Context& ctx,
                                        const Failure&) {
  if (model)
    cases->push_back(mutator->model_to_testcase(model, ctx));
}

} // namespace caffeine
