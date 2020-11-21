#ifndef CAFFEINE_INTERP_CONTEXT_H
#define CAFFEINE_INTERP_CONTEXT_H

#include <llvm/IR/Function.h>

#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

class Context {
private:
  /**
   * This vector of assertions keeps the current set of invariants that we
   * are keeping
   */
  std::vector<Assertion> assertions;

public:
  /**
   * The context is constructed with the solver and the function that will be
   * evaluated
   */
  Context(const Solver& solver, llvm::Function* func);

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

  /**
   * Check whether the current set of assertions + the given expression
   * is satisfiable.
   *
   * Does not modify the solver state. If this returns sat then you can
   * get the solver model as a test case.
   */
  SolverResult check(const Assertion& expr);

  /**
   * Add a new assertion to the solver.
   */
  void add(const Assertion& assertion);
};

} // namespace caffeine

#endif
