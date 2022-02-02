#pragma once

#include "caffeine/IR/OperationBuilder.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Casting.h"
#include <functional>

namespace llvm {
class Type;
}

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
class InterpreterContext : public OperationBuilder {
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
   * Look up a value only within the current stack frame.
   *
   * If `value` does not refer to a value created within the current stack frame
   * then this will return nullopt. This will happen even if value refers to a
   * valid constant expression or an existing global.
   */
  std::optional<LLVMValue> lookup(llvm::Value* value) const;

  /**
   * Store a value into the current stack frame.
   *
   * In order for this method to be correct the value should be a local value
   * within the current function.
   */
  void store(llvm::Value* ident, const LLVMValue& value);
  void store(llvm::Value* ident, LLVMValue&& value);

  // Utilities for working with memory

  /**
   * Create an allocation and return a pointer pointing to the start of the
   * newly created allocation.
   */
  Pointer allocate(const OpRef& size, const OpRef& align, const OpRef& data,
                   unsigned address_space, AllocationKind kind,
                   AllocationPermissions perms);

  /**
   * Create an allocation that consists of repeating instances of the passed-in
   * byte and return a pointer pointing to the start of the newly created
   * allocation.
   */
  Pointer allocate_repeated(const OpRef& size, const OpRef& align,
                            const OpRef& byte, unsigned address_space,
                            AllocationKind kind, AllocationPermissions perms);

  // Utilities for performing common control flow operations

  /**
   * Write a value to the memory pointed to by ptr.
   *
   * The pointer be resolved and it must be valid to write to ptr for at least
   * the number of bytes it takes to write out value. That is, this pointer
   * should be one returned by a call to resolve with the correct parameters.
   */
  void mem_write(const Pointer& ptr, llvm::Type* type, const LLVMValue& value);

  /**
   * Read a LLVM value of the provided type from the memory pointed to by ptr.
   *
   * The pointer must be resolved and it must be valid to read from ptr for at
   * least the number of bytes it takes to represent the provided type. That is,
   * the pointer should be one returned from a call to resolve.
   */
  LLVMValue mem_read(const Pointer& ptr, llvm::Type* type);

  /**
   * Set the instruction pointer of the current stack frame to the first
   * instruction within the provided basic block.
   *
   * The basic block must belong to the same function as that for the
   * current stack frame and current stack frame must not be an external
   * stack frame.
   */
  void jump_to(llvm::BasicBlock* block);

  /**
   * Jump as if the current function is returning normally. For regular call
   * instructions this is a no-op, however for invoke instructions this will
   * make the appropriate jump to reach the block for the normal execution
   * flow.
   */
  void jump_return(std::optional<LLVMValue> retval = std::nullopt);

  /**
   * Jump as if the current function call returned by throwing an exception.
   * This will jump to the unwind label for invoke instructions. It will
   * cause the current context to fail if the function call instruction was not
   * an invoke instruction.
   */
  void jump_resume(const LLVMValue& resume);

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
   * Assert that the pointer points to the start of an allocation.
   *
   * If this assertion fails then it will kill the current context and emit a
   * test failure with the provided message as an explanatory string.
   */
  void assert_ptr_starts_allocation(const Pointer& ptr,
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
   *
   * The overload that takes a llvm::Type will resolve according to the provided
   * type's store size.
   */
  llvm::SmallVector<Pointer, 1> resolve_ptr(const Pointer& ptr, uint32_t width,
                                            std::string_view message);
  llvm::SmallVector<Pointer, 1>
  resolve_ptr(const Pointer& ptr, const OpRef& width, std::string_view message);
  llvm::SmallVector<Pointer, 1>
  resolve_ptr(const Pointer& ptr, llvm::Type* type, std::string_view message);

  /**
   * @brief Get the allocation that this pointer points to.
   *
   * @return const Allocation* The allocation, or null if this pointer does
   * not point to any allocation.
   */
  Allocation* ptr_allocation(const Pointer& ptr);

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
   * Fork the context for each value within the container. Then invoke the
   * provided function with the forked context, the downcasted top stack frame,
   * and the container element, in that order. It will also kill the current
   * context.
   *
   * This is only meant to be used for the implementation of external functions
   * that involve external stack frames.
   */
  template <typename Frame, typename C, typename Func>
  void fork_external(C& container, Func&& func);

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

  /**
   * Used for calling IR functions in the module
   */
  void call_function(llvm::Function* func, Span<LLVMValue> args);

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

template <typename Frame, typename C, typename Func>
void InterpreterContext::fork_external(C& container, Func&& func) {
  const Frame* derived = dynamic_cast_if_supported<const Frame*>(
      context().stack_top().get_external().get());
  CAFFEINE_ASSERT(derived, "fork_external called with a type that didn't match "
                           "the type of the frame currently on the stack");

  kill();

  for (auto& elem : container) {
    auto fork = this->fork();
    Frame* frame = dynamic_cast_if_supported<Frame*>(
        fork.context().stack_top().get_external().get());

    func(fork, frame, elem);
  }
}

} // namespace caffeine
