#ifndef CAFFEINE_INTERP_EXECUTOR_H
#define CAFFEINE_INTERP_EXECUTOR_H

#include <atomic>
#include <cstdint>
#include <mutex>

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/Store.h"

namespace caffeine {

class ExecutionPolicy;
class ExecutionContextStore;
class CaffeineContext;

struct ExecutorOptions {
  uint32_t num_threads = 2;

  constexpr ExecutorOptions() = default;
};

class Executor {
private:
  CaffeineContext* caffeine;
  ExecutionPolicy* policy;
  ExecutionContextStore* store;
  FailureLogger* logger;
  ExecutorOptions options;
  std::vector<std::shared_ptr<Solver>> solvers;
  std::mutex mutex_;

public:
  std::shared_ptr<std::atomic_bool> should_stop;
  Executor(CaffeineContext* caffeine, const ExecutorOptions& options = {},
           std::shared_ptr<std::atomic_bool> should_stop = nullptr);

  /**
   * Runs the contexts in its possesion until there are none left
   */
  void run();

  /**
   * Interrupts the Executor. Forces `run` to return as soon as possible
   */
  void interrupt();

private:
  void run_worker();
};

} // namespace caffeine

#endif
