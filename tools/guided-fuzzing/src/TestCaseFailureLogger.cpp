#include "include/TestCaseFailureLogger.h"

namespace caffeine {

TestCaseFailureLogger::TestCaseFailureLogger(llvm::Function* fuzz_target, std::shared_ptr<Solver> solver, afl_state_t * afl)
    : fuzz_target{fuzz_target}, solver{solver}, afl{afl} {

}

void TestCaseFailureLogger::log_failure(const Model& model, const Context& ctx,
                                        const Failure& failure) {
  auto val = ctx.lookup_const(fuzz_target->getArg(0));
  CAFFEINE_ASSERT(val, "First arg must have a value");
  CAFFEINE_ASSERT(val->is_scalar(), "First arg must have a scalar");
  CAFFEINE_ASSERT(val->scalar().is_pointer(), "First args Value must be a pointer");
  auto ptr = val->scalar().pointer();

  // If this is not true, we need to resolve it manually
  CAFFEINE_ASSERT(ptr.is_resolved(), "Pointer must be resolved");

  // Get the testcase
  auto alloc = ctx.heaps[ptr.heap()][ptr.alloc()];
  auto array = std::move(model.evaluate(*alloc.data()).array());
  auto data = array.data();

  write_to_testcase(afl, data, array.size());
}

} // namespace caffeine
