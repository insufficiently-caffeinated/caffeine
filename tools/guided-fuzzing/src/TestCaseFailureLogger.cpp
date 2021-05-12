#include "include/TestCaseFailureLogger.h"

namespace caffeine {

TestCaseFailureLogger::TestCaseFailureLogger(llvm::Function* fuzz_target)
    : fuzz_target{fuzz_target} {

}

void TestCaseFailureLogger::log_failure(const Model& model, const Context& ctx,
                                        const Failure& failure) {
  auto val = ctx.lookup_const(fuzz_target->getArg(0));
  CAFFEINE_ASSERT(val, "First arg must have a value");
  CAFFEINE_ASSERT(val->is_scalar(), "First arg must have a scalar");
  CAFFEINE_ASSERT(val->scalar().is_pointer(), "First args Value must be a pointer");
  auto ptr = val->scalar().pointer();

  ctx.heaps.resolve(solver, ptr, ctx);
}

} // namespace caffeine
