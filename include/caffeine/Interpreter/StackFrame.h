#ifndef CAFFEINE_INTERP_STACKFRAME_H
#define CAFFEINE_INTERP_STACKFRAME_H

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/BasicBlock.h>

#include <unordered_map>

#include "caffeine/IR/Operation.h"

namespace caffeine {

class Context;

class StackFrame {
public:
  using VarType = llvm::SmallVector<ref<Operation>, 1>;

private:
  llvm::Function* function;
  std::unordered_map<llvm::Value*, VarType> variables;

public:
  /**
   * Iterators used by Interpreter::execute
   */
  llvm::BasicBlock* current_block;
  llvm::BasicBlock* prev_block;
  llvm::BasicBlock::iterator current;

  StackFrame(llvm::Function* function);

  /**
   * Change the instruction pointer to point at the start of the provided
   * block and update the previous block accordingly.
   *
   * Use this when implementing a jump instruction.
   */
  void jump_to(llvm::BasicBlock* block);

  /**
   * Insert a new value into the current stack frame. If that value
   * is already in the current stack frame then it overwrites it.
   */
  void insert(llvm::Value* value, const ref<Operation>& expr);

  void insert(llvm::Value* value, const VarType& exprs);

  /**
   * Lookup a value within the current stack frame.
   *
   * There are two main cases here:
   * 1. `value` is an existing variable
   * 2. `value` is a constant
   *
   * In the first case we just look up the variable the `variables` map
   * and then return it. In the second case we build an expression
   * that represents the constant and return that.
   *
   * This method should be preferred over directly interacting with
   * `variables` as it correctly handles constants.
   */
  VarType lookup(llvm::Value* value) const;
};

} // namespace caffeine

#endif
