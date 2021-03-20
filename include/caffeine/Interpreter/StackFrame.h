#ifndef CAFFEINE_INTERP_STACKFRAME_H
#define CAFFEINE_INTERP_STACKFRAME_H

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/BasicBlock.h>

#include <unordered_map>
#include <vector>

#include "caffeine/IR/Operation.h"
#include "caffeine/Interpreter/Value.h"
#include "caffeine/Memory/MemHeap.h"

namespace caffeine {

class Context;

class StackFrame {
public:
  std::unordered_map<llvm::Value*, LLVMValue> variables;

  /**
   * Iterators used by Interpreter::execute
   */
  llvm::BasicBlock* current_block;
  llvm::BasicBlock* prev_block;
  llvm::BasicBlock::iterator current;

  // Allocations within the current frame.
  std::vector<AllocId> allocations;

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
  void insert(llvm::Value* value, const OpRef& expr);
  void insert(llvm::Value* value, const LLVMValue& exprs);
};

} // namespace caffeine

#endif
