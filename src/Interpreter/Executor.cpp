#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

Executor::Executor(FailureLogger* logger, uint32_t num_threads)
    : logger{logger}, num_threads{num_threads} {}

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

void Executor::run() {
  while (has_next()) {
    auto ctx = next_context();
    Interpreter interp(this, &ctx, logger);

    interp.execute();
  }
}

} // namespace caffeine
