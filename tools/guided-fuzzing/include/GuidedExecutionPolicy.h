#pragma once

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

/**
 * This class accepts an AssertionList and makes sure that every Context's
 * assertions combined with the given AssertionList is satisfiable.
 */
class GuidedExecutionPolicy : public ExecutionPolicy {
  AssertionList requiredAssertions_;
  std::shared_ptr<Solver> solver_;

public:
  GuidedExecutionPolicy(AssertionList& list, std::shared_ptr<Solver> solver);
  ~GuidedExecutionPolicy() = default;

  virtual bool should_queue_path(const Context& ctx);

protected:
  GuidedExecutionPolicy(GuidedExecutionPolicy&&) = default;
  GuidedExecutionPolicy(const GuidedExecutionPolicy&) = default;

  GuidedExecutionPolicy& operator=(GuidedExecutionPolicy&&) = default;
  GuidedExecutionPolicy& operator=(const GuidedExecutionPolicy&) = default;
};

} // namespace caffeine
