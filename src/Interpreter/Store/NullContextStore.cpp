#include "caffeine/Interpreter/Store.h"

namespace caffeine {

std::optional<Context> NullContextStore::next_context() {
  return std::nullopt;
}

void NullContextStore::add_context(Context&&) {}
void NullContextStore::add_context_multi(Span<Context>) {}

} // namespace caffeine
