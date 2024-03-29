#pragma once

#include "caffeine/Interpreter/Store.h"
#include <atomic>
#include <chrono>

namespace caffeine {

// A store that keeps returning new contexts until the provided end time has
// passed.
class TimeLimitedStore : public ExecutionContextStore {
public:
  TimeLimitedStore(std::chrono::time_point<std::chrono::steady_clock> endpoint,
                   std::unique_ptr<ExecutionContextStore>&& store);

  std::optional<Context> next_context() override;
  void add_context(Context&& ctx) override;
  void add_context_multi(Span<Context> contexts) override;

  void shutdown() override;

private:
  std::unique_ptr<ExecutionContextStore> store;
  std::chrono::time_point<std::chrono::steady_clock> endpoint;
  std::atomic<bool> shutdown_started{false};
};

} // namespace caffeine
