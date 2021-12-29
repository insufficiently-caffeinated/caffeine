#pragma once

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/ContextEvent.h"

namespace caffeine {

class Context;

/**
 * Class to control the behaviour of an Interpreter instance. It also provides a
 * number of hooks for the policy to execute code when various context-related
 * events occur within the executor. By default, these do nothing.
 *
 * If you don't care about controlling queuing behaviour you may want to derive
 * from AlwaysAllowExecutionPolicy instead of the base ExecutionPolicy class.
 */
class ExecutionPolicy : public ContextEventNotifier {
public:
  enum ExitStatus {
    // The context returned from the top-level function.
    Success,
    // The context failed an assertion. Note that the context may continue to be
    // run with !fail_condition added to the path spec.
    Fail,
    // The context has an unsatisfiable path condition so there is no point in
    // running it any further.
    Dead,
    // The context was removed because the policy indicated that it should not
    // be queued.
    Removed
  };

public:
  ExecutionPolicy() = default;
  virtual ~ExecutionPolicy() = default;

  /**
   * Called when a context forks to determine whether we should continue
   * executing that branch.
   *
   * Note that this method does not control whether dead branches continue to
   * execute. Those will be pruned irregardless of what this method returns.
   */
  virtual bool should_queue_path(const Context& ctx) = 0;

  // Called when a context is forked into multiple contexts.
  //
  // Note that assertion failures do not cause a path to be forked.
  virtual void on_path_forked(Context& ctx);
  // Called when a context is removed from the queue to be executed.
  virtual void on_path_dequeued(Context& ctx);
  // Called when a path completes along with the status of how that path
  // completed.
  //
  // Note that when the exit status is `Fail` the context will continue to be
  // used for the non-failure path if it is valid.
  virtual void on_path_complete(const Context& ctx, ExitStatus status,
                                const Assertion& assertion = Assertion());

protected:
  ExecutionPolicy(ExecutionPolicy&&) = default;
  ExecutionPolicy(const ExecutionPolicy&) = default;

  ExecutionPolicy& operator=(ExecutionPolicy&&) = default;
  ExecutionPolicy& operator=(const ExecutionPolicy&) = default;
};

/**
 * Execution policy which always indicates that a new context should be
 * enqueued.
 */
class AlwaysAllowExecutionPolicy : public ExecutionPolicy {
public:
  virtual bool should_queue_path(const Context& ctx) override;
};

} // namespace caffeine
