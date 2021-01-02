#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>

namespace caffeine {

ref<Operation> evaluate_constant(const llvm::Constant* constant) {
  CAFFEINE_ASSERT(!constant->getType()->isVectorTy());

  if (auto* intconst = llvm::dyn_cast<llvm::ConstantInt>(constant)) {
    const llvm::APInt& value = intconst->getValue();

    return ConstantInt::Create(value);
  }

  if (auto* fpconst = llvm::dyn_cast<llvm::ConstantFP>(constant)) {
    const llvm::APFloat& value = fpconst->getValueAPF();

    return ConstantFloat::Create(value);
  }

  CAFFEINE_UNIMPLEMENTED();
}

StackFrame::StackFrame(llvm::Function* function)
    : function(function), current_block(&function->getEntryBlock()),
      prev_block(nullptr), current(current_block->begin()) {}

void StackFrame::jump_to(llvm::BasicBlock* block) {
  prev_block = current_block;
  current_block = block;
  current = block->begin();
}

void StackFrame::insert(llvm::Value* value, const ref<Operation>& expr) {
  variables.insert_or_assign(value, VarType{expr});
}
void StackFrame::insert(llvm::Value* value, const VarType& exprs) {
  variables.insert_or_assign(value, exprs);
}

StackFrame::VarType StackFrame::lookup(llvm::Value* value) const {
  if (auto* constant = llvm::dyn_cast_or_null<llvm::Constant>(value))
    return VarType{evaluate_constant(constant)};

  auto it = variables.find(value);
  CAFFEINE_ASSERT(it != variables.end(), "Tried to access unknown variable");
  return it->second;
}

} // namespace caffeine
