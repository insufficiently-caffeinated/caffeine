#ifndef CAFFEINE_INTERP_CONTEXT_H
#define CAFFEINE_INTERP_CONTEXT_H

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/AssertionList.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Memory/MemHeap.h"
#include "caffeine/Solver/Solver.h"
#include <immer/map.hpp>
#include <iosfwd>
#include <llvm/ADT/SmallVector.h>
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
public:
  std::vector<StackFrame> stack;
  std::unordered_map<llvm::GlobalValue*, LLVMValue> globals;
  MemHeapMgr heaps;
  AssertionList assertions;
  immer::map<std::string, OpRef> constants;

  llvm::Module* mod;

private:
  uint64_t constant_num_ = 0;

public:
  Context(llvm::Function* func);
  // Create a context for a function and provide initial values for it's
  // arguments. This is necessary if you want to symbolically execute a function
  // with arguments as the inital function.
  //
  // Note that main is currently special-cased by the other constructor so it
  // can be run without having to provide arguments.
  Context(llvm::Function* func, llvm::ArrayRef<OpRef> args);

  /**
   * Create a new context that is independent from this
   * one but has the same state.
   */
  Context fork_once() const;

  /**
   * Create count identical contexts to this one.
   *
   * After calling this method the original context is no longer available.
   */
  llvm::SmallVector<Context, 2> fork(size_t count);

  /**
   * Get the top frame of the stack.
   *
   * This should be used instead of directly manipulating the stack
   * vector so that it continues to work when more advanced data
   * structures are implemented.
   */
  const StackFrame& stack_top() const;
  StackFrame& stack_top();

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
  std::optional<LLVMValue> lookup_const(llvm::Value* value) const;
  LLVMValue lookup(llvm::Value* value);

  /**
   * Validate whether the set of assertions combined with the extra assertion is
   * satisfiable.
   *
   * See the docs on Solver::check for more details.
   */
  SolverResult check(std::shared_ptr<Solver> solver,
                     const Assertion& extra = Assertion::constant(true));

  /**
   * Validate whether the set of assertions combined with the extra assertion is
   * satisfiable and, if so, return a model.
   *
   * See the docs on Solver::resolve for more details.
   */
  SolverResult resolve(std::shared_ptr<Solver> solver,
                       const Assertion& extra = Assertion::constant(true));

  /**
   * Replaces instances of the unresolved pointer within the top stack frame
   * with the resolved one.
   *
   * This is meant to reduce the amount of pointer resolutions have to do. At
   * the same time it balances between the amount of effort in propagating that
   * resolution.
   */
  void backprop(const Pointer& unresolved, const Pointer& resolved);

  /**
   * Print a backtrace of the symbolic frames contained within this context to
   * the provided raw_ostream. Will attempt to use debug info present in the
   * module to print the source files corresponding to the stack frames.
   */
  void print_backtrace(std::ostream& OS) const;

private:
  void init_args(llvm::ArrayRef<OpRef> args);

  // TODO: Temporary until context redesign is completed
  friend class ExprEvaluator;
};

} // namespace caffeine

#endif
