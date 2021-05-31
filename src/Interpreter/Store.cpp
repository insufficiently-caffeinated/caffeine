
#include "caffeine/Interpreter/Store.h"
#include "caffeine/ADT/Guard.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

void ExecutionContextStore::add_context_multi(Span<Context> contexts) {
  for (Context& ctx : contexts) {
    add_context(std::move(ctx));
  }
}

QueueingContextStore::QueueingContextStore(size_t num_readers)
    : num_readers(num_readers) {}

std::optional<Context> QueueingContextStore::next_context() {
  auto lock = std::unique_lock(mutex);
  if (done)
    return std::nullopt;
  if (!queue.empty())
    return dequeue();

  blocked += 1;
  auto guard = make_guard([&] { blocked -= 1; });

  if (blocked == num_readers) {
    done = true;
    condvar.notify_all();
  }

  while (queue.empty() && !done)
    condvar.wait(lock);

  if (done)
    return std::nullopt;
  return dequeue();
}

void QueueingContextStore::add_context(Context&& ctx) {
  auto lock = std::unique_lock(mutex);
  queue.push(std::move(ctx));
  lock.unlock();
  condvar.notify_one();
}
void QueueingContextStore::add_context_multi(Span<Context> ctxs) {
  auto lock = std::unique_lock(mutex);
  for (Context& ctx : ctxs)
    queue.push(std::move(ctx));
  lock.unlock();

  if (ctxs.size() == 1)
    condvar.notify_one();
  else
    condvar.notify_all();
}

void QueueingContextStore::shutdown() {
  auto lock = std::unique_lock(mutex);
  done = true;
  lock.unlock();
  condvar.notify_all();
}

QueueingContextStore::~QueueingContextStore() {
  shutdown();
}

Context QueueingContextStore::dequeue() {
  CAFFEINE_ASSERT(!queue.empty());

  Context ctx = std::move(queue.front());
  queue.pop();
  return ctx;
}

ThreadQueuedContextStore::ThreadQueuedContextStore(size_t num_readers,
                                                   size_t cache_size)
    : QueueingContextStore(num_readers), cache_size(cache_size) {}

std::optional<Context> ThreadQueuedContextStore::next_context() {
  auto& queue = locals.get_or_insert();
  if (!queue.empty()) {
    Context ctx = std::move(queue.back());
    queue.pop_back();
    return ctx;
  }

  return QueueingContextStore::next_context();
}

void ThreadQueuedContextStore::add_context(Context&& ctx) {
  auto* queue = locals.get();
  if (!queue)
    return QueueingContextStore::add_context(std::move(ctx));

  if (queue->size() >= cache_size) {
    QueueingContextStore::add_context(std::move(queue->front()));
    queue->pop_front();
  }

  queue->push_back(std::move(ctx));
}
void ThreadQueuedContextStore::add_context_multi(Span<Context> ctxs) {
  auto* queue = locals.get();
  if (!queue)
    return QueueingContextStore::add_context_multi(ctxs);

  while (queue->size() < cache_size && !ctxs.empty()) {
    queue->push_back(std::move(ctxs.front()));
    ctxs = ctxs.subslice(1);
  }

  if (!ctxs.empty())
    QueueingContextStore::add_context_multi(ctxs);
}

} // namespace caffeine
