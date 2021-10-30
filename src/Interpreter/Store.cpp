#include "caffeine/Interpreter/Store.h"

namespace caffeine {

void ExecutionContextStore::add_context_multi(Span<Context> contexts) {
  // notify_context_added(contexts.size());
  for (Context& ctx : contexts) {
    add_context(std::move(ctx));
  }
}

} // namespace caffeine
