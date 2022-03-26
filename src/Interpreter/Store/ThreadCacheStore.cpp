#include "caffeine/Interpreter/Store/ThreadCacheStore.h"
#include <atomic>
#include <optional>
#include <thread>

namespace caffeine {

std::optional<Context> ThreadCacheContextStore::next_context() {
  if (done_.load(std::memory_order_relaxed))
    return std::nullopt;

  std::shared_lock guard(mutex_);

  auto it = cache_.find(std::this_thread::get_id());
  if (it == cache_.end()) {
    // We only allocate a cache spot during next_context since otherwise
    // contexts could be stranded in threads that only insert into the queue but
    // don't do work otherwise (i.e. the main thread).
    guard.unlock();

    std::unique_lock wguard(mutex_);
    cache_.emplace(std::this_thread::get_id(), std::nullopt);
  } else if (it->second.has_value()) {
    Context ctx = std::move(it.value().value());
    it.value() = std::nullopt;
    return ctx;
  } else {
    guard.unlock();
  }

  return store_->next_context();
}

void ThreadCacheContextStore::add_context(Context&& ctx) {
  std::shared_lock guard(mutex_);

  auto it = cache_.find(std::this_thread::get_id());
  if (it != cache_.end() && !it.value().has_value()) {
    it.value() = std::move(ctx);
    return;
  }

  guard.unlock();
  store_->add_context(std::move(ctx));
}

void ThreadCacheContextStore::add_context_multi(Span<Context> ctxs) {
  if (ctxs.empty())
    return;

  std::shared_lock guard(mutex_);

  auto it = cache_.find(std::this_thread::get_id());
  if (it != cache_.end() && !it.value().has_value()) {
    it.value() = std::move(ctxs.front());
    ctxs = ctxs.subslice(1);
  }

  guard.unlock();
  store_->add_context_multi(ctxs);
}

void ThreadCacheContextStore::shutdown() {
  done_ = true;
  store_->shutdown();
}

} // namespace caffeine
