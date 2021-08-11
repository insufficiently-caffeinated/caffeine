#ifndef CAFFEINE_INTERP_EXECUTOR_H
#define CAFFEINE_INTERP_EXECUTOR_H

#include <cstdint>

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/Store.h"

#include <llvm/IR/PassManager.h>

namespace caffeine {

class ExecutionPolicy;
class ExecutionContextStore;

struct ExecutorOptions {
  uint32_t num_threads = 2;
  std::shared_ptr<llvm::PassManager<llvm::Module>> pass_manager;
  std::shared_ptr<llvm::Module> mod;

  ExecutorOptions(std::shared_ptr<llvm::Module> module);
};

class Executor {
private:
  ExecutionPolicy* policy;
  ExecutionContextStore* store;
  FailureLogger* logger;
  const SolverBuilder* builder;
  ExecutorOptions options;

public:
  Executor(ExecutionPolicy* policy, ExecutionContextStore* store,
           FailureLogger* logger, const SolverBuilder* builder,
           const ExecutorOptions& options);

  /**
   * Runs optimization passes on the LLVM module and then runs the contexts in
   * its possesion until there are none left
   */
  void run();

private:
  void run_worker();
};

} // namespace caffeine

#endif
