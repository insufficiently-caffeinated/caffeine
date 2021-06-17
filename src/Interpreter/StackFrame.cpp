#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>

namespace caffeine {

std::atomic<uint64_t> StackFrame::next_frame_id{0};

StackFrame::StackFrame(llvm::Function* function)
    : current_block(&function->getEntryBlock()), prev_block(nullptr),
      current(current_block->begin()), frame_id(next_frame_id++) {}

void StackFrame::jump_to(llvm::BasicBlock* block) {
  prev_block = current_block;
  current_block = block;
  current = block->begin();
}

void StackFrame::insert(llvm::Value* value, const OpRef& expr) {
  insert(value, LLVMValue{expr});
}
void StackFrame::insert(llvm::Value* value, const LLVMValue& exprs) {
  variables.insert_or_assign(value, exprs);
}

} // namespace caffeine
