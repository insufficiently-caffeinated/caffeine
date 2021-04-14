#pragma once

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

/**
 * Class to control the behaviour of an Interpreter instance. It also provides a
 * number of hooks for the policy to execute code when various context-related
 * events occur within the executor. By default, these do nothing.
 *
 * If you don't care about controlling queuing behaviour you may want to derive
 * from AlwaysAllowExecutionPolicy instead of the base ExecutionPolicy class.
 */
class GuidedExecutionPolicy : ExecutionPolicy {
  AssertionList requiredAssertions_;
  std::shared_ptr<Solver> solver_;

public:
  GuidedExecutionPolicy(AssertionList& list, std::shared_ptr<Solver> solver);
  ~GuidedExecutionPolicy() = default;

  /**
   * Called when a context forks to determine whether we should continue
   * executing that branch.
   *
   * Note that this method does not control whether dead branches continue to
   * execute. Those will be pruned irregardless of what this method returns.
   */
  virtual bool should_queue_path(const Context& ctx);

protected:
  GuidedExecutionPolicy(GuidedExecutionPolicy&&) = default;
  GuidedExecutionPolicy(const GuidedExecutionPolicy&) = default;

  GuidedExecutionPolicy& operator=(GuidedExecutionPolicy&&) = default;
  GuidedExecutionPolicy& operator=(const GuidedExecutionPolicy&) = default;
};

} // namespace caffeine
