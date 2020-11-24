#include "caffeine/Interpreter/StackFrame.h"

#include <llvm/IR/Function.h>

namespace caffeine {

StackFrame::StackFrame(llvm::Function* function) : function(function), current_block(&function->getEntryBlock()), prev_block(nullptr),
      current(current_block->begin()) {}

void StackFrame::jump_to(llvm::BasicBlock *block) {
  prev_block = current_block;
  current_block = block;
  current = block->begin();
}

void StackFrame::insert(llvm::Value *value, const ref<Operation> &expr) {
  variables.insert_or_assign(value, expr);
}

ref<Operation> StackFrame::lookup(llvm::Value *value) const {
  auto it = variables.find(value);
  CAFFEINE_ASSERT(it != variables.end(), "Tried to access unknown variable");
  return it->second;
}

}