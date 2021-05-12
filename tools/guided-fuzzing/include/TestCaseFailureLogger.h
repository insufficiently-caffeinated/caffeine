#pragma once
#include "caffeine/Interpreter/FailureLogger.h"

#include <llvm/IR/Module.h>

namespace caffeine {

// A class for turning errors into testcases
class TestCaseFailureLogger : FailureLogger {
private:
  llvm::Function* fuzz_target;

public:
  // fuzz_target should be a function with the same signature as
  //   `LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size)`
  TestCaseFailureLogger(llvm::Function* fuzz_target);
  void log_failure(const Model& model, const Context& ctx,
                   const Failure& failure) override;
};

} // namespace caffeine
