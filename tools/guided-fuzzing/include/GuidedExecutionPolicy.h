#pragma once

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Solver/Solver.h"

#include "CaffeineMutator.h"

extern "C" {
#include "afl-fuzz.h"
}

namespace caffeine {

/**
 * This class accepts an AssertionList and makes sure that every Context's
 * assertions combined with the given AssertionList is satisfiable.
 */
class GuidedExecutionPolicy : public ExecutionPolicy {
  CaffeineMutator* mutator;
  TestCaseStoragePtr cases;
  std::string data;
  std::string symbol_name;

public:
  GuidedExecutionPolicy(std::string_view data, std::string symbol_name,
                        CaffeineMutator* mutator, TestCaseStoragePtr cases);
  ~GuidedExecutionPolicy() = default;

  bool should_queue_path(const Context& ctx) override;
  void on_path_complete(const Context& ctx, ExitStatus status,
                        const Assertion& assertion = Assertion()) override;

protected:
  GuidedExecutionPolicy(GuidedExecutionPolicy&&) = default;
  GuidedExecutionPolicy(const GuidedExecutionPolicy&) = default;

  GuidedExecutionPolicy& operator=(GuidedExecutionPolicy&&) = default;
  GuidedExecutionPolicy& operator=(const GuidedExecutionPolicy&) = default;
};

} // namespace caffeine
