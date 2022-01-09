#include "caffeine/Interpreter/ThreadQueueStore.h"
#include "caffeine/Support/Tracing.h"
#include <chrono>
#include <fmt/format.h>
#include <iostream>
#include <iterator>

namespace caffeine {

namespace {
  // Unique lock that can be downgraded down to a shared lock.
  struct downgrade_lock {
  private:
    boost::upgrade_mutex* mutex;

  public:
    downgrade_lock(boost::upgrade_mutex& mutex) : mutex(&mutex) {
      mutex.lock();
    }
    ~downgrade_lock() {
      if (mutex)
        mutex->unlock();
    }

    // Not copy anythingable
    downgrade_lock(const downgrade_lock&) = delete;
    downgrade_lock& operator=(const downgrade_lock&) = delete;

    downgrade_lock(downgrade_lock&& lock) noexcept : mutex(lock.mutex) {
      lock.mutex = nullptr;
    }
    downgrade_lock& operator=(downgrade_lock&& lock) {
      if (mutex)
        mutex->unlock();

      mutex = lock.mutex;
      lock.mutex = nullptr;
      return *this;
    }

    // Atomically convert this lock from a unique lock to a shared lock.
    std::shared_lock<boost::upgrade_mutex> downgrade() {
      auto guard = make_guard([&] { this->mutex = nullptr; });
      mutex->unlock_and_lock_shared();
      return std::shared_lock<boost::upgrade_mutex>(*mutex, std::adopt_lock);
    }
  };
} // namespace

std::optional<Context> ThreadQueueContextStore::ThreadQueue::steal() {
  auto lock = std::unique_lock(mutex);

  if (queue.empty())
    return std::nullopt;

  auto guard = make_guard([&] { queue.pop_front(); });
  return std::move(queue.front());
}

std::optional<Context> ThreadQueueContextStore::ThreadQueue::dequeue() {
  auto lock = std::unique_lock(mutex);

  if (queue.empty())
    return std::nullopt;

  auto guard = make_guard([&] { queue.pop_back(); });
  return std::move(queue.back());
}

ThreadQueueContextStore::ThreadQueueContextStore(unsigned numthreads)
    : free(numthreads) {}
ThreadQueueContextStore::~ThreadQueueContextStore() {
  if (explicit_shutdown)
    return;
}

std::optional<Context> ThreadQueueContextStore::next_context() {
  auto block = CAFFEINE_TRACE_SPAN("TQCS::next_context");
  auto [lock, tqueue] = try_get_thread_queue();

  if (tqueue) {
    if (auto result = tqueue->dequeue()) {
      size -= 1;

      return result;
    }
  }

  auto guard = make_guard([&] { free += 1; });
  size_t cfree = --free;
  size_t csize = size.load();

  if (cfree == 0 && csize == 0) {
    // Every thread is currently blocked and we have nothing in our queue. This
    // means that it is time to shut down and so we need to unblock everything
    // and terminate the program.

    // Safe since all other threads are blocked
    done = true;

    // This synchronizes with condvar::wait so all threads will be able to see
    // our assignment to done.
    condvar.notify_all();

    return std::nullopt;
  }

  block.annotate("blocking", "true");
  auto& engine = get_rng();

  // If our queue is empty then we try to pull a context off the back of a
  // random queue. We repeat this until we find a non-empty queue.
  while (!done) {
    std::uniform_int_distribution<size_t> dist(0, queues.size() - 1);
    size_t index = dist(engine);

    auto it = queues.begin();
    std::advance(it, index);
    if (auto result = it->second->steal()) {
      block.annotate("stolen-from", fmt::format("{}", index));
      block.annotate("num-queues", fmt::format("{}", queues.size()));
      size -= 1;
      return result;
    }

    condvar.wait_for(lock, std::chrono::milliseconds(100));
  }

  return std::nullopt;
}

void ThreadQueueContextStore::add_context(Context&& ctx) {
  [[maybe_unused]] auto block = CAFFEINE_TRACE_SPAN("TQCS::add_context");
  auto [lock, tqueue] = get_thread_queue();
  auto queue_lock = std::unique_lock(tqueue->mutex);

  size.fetch_add(1);
  tqueue->queue.push_back(ctx);
  notify_context_added();
}

void ThreadQueueContextStore::add_context_multi(Span<Context> ctxs) {
  [[maybe_unused]] auto block = CAFFEINE_TRACE_SPAN("TQCS::add_context_multi");
  auto [lock, tqueue] = get_thread_queue();
  auto queue_lock = std::unique_lock(tqueue->mutex);

  size.fetch_add(ctxs.size());
  notify_context_added(ctxs.size());
  for (auto&& ctx : ctxs) {
    tqueue->queue.push_back(std::move(ctx));
  }
}

void ThreadQueueContextStore::shutdown() {
  auto lock = std::shared_lock(mutex);
  done = true;
  explicit_shutdown = true;
}

std::pair<std::shared_lock<boost::upgrade_mutex>,
          ThreadQueueContextStore::ThreadQueue*>
ThreadQueueContextStore::try_get_thread_queue() {
  auto id = std::this_thread::get_id();
  auto lock = std::shared_lock(mutex);
  auto it = queues.find(id);
  ThreadQueue* queue = nullptr;

  if (it != queues.end()) {
    queue = it->second.get();
  }

  return {std::move(lock), queue};
}

std::pair<std::shared_lock<boost::upgrade_mutex>,
          ThreadQueueContextStore::ThreadQueue*>
ThreadQueueContextStore::get_thread_queue() {
  auto id = std::this_thread::get_id();
  auto lock = std::shared_lock(mutex);
  auto it = queues.find(id);

  if (it == queues.end()) {
    lock.unlock();
    auto unique = downgrade_lock(mutex);
    it = queues.emplace(id, std::make_unique<ThreadQueue>()).first;
    lock = unique.downgrade();
  }

  return {std::move(lock), it->second.get()};
}

std::minstd_rand& ThreadQueueContextStore::get_rng() {
  if (auto* rng = rngs.get())
    return *rng;

  return rngs.get_or_insert(std::random_device()());
}

} // namespace caffeine
