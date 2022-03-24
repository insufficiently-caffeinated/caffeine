#pragma once

#include "caffeine/Interpreter/Store.h"
#include <shared_mutex>
#include <thread>
#include <tsl/hopscotch_map.h>

namespace caffeine {

class ThreadCacheContextStore : public ExecutionContextStore {
public:
  ThreadCacheContextStore(std::unique_ptr<ExecutionContextStore>&& store)
      : store_(std::move(store)) {}

  std::optional<Context> next_context() override;

  void add_context(Context&& ctx) override;
  void add_context_multi(Span<Context> ctxs) override;
  void shutdown() override;

private:
  std::atomic<bool> done_{false};
  std::unique_ptr<ExecutionContextStore> store_;
  std::shared_mutex mutex_;
  tsl::hopscotch_map<std::thread::id, std::optional<Context>> cache_;
};

} // namespace caffeine
