#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>

namespace caffeine {

StackFrame::StackFrame(llvm::Function* function)
    : function(function), current_block(&function->getEntryBlock()),
      prev_block(nullptr), current(current_block->begin()) {}

void StackFrame::jump_to(llvm::BasicBlock* block) {
  prev_block = current_block;
  current_block = block;
  current = block->begin();
}

void StackFrame::insert(llvm::Value* value, const ref<Operation>& expr) {
  insert(value, ContextValue{expr});
}
void StackFrame::insert(llvm::Value* value, const ContextValue& exprs) {
  variables.insert_or_assign(value, exprs);
}

ContextValue StackFrame::lookup(llvm::Value* value) const {
  auto it = variables.find(value);
  CAFFEINE_ASSERT(it != variables.end(), "Tried to access unknown variable");
  return it->second;
}

} // namespace caffeine
