#pragma once
#include "caffeine/Interpreter/FailureLogger.h"

#include "include/CaffeineMutator.h"

#include <llvm/IR/Module.h>

extern "C" {
#include "afl-fuzz.h"
}

namespace caffeine {

// A class for turning errors into testcases
class TestCaseFailureLogger : public FailureLogger {
private:
  CaffeineMutator* mutator;
  TestCaseStoragePtr cases;

public:
  TestCaseFailureLogger(TestCaseStoragePtr cases, CaffeineMutator* mutator);
  void log_failure(const Model* model, const Context& ctx,
                   const Failure& failure) override;
};

} // namespace caffeine
