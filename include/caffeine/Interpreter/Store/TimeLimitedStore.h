#pragma once

#include "caffeine/Interpreter/Store.h"
#include <chrono>

namespace caffeine {

class TimeLimitedStore : public ExecutionContextStore {
public:
  TimeLimitedStore(std::chrono::time_point<std::chrono::steady_clock> endpoint,
                   std::unique_ptr<ExecutionContextStore>&& store);

  std::optional<Context> next_context() override;
  void add_context(Context&& ctx) override;
  void add_context_multi(Span<Context> contexts) override;

private:
  std::unique_ptr<ExecutionContextStore> store;
  std::chrono::time_point<std::chrono::steady_clock> endpoint;
};

} // namespace caffeine
