#ifndef CAFFEINE_INTERP_CONTEXT_H
#define CAFFEINE_INTERP_CONTEXT_H

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Memory/MemHeap.h"
#include "caffeine/Solver/Solver.h"

#include <llvm/IR/Constant.h>
#include <llvm/IR/Function.h>

#include <memory>
#include <optional>
#include <unordered_map>

namespace llvm {
class GlobalVariable;
} // namespace llvm

namespace caffeine {

class Context {
private:
  std::vector<StackFrame> stack_;
  // The current set of invariants for this context
  std::vector<Assertion> assertions_;
  std::unordered_map<llvm::GlobalVariable*, ContextValue> globals_;
  std::shared_ptr<Solver> solver_;
  uint64_t constant_num_ = 0;
  MemHeap heap_;
  llvm::Module* module_;

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
  const StackFrame& stack_top() const;
  StackFrame& stack_top();

  const std::vector<StackFrame>& stack() const;

  // Utility methods for adding/removing stack frames
  /**
   * Note: This method also deallocates all stack-allocated allocations within
   *       the current frame.
   */
  void pop();
  void push(StackFrame&& frame);
  void push(const StackFrame& frame);

  // Does this context have any stack frames?
  bool empty() const;

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
   * Access the context heap.
   */
  MemHeap& heap() {
    return heap_;
  }
  const MemHeap& heap() const {
    return heap_;
  }

  llvm::Module* llvm_module() const {
    return module_;
  }

  /**
   * Add a new assertion to this context.
   */
  void add(const Assertion& assertion);
  void add(Assertion&& assertion);

  /**
   * Lookup a value within the top stack frame.
   *
   * There are two main cases here:
   * 1. `value` is an existing variable, or
   * 2. `value` is a constant.
   *
   * In the first place we look up the variable within the context at the top of
   * the stack. In the second case we build an expression that represents the
   * constant and return that.
   *
   * This method should be preferred over directly looking up variables in the
   * stack frame as it properly handles global constants.
   *
   * The constant variant of the method will not create allocations and
   * modify the registered globals table. The non const variant may do so.
   */
  std::optional<ContextValue> lookup_const(llvm::Value* value) const;
  ContextValue lookup(llvm::Value* value);

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

private:
  /**
   * Evaluate a constant to the corresponding ContextValue.
   *
   * The constant variant of the method will not create allocations and
   * modify the registered globals table. The non const variant may do so.
   */
  std::optional<ContextValue>
  evaluate_constant_const(llvm::Constant* constant) const;
  ContextValue evaluate_constant(llvm::Constant* constant);

  template <typename ContextType>
  friend ContextValue evaluate_global(ContextType ctx,
                                      llvm::GlobalVariable* global);
};

} // namespace caffeine

#endif
