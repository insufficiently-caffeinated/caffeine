#pragma once
#include "caffeine/Interpreter/FailureLogger.h"

#include <llvm/IR/Module.h>

extern "C" {
#include "afl-fuzz.h"
}

namespace caffeine {

// A class for turning errors into testcases
class TestCaseFailureLogger : public FailureLogger {
private:
  llvm::Function* fuzz_target;
  std::shared_ptr<Solver> solver;
  afl_state_t * afl;

public:
  // fuzz_target should be a function with the same signature as
  //   `LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size)`
  TestCaseFailureLogger(llvm::Function* fuzz_target, std::shared_ptr<Solver> solver, afl_state_t * afl);
  void log_failure(const Model& model, const Context& ctx,
                   const Failure& failure) override;
};

} // namespace caffeine
