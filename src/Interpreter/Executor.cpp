#include "caffeine/Interpreter/Executor.h"

namespace caffeine {

void Executor::add_context(Context&& ctx) {
  contexts.push_back(std::move(ctx));
}

Context Executor::next_context() {
  CAFFEINE_ASSERT(!contexts.empty());

  auto ctx = std::move(contexts.back());
  contexts.pop_back();
  return ctx;
}

bool Executor::has_next() const {
  return !contexts.empty();
}

} // namespace caffeine
