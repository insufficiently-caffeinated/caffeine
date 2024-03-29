#include "caffeine/ADT/Guard.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

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
  notify_context_added();
  auto lock = std::unique_lock(mutex);
  queue.push(std::move(ctx));
  lock.unlock();
  condvar.notify_one();
}
void QueueingContextStore::add_context_multi(Span<Context> ctxs) {
  notify_context_added(ctxs.size());
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

} // namespace caffeine
