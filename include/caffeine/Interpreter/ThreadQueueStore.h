#pragma once

#include "caffeine/ADT/ThreadMap.h"
#include "caffeine/Interpreter/Store.h"
#include <boost/thread/shared_mutex.hpp>
#include <deque>
#include <random>
#include <thread>
#include <unordered_map>

namespace caffeine {

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
