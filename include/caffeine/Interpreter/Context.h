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
  uint64_t constant_num_ = 0;

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

  llvm::iterator_range<std::vector<Assertion>::const_iterator>
  assertions() const;

  /**
   * Get a unique constant number among all of the ones in this context.
   *
   * This is useful for creating the unnamed symbolic constants that are needed
   * to implement stuff such as memory addresses and the like which can change
   * from run to run.
   */
  uint64_t next_constant();

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
