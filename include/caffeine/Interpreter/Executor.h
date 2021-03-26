#ifndef CAFFEINE_INTERP_EXECUTOR_H
#define CAFFEINE_INTERP_EXECUTOR_H

#include <cstdint>

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/FailureLogger.h"

namespace caffeine {

class Executor {
private:
  FailureLogger* logger;
  std::vector<Context> contexts;
  uint32_t num_threads;

  /**
   * Are there any contexts left?
   */
  bool has_next() const;

  /**
   * Get the next context to be executed.
   */
  Context next_context();

public:
  Executor(FailureLogger* logger, uint32_t num_threads = 2);

  /**
   * The current context has forked and the fork needs to be added
   * to the queue.
   */
  void add_context(Context&& ctx);

  /**
   * Runs the contexts in its possesion until there are none left
   */
  void run();
};

} // namespace caffeine

#endif
