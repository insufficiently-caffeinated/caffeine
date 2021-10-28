#include "caffeine/Interpreter/Store.h"
#include "caffeine/ADT/Guard.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/Assert.h"
#include <random>
#include <iostream>

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

Context QueueingContextStore::dequeue() {
  CAFFEINE_ASSERT(!queue.empty());

  Context ctx = std::move(queue.front());
  queue.pop();
  return ctx;
}

RandomizedContextStore::RandomizedContextStore(site_t num_readers):
  num_readers{num_readers} {}

void RandomizedContextStore::add_context(Context&& ctx) {
  auto lock = std::unique_lock(mutex);
  auto vecLock = std::unique_lock(vecMutex);
  context.push_back(std::move(ctx));
  vecLock.unlock();
  lock.unlock();
  condvar.notify_one();
}
std::optional<Context> RandomizedContextStore::next_context() {
  auto lock = std::unique_lock(mutex);
  if (done)
    return std::nullopt;
  if (!contexts.empty())
    return dequeue();

  blocked += 1;
  auto guard = make_guard([&] { blocked -= 1; });

  if (blocked == num_readers) {
    done = true;
    condvar.notify_all();
  }

  while (contexts.empty() && !done)
    condvar.wait(lock);

  if (done)
    return std::nullopt;
  return dequeue();
}

Context RandomizedContextStore::removeRandom() {
  CAFFEINE_ASSERT(!contexts.empty());

  auto lock = std::unique_lock(vecMutex);
  std::random_device dev;
  std::mt19937 rng(dev());
  std::uniform_int_distribution<std::mt19937::result_type> dist(0, context.size() - 1);

  Context ctx = context[n];
  std::swap(contexts[n], contexts.back());
  contexts.pop_back();
  lock.unlock();
  return ctx;
}

} // namespace caffeine
