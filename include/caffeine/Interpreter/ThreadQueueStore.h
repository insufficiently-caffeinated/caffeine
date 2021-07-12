#pragma once

#include "caffeine/ADT/ThreadMap.h"
#include "caffeine/Interpreter/Store.h"
#include <boost/thread/shared_mutex.hpp>
#include <deque>
#include <random>
#include <thread>
#include <unordered_map>

namespace caffeine {

/**
 * Work-stealing context store.
 *
 * This context store keeps a deque of contexts for each thread. When a thread
 * adds new work to the store then it pushes the work items on the front of its
 * own deque. Then, when a thread needs a new context it will first attempt to
 * take work from the front of its own queue. If there is nothing within its
 * queue then it will randomly attempt to steal from the back of another
 * thread's queue every 100ms until it finds a non-empty other queue.
 *
 * This has 2 main advantages:
 * 1. The item returned from the context store for a thread is highly likely to
 *    be one that was just inserted. This means that it will likely be in cache.
 * 2. When there is no work threads don't waste lots of CPU time spinning on a
 *    condition variable.
 *
 * It does, however, have the disadvantage that no prioritization is done
 * between work items so this will not necessarily efficiently distribute over
 * the work space.
 */
class ThreadQueueContextStore : public ExecutionContextStore {
private:
  struct ThreadQueue {
    std::mutex mutex;
    std::deque<Context> queue;

    std::optional<Context> steal();
    std::optional<Context> dequeue();
  };

  using QueueMap =
      std::unordered_map<std::thread::id, std::unique_ptr<ThreadQueue>>;

  std::condition_variable_any condvar;
  boost::upgrade_mutex mutex;
  QueueMap queues;
  // Store RNGs separately so that we don't create empty queues if not
  // necessary.
  ThreadMap<std::minstd_rand> rngs;

  bool done = false;
  bool explicit_shutdown = false;
  std::atomic_size_t free{0};
  std::atomic_size_t size{0};

public:
  ThreadQueueContextStore(unsigned numthreads);
  ~ThreadQueueContextStore();

  std::optional<Context> next_context() override;

  void add_context(Context&& ctx) override;
  void add_context_multi(Span<Context> ctxs) override;

  void shutdown();

private:
  // Lock the store, doesn't ever create a new queue
  std::pair<std::shared_lock<boost::upgrade_mutex>, ThreadQueue*>
  try_get_thread_queue();

  // Lock the store and create the overall queue if required.
  std::pair<std::shared_lock<boost::upgrade_mutex>, ThreadQueue*>
  get_thread_queue();

  std::minstd_rand& get_rng();
};

} // namespace caffeine
