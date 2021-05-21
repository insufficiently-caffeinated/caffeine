#pragma once

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Solver/Solver.h"

#include "include/CaffeineMutator.h"

namespace caffeine {

class NeverQueuePolicy : public ExecutionPolicy {
  TestCaseStoragePtr cases;
  std::shared_ptr<Solver> solver;
  CaffeineMutator* mutator;

public:
  NeverQueuePolicy(TestCaseStoragePtr cases, CaffeineMutator* mutator);
  bool should_queue_path(const Context& ctx) override;
  void on_path_complete(const Context& ctx, ExitStatus status,
                        const Assertion& extra) override;
};

} // namespace caffeine
