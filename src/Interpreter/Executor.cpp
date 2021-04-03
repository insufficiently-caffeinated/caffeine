#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Store.h"

#include <iostream>
#include <thread>

namespace caffeine {

void run_worker(Executor* exec, FailureLogger* logger,
                ExecutionContextStore* store) {
  while (true) {
    auto ctx = store->next_context();

    if (!ctx.has_value()) {
      return;
    }

    Interpreter interp(&ctx.value(), exec->policy, store, logger);
    interp.execute();
  }
}

Executor::Executor(ExecutionPolicy* policy, ExecutionContextStore* store,
                   FailureLogger* logger, const ExecutorOptions& options)
    : policy(policy), store(store), logger(logger), options(options) {}

void Executor::run() {
  std::vector<std::thread> threads;

  for (uint32_t i = 0; i < options.num_threads; i++) {
    threads.emplace_back(run_worker, this, logger, store);
  }

  for (auto& thread : threads) {
    thread.join();
  }
}

} // namespace caffeine
