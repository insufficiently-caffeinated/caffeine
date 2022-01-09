#pragma once

#include "caffeine/Interpreter/Store.h"
#include <atomic>

namespace caffeine {

// An execution context store that will only return at most a limited number of
// contexts.
//
// This is useful for limiting the runtime of caffeine. Note that the limit
// figure here is the number of contexts that have been removed from the store
// and will not match the progress bar displayed in the terminal.
class CountLimitedStore : public ExecutionContextStore {
public:
  CountLimitedStore(uint64_t context_limit,
                    std::unique_ptr<ExecutionContextStore>&& store);

  std::optional<Context> next_context() override;
  void add_context(Context&& ctx) override;
  void add_context_multi(Span<Context> contexts) override;

private:
  std::unique_ptr<ExecutionContextStore>&& store;
  std::atomic<uint64_t> count{0};
  uint64_t limit;
};

} // namespace caffeine
