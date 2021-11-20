#ifndef CAFFEINE_INTERP_EXECUTOR_H
#define CAFFEINE_INTERP_EXECUTOR_H

#include <cstdint>

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

public:
  Executor(CaffeineContext* caffeine, const ExecutorOptions& options = {});

  /**
   * Runs the contexts in its possesion until there are none left
   */
  void run();

private:
  void run_worker();
};

} // namespace caffeine

#endif
