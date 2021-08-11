#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Support/UnsupportedOperation.h"

#include <memory>
#include <thread>
#include <z3++.h>

namespace caffeine {

ExecutorOptions::ExecutorOptions(std::shared_ptr<llvm::Module> module)
    : mod{module} {
  pass_manager = std::make_shared<llvm::PassManager<llvm::Module>>();
  // TODO: Add manadatory Caffeine passes
}

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
  CAFFEINE_ASSERT(
      options.mod,
      "Module must be specified in ExecutorOptions for optimization passes");

  auto module_analysis_manager = llvm::ModuleAnalysisManager();
  options.pass_manager->run(*options.mod, module_analysis_manager);

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
