#ifndef CAFFEINE_INTERP_INTERPRETER_H
#define CAFFEINE_INTERP_INTERPRETER_H

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Executor.h"

namespace caffeine {

enum class ExecutionResult { Continue, Stop };

class Interpreter {
private:
  Context* ctx;
  Executor* queue;

public:
  /**
   * The interpreter constructor needs an executor and context
   *
   * TODO: Add failure tracker
   */
  Interpreter(Context* ctx, Executor* queue);

  void execute();

  ExecutionResult visitInstruction(ref<Operation>&);
};

} // namespace caffeine

#endif
