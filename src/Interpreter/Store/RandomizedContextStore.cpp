#include "caffeine/ADT/Guard.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Support/Assert.h"
#include <iostream>

namespace caffeine {

RandomizedContextStore::RandomizedContextStore(size_t num_readers)
    : num_readers{num_readers}, dev{std::random_device()} {}

void RandomizedContextStore::add_context(Context&& ctx) {
  auto lock = std::unique_lock(mutex);
  contexts.push_back(std::move(ctx));
  lock.unlock();
  condvar.notify_one();
}
std::optional<Context> RandomizedContextStore::next_context() {
  auto lock = std::unique_lock(mutex);
  if (done)
    return std::nullopt;
  if (!contexts.empty())
    return removeRandom();

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
  return removeRandom();
}

Context RandomizedContextStore::removeRandom() {
  CAFFEINE_ASSERT(!contexts.empty());
  std::mt19937 rng(dev());
  std::uniform_int_distribution<std::mt19937::result_type> dist(
      0, contexts.size() - 1);

  size_t selected = dist(rng);

  Context ctx = std::move(contexts[selected]);
  if (selected != contexts.size() - 1)
    std::swap(contexts[selected], contexts.back());
  contexts.pop_back();
  return ctx;
}

} // namespace caffeine