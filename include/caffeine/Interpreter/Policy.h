#pragma once

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
class ExecutionPolicy {
public:
  enum ExitStatus { Success, Fail, Dead };

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
  virtual void on_path_complete(const Context& ctx, ExitStatus status);

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
