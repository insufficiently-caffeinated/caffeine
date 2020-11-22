#ifndef CAFFEINE_INTERP_EXECUTOR_H
#define CAFFEINE_INTERP_EXECUTOR_H

#include "caffeine/Interpreter/Context.h"

namespace caffeine {

class Executor {
private:
  std::vector<Context> contexts;

public:
  /**
   * The current context has forked and the fork needs to be added
   * to the queue.
   */
  void add_context(Context&& ctx);

  /**
   * Get the next context to be executed.
   */
  Context next_context();

  /**
   * Are there any contexts left?
   */
  bool has_next() const;
};

} // namespace caffeine

#endif
