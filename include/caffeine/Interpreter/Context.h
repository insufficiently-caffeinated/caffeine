#ifndef CAFFEINE_INTERP_CONTEXT_H
#define CAFFEINE_INTERP_CONTEXT_H

#include <memory>

#include <llvm/IR/Function.h>

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

class Context {
private:
  std::vector<StackFrame> stack;
  // The current set of invariants for this context
  std::vector<Assertion> assertions_;
  std::shared_ptr<Solver> solver_;

public:
  Context(llvm::Function* func, std::shared_ptr<Solver> solver);

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

  std::shared_ptr<Solver> solver() const;

  /**
   * Add a new assertion to this context.
   */
  void add(const Assertion& assertion);
  void add(Assertion&& assertion);

  /**
   * Validate whether the set of assertions combined with the extra assertion is
   * satisfiable.
   *
   * See the docs on Solver::check for more details.
   */
  SolverResult check(const Assertion& extra = Assertion::constant(true));

  /**
   * Validate whether the set of assertions combined with the extra assertion is
   * satisfiable and, if so, return a model.
   *
   * See the docs on Solver::resolve for more details.
   */
  std::unique_ptr<Model>
  resolve(const Assertion& extra = Assertion::constant(true));
};

} // namespace caffeine

#endif
