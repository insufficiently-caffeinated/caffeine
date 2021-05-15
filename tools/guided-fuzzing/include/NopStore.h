#pragma once

#include "caffeine/Interpreter/Store.h"

namespace caffeine {

class NopStore : public ExecutionContextStore {
  std::optional<Context> next_context() override {
    return std::nullopt;
  }

  // Add a context to the store so that it can be retrieved later.
  void add_context(Context&& ctx) override {}
};

} // namespace caffeine
