#pragma once

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

class FailureLogger;
class CaffeineContext;

/**
 * Wrapper around the current execution context.
 *
 * This class is meant to be a central place for interpreter-related code to
 * interact with the current context. It provides helpers for doing common tasks
 * and if you find yourself repeating the same set of actions across a bunch of
 * different places then this class would probably be a good place to put it.
 */
class InterpreterContext {
public:
  // Various accessors

  /**
   * Get the context instance that this InterpreterContext is wrapping.
   */
  Context& context();
  const Context& context() const;

  /**
   * Get the CaffeineContext instance associated with this InterpreterContext.
   */
  const CaffeineContext& caffeine() const;

  // Accessors for LLVM data. These use the LLVM syntax for consistency with
  // existing code.

  /**
   * Get the LLVM module for the currently executing stack frame.
   *
   * This should be preferred over getting the module of the current instruction
   * as that can cause segfaults under certain conditions.
   */
  llvm::Module* getModule() const;

  /**
   * Get the LLVM function for the currently executing stack frame.
   *
   * Every stack frame must have an associated LLVM function. However, in the
   * case of external stack frames this function may not have any body.
   */
  llvm::Function* getCurrentFunction() const;

  /**
   * Get the instruction that is being executed in the current stack frame.
   *
   * This function may return nullptr in the case where the current stack frame
   * is an external stack frame.
   */
  llvm::Instruction* getCurrentInstruction() const;

  // Load/Store functions for Locals

  /**
   * Load a value from within the current stack frame.
   *
   * There are two main cases here:
   * - `value` is an existing variable, or
   * - `value` is a constant.
   *
   * In the first case we look up the variable within the context at the top of
   * the stack. In the second case we build an expression that represents the
   * constant and return that. This may involve instantiating referenced
   * constants and globals within the current execution context recursively.
   *
   * This should be preferred over directly looking up variables within the
   * stack frame as it properly handles global constants.
   *
   * If the value does not refer to a valid LLVM object then this method will
   * emit a recoverable assertion, killing the current context but allowing
   * others to proceed.
   */
  LLVMValue load(llvm::Value* value);

  /**
   * Store a value into the current stack frame.
   *
   * In order for this method to be correct the value should be a local value
   * within the current function.
   */
  void store(llvm::Value* ident, const LLVMValue& value);
  void store(llvm::Value* ident, LLVMValue&& value);

  /**
   * Set the instruction pointer of the current stack frame to the first
   * instruction within the provided basic block.
   *
   * The basic block must belong to the same function as that for the current
   * stack frame and current stack frame must not be an external stack frame.
   */
  void jump_to(llvm::BasicBlock* block);

  /**
   * Return from the current stack frame with an optional return value. If this
   * causes the stack to be empty then the context will also be killed.
   *
   * This will cause an assertion failure if the current function's return type
   * is inconsistent with the presence (or lack thereof) of a return value.
   */
  void function_return(std::optional<LLVMValue> retval = std::nullopt);

  // Assertion/Solver-related methods

  /**
   * Get the current solver used for this context. This is generally used for
   * all contexts being executed on the current thread.
   */
  const std::shared_ptr<Solver>& solver() const;

  /**
   * Add a new assertion to this context.
   *
   * This will immediately perform simplifications as if the assertion is
   * assumed to be true.
   */
  void add_assertion(const Assertion& assertion);
  void add_assertion(Assertion&& assertion);

  /**
   * Check whether the set of assertions combined with the provided extra
   * assertion is satisfiable.
   *
   * This method avoids building a model if the set of assertions are
   * satisfiable so it should be preferred over calling resolve if the actual
   * concrete model values are not needed.
   *
   * See the docs on Solver::check for more details.
   */
  SolverResult check(const Assertion& extra = Assertion::constant(true));

  /**
   * Check whether the current set of assertions combined with the provided
   * extra assertion is satisfiable, and, if so, generate a model with concrete
   * values that satisfy them.
   *
   * See the docs on Solver::resolve for more details.
   */
  SolverResult resolve(const Assertion& extra = Assertion::constant(true));

