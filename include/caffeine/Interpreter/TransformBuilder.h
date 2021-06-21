#pragma once

#include "caffeine/Interpreter/Context.h"
#include <array>
#include <cstdlib>
#include <llvm/ADT/FunctionExtras.h>
#include <llvm/ADT/SmallVector.h>
#include <variant>

namespace llvm {
class Value;
class Type;
} // namespace llvm

namespace caffeine {
class ExecutionResult;
class Interpreter;

/**
 * Perform a sequence of operations while internally handling all forking.
 *
 * When writing a builtin it is often necessary to do operations that might
 * cause the context to fork. Dealing with these results in a lot of boilerplate
 * code that is tedious to write and easy to screw up. This class encapsulates
 * that into a linear set of instructions with the forking handled behind the
 * scenes. This avoids having to get all the nested loops correct when handling
 * individual types.
 *
 * Implementation
 * ==============
 * At it's core, this class builds a list of operations that somehow transform
 * and possibly fork the initial context. Each of these transforms is just a
 * function object that takes a context+state and then returns any number of
 * context+state instances to the run queue.
 */
class TransformBuilder {
public:
  struct Value {
    size_t index;

    Value(size_t index) : index(index) {}
  };

  using Argument = std::variant<Value, llvm::Value*>;

  struct ContextState {
  private:
    size_t inst = 0;
    immer::map<size_t, LLVMValue> values;

  public:
    Context ctx;
    Interpreter* interpreter;

  public:
    LLVMValue lookup(const Argument& arg);
    void insert(Value key, LLVMValue val);

    ContextState fork(const Context& newctx) const;
    ContextState fork(Context&& newctx) const;

    // Return a value that points to the output of the current operation.
    Value current() const;

  private:
    ContextState(Context&& ctx, Interpreter* interp);

    friend class TransformBuilder;
  };

  // Function for inserting a context state back into the execution queue.
  using InsertFn = llvm::unique_function<void(ContextState&&)>;
  using TransformFn =
      llvm::unique_function<void(ContextState&&, InsertFn&) const>;

private:
  struct Operation {
    TransformFn func;

    Operation(TransformFn&& func) : func(std::move(func)) {}
  };

private:
  llvm::SmallVector<Operation, 16> operations;

public:
  TransformBuilder() = default;

  // Resolve a pointer for a read/write of the provided type.
  //
  // This will fork the context for each allocation that the input pointer gets
  // resolved to. By default, if the pointer could point outside of an
  // allocation then it logs a failure and kills the current context. Usually,
  // this is what you want. However, you can pass die_on_failure = false to
  // disable this behaviour.
  Value resolve(Argument pointer, llvm::Type* type, bool die_on_failure = true);

  // Run the provided function against each context-state fork. The function is
  // responsible for inserting all contexts that should continue executing by
  // passing them to the provided InsertFn instance.
  //
  // All operations eventually boil down to this function.
  Value transform_fork(TransformFn&& func);

  // Run the provided function against each provided context-state fork.
  //
  // This is meant for transformations that will never create new forks or kill
  // a context. If you need the ability to do those then use transform_fork.
  template <typename F>
  Value transform(F&& func) {
    return transform_fork(
        [mfunc = std::move(func)](ContextState&& state, InsertFn& insert_fn) {
          mfunc(state);
          insert_fn(std::move(state));
        });
  }

  // Assign the provided temporary argument value in the top stack frame of the
  // context.
  void assign(llvm::Value* value, Argument arg);
  void assign(llvm::Value* value, LLVMValue arg);
  void assign(llvm::Value* value, LLVMScalar arg);

  // Read a value from the provided pointer. The pointer must have been resolved
  // (usually by a call to resolve).
  Value read(Argument arg, llvm::Type* type);

  ExecutionResult execute(Interpreter* interp) const;
};

} // namespace caffeine
