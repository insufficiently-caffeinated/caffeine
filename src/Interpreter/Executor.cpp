#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Store.h"

namespace caffeine {

Executor::Executor(ExecutionPolicy* policy, ExecutionContextStore* store,
                   FailureLogger* logger, const ExecutorOptions& options)
    : policy(policy), store(store), logger(logger), options(options) {}

void Executor::run() {
  while (auto ctx = store->next_context()) {
    Interpreter interpreter(&ctx.value(), policy, store, logger);
    interpreter.execute();
  }
}

} // namespace caffeine