  /**
   * Utility method that adds an assertion and if the assertion could fail then
   * it also generates a test case.
   *
   * If !assertion is satisfiable then message will be included within the
   * generated test case as an explanatory string.
   */
  void assert_or_fail(const Assertion& assertion, std::string_view message);

  // Methods for working with pointers

  /**
   * Assert that it is valid to access the memory at [ptr, ptr+width).
   *
   * If this assertion fails then it will kill the current context and emit a
   * test failure with the provided message as an explanatory string.
   */
  void assert_ptr_valid(const Pointer& ptr, uint32_t width,
                        std::string_view message);
  void assert_ptr_valid(const Pointer& ptr, const OpRef& width,
                        std::string_view message);

  /**
   * Check whether a pointer is valid and, if so, resolve which concrete
   * allocations it could point to.
   *
   * In more detail:
   *
   * - Check to see whether it is possible to point outside of any existing
   *   allocation. If so, fail the current context and don't do any pointer
   *   resolution.
   *
   *   This is done since if the pointer could be pointing outside of an
   *   allocation then it's likely that it could possibly be pointing to any
   *   other allocation and failures found from those branches would not be
   *   useful.
   *
   * - Determine which allocations the pointer could point within and return all
   *   of them. If the pointer is already known to point to a specific
   *   allocation then this is efficient.
   */
  llvm::SmallVector<Pointer, 1> resolve_ptr(const Pointer& ptr, uint32_t width,
                                            std::string_view message);
  llvm::SmallVector<Pointer, 1>
  resolve_ptr(const Pointer& ptr, const OpRef& width, std::string_view message);

  // Methods managing forks and context queuing

  /**
   * Fork the current context and return an identical copy of the current
   * context.
   *
   * This will also set up the new context to be queued up transparently.
   *
   * Note that if the current context is dead then the forked context will
   * _not_ be dead.
   */
  InterpreterContext fork() const;

  /**
   * Create a new fork with an existing context.
   *
   * This method is present for compatibility reasons and it should not be used
   * by new code.
   */
  InterpreterContext fork_existing(Context&& ctx) const;

  /**
   * Indicates whether the current context is dead. This happens when either
   * fail() or kill() has been called.
   */
  bool is_dead() const;

  /**
   * Mark the current context as dead. This will prevent it from being added
   * back to the main run queue.
   *
   * Note that this method is idempotent, caling it multiple times will not
   * cause any issues.
   *
   * This method is silent, it will not result in any user-visible test cases.
   */
  void kill();

  /**
   * If the current state is satisfiable, generate a failing test case using the
   * provided message as an explanatory string. Then, mark the current context
   * as dead.
   *
   * If this context is already dead then this method will do nothing.
   */
  void fail(std::string_view message);

  /**
   * Emit a failure for the current context.
   *
   * This is a low-level method used to implement other interface methods.
   * Generally you will want to use one of kill(), fail(), or assert_or_fail()
   * instead.
   */
  void emit_failure(std::string_view message, const Model* model,
                    const Assertion& assertion);

  /**
   * Add a ExternalStackFrame to the Context in order to execute it.
   *
   * The ExternalStackFrame's `step` function will be called until the
   * StackFrame pops itself off.
   */
  void call_external_function(std::unique_ptr<ExternalStackFrame>&& frame);

private:
  // Set the current context as dead and emit the appropriate notifications.
  void set_dead(ExecutionPolicy::ExitStatus status,
                const Assertion& assertion = Assertion::constant(true));

public:
  // Interfaces used by the scheduler to interact with InterpreterContext
  // instances.

  class ContextQueueEntry {
  public:
    bool dead = false;
    Context context;

    ContextQueueEntry(Context&& ctx);
  };

  using BackingList = std::vector<std::unique_ptr<ContextQueueEntry>>;

  InterpreterContext(BackingList* queue, size_t entry_index,
                     const std::shared_ptr<Solver>& solver,
                     CaffeineContext* shared);

private:
  std::vector<std::unique_ptr<ContextQueueEntry>>* queue_;
  ContextQueueEntry* entry_;
  CaffeineContext* shared_;
  std::shared_ptr<Solver> solver_;
};

} // namespace caffeine
