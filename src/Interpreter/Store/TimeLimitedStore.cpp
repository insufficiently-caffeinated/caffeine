#include "caffeine/Interpreter/Store/TimeLimitedStore.h"
#include "caffeine/Interpreter/Context.h"
#include <chrono>
#include <tuple>

namespace caffeine {

TimeLimitedStore::TimeLimitedStore(
    std::chrono::time_point<std::chrono::steady_clock> endpoint,
    std::unique_ptr<ExecutionContextStore>&& store)
    : store(std::move(store)), endpoint(endpoint) {}

std::optional<Context> TimeLimitedStore::next_context() {
  auto now = std::chrono::steady_clock::now();

  if (now > endpoint)
    return std::nullopt;

  return store->next_context();
}

void TimeLimitedStore::add_context(Context&& ctx) {
  store->add_context(std::move(ctx));
}
void TimeLimitedStore::add_context_multi(Span<Context> contexts) {
  store->add_context_multi(contexts);
}

} // namespace caffeine
