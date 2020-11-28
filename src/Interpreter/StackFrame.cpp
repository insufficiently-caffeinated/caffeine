#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Function.h>
#include <llvm/IR/Constants.h>

namespace caffeine {

ref<Operation> evaluate_constant(const llvm::Constant *constant) {
  if (auto *intconst = llvm::dyn_cast<llvm::ConstantInt>(constant)) {
    const llvm::APInt &value = intconst->getValue();

    return ConstantInt::Create(value);
  }

  // We only implement integers at the moment
  CAFFEINE_UNIMPLEMENTED();
}

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
  if (auto *constant = llvm::dyn_cast_or_null<llvm::Constant>(value))
    return evaluate_constant(constant);

  auto it = variables.find(value);
  CAFFEINE_ASSERT(it != variables.end(), "Tried to access unknown variable");
  return it->second;
}

}
