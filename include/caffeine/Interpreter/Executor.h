#ifndef CAFFEINE_INTERP_EXECUTOR_H
#define CAFFEINE_INTERP_EXECUTOR_H

#include <cstdint>

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/FailureLogger.h"

namespace caffeine {

class ExecutionPolicy;
class ExecutionContextStore;

struct ExecutorOptions {
  uint32_t num_threads = 2;

  constexpr ExecutorOptions() = default;
};

class Executor {
private:
  ExecutionPolicy* policy;
  ExecutionContextStore* store;
  FailureLogger* logger;
  ExecutorOptions options;

public:
  Executor(ExecutionPolicy* policy, ExecutionContextStore* store,
           FailureLogger* logger, const ExecutorOptions& options = {});

  /**
   * Runs the contexts in its possesion until there are none left
   */
  void run();
};

} // namespace caffeine

#endif
