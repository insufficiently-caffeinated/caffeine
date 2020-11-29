#ifndef CAFFEINE_INTERP_CONTEXT_H
#define CAFFEINE_INTERP_CONTEXT_H

#include <memory>

#include <llvm/IR/Function.h>

#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

class Context {
private:
  std::vector<StackFrame> stack;

public:
  Context(llvm::Function* func);

  /**
   * Create a new context that is independent from this
   * one but has the same state.
   */
  Context fork() const;

  /**
   * Get the top frame of the stack.
   *
   * This should be used instead of directly manipulating the stack
   * vector so that it continues to work when more advanced data
   * structures are implemented.
   */
  StackFrame& stack_top();
};

} // namespace caffeine

#endif
