#pragma once

#include "caffeine/ADT/Span.h"
#include "caffeine/ADT/ThreadMap.h"
#include "caffeine/Interpreter/Context.h"
#include <condition_variable>
#include <mutex>
#include <optional>
#include <queue>

namespace caffeine {

/**
 * A store of Contexts that are not currently being executed.
 *
 * Note that when executing in a multithreaded fashion this may be accessed
 * concurrently from multiple threads.
 */
class ExecutionContextStore {
public:
  ExecutionContextStore() = default;
  virtual ~ExecutionContextStore() = default;

  // Get the next available context in the store. If no context is available
  // then returns std::nullopt.
  virtual std::optional<Context> next_context() = 0;

  // Add a context to the store so that it can be retrieved later.
  virtual void add_context(Context&& ctx) = 0;

  // Add multiple contexts to the store at once. This method may move out of the
  // contexts provided within the span.
  //
  // By default this will just call add_context in a loop.
  virtual void add_context_multi(Span<Context> contexts);

protected:
  ExecutionContextStore(ExecutionContextStore&&) = default;
  ExecutionContextStore(const ExecutionContextStore&) = default;

  ExecutionContextStore& operator=(ExecutionContextStore&&) = default;
  ExecutionContextStore& operator=(const ExecutionContextStore&) = default;
};

/**
 * Global context store which stores all tasks in a global queue. Reading the
 * next context will block if one is not present in the queue.
 *
 * This queue has one special behaviour in that it will exit once all the
 * readers have blocked on the queue. For that reason, the number of consuming
 * threads must be known in advance.
 */
class QueueingContextStore : public ExecutionContextStore {
public:
  explicit QueueingContextStore(size_t num_readers);

  std::optional<Context> next_context() override;

  void add_context(Context&& ctx) override;
  void add_context_multi(Span<Context> contexts) override;

  void shutdown();

private:
  Context dequeue();

private:
  std::mutex mutex;
  std::condition_variable condvar;

  size_t blocked = 0;
  size_t num_readers;

  bool done = false;
  std::queue<Context> queue;
};

/**
 * @brief A context store which drops all added contexts.
 *
 * This is mainly meant to be used for testing and would not be useful for
 * actually running the interpreter.
 */
class NullContextStore : public ExecutionContextStore {
public:
  NullContextStore() = default;

  std::optional<Context> next_context() override final;

  void add_context(Context&& ctx) override final;
  void add_context_multi(Span<Context> ctxs) override final;
};

} // namespace caffeine
