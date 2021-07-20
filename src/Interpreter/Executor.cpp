#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Support/UnsupportedOperation.h"

#include <thread>
#include <z3++.h>

namespace caffeine {

void Executor::run_worker() {
  auto solver = builder->build();

  while (auto ctx = store->next_context()) {
    auto guard_ = UnsupportedOperation::SetCurrentContext(&ctx.value());

    try {
      Interpreter interp(&ctx.value(), policy, store, logger, solver);
      interp.execute();
    } catch (UnsupportedOperationException&) {
      // The assert that threw this already printed an error message
      // TODO: We should have a better way to indicate that this failed to the
      //       parent program.

      logger->log_failure(
          nullptr, ctx.value(),
          Failure(Assertion(), "internal error: unsupported operation"));
    }
  }
}

Executor::Executor(ExecutionPolicy* policy, ExecutionContextStore* store,
                   FailureLogger* logger, const SolverBuilder* builder,
                   const ExecutorOptions& options)
    : policy(policy), store(store), logger(logger), builder(builder),
      options(options) {}

void Executor::run() {
  if (options.num_threads == 1) {
    run_worker();
    return;
  }

  std::vector<std::thread> threads;

  for (uint32_t i = 0; i < options.num_threads; i++) {
    threads.emplace_back([&] { run_worker(); });
  }

  for (auto& thread : threads) {
    thread.join();
  }
}

} // namespace caffeine
