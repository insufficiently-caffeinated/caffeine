#include "caffeine/Interpreter/Store/CountLimitedStore.h"
#include <atomic>
#include <memory>

namespace caffeine {

CountLimitedStore::CountLimitedStore(
    uint64_t context_limit, std::unique_ptr<ExecutionContextStore>&& store)
    : store(std::move(store)), limit(context_limit) {}

std::optional<Context> CountLimitedStore::next_context() {
  uint64_t current = count.fetch_add(1, std::memory_order_relaxed);
  if (current == limit)
    shutdown();
  if (current > limit)
    return std::nullopt;

  return store->next_context();
}

void CountLimitedStore::add_context(Context&& ctx) {
  store->add_context(std::move(ctx));
}
void CountLimitedStore::add_context_multi(Span<Context> contexts) {
  store->add_context_multi(contexts);
}

void CountLimitedStore::shutdown() {
  store->shutdown();
}

} // namespace caffeine
