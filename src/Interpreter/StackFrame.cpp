#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

namespace caffeine {

std::atomic<uint64_t> StackFrame::next_frame_id{0};

StackFrame::StackFrame(llvm::Function* function)
    : current_block(&function->getEntryBlock()), prev_block(nullptr),
      current(current_block->begin()), frame_id(next_frame_id++) {}

void StackFrame::jump_to(llvm::BasicBlock* block) {
  CAFFEINE_ASSERT(block, "Cannot jump to null block");

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

void StackFrame::set_result(std::optional<LLVMValue> result,
                            std::optional<LLVMValue> resume_value) {
  CAFFEINE_ASSERT(!result.has_value() || !resume_value.has_value());

  auto& caller = *std::prev(current);

  if (result.has_value())
    insert(&caller, *result);

  auto invoke = llvm::dyn_cast<llvm::InvokeInst>(&caller);
  if (invoke) {
    if (!resume_value.has_value()) {
      jump_to(invoke->getNormalDest());
    } else {
      CAFFEINE_UNIMPLEMENTED("Resume instruction is not implemented");
    }
  }
}

StackFrame::StackFrame() : frame_id(next_frame_id++) {}

void ExternalStackFrame::set_result(std::optional<LLVMValue> result,
                                    std::optional<LLVMValue> resume_value) {
  // It would be pretty weird if both of these were set at the same
  // time
  CAFFEINE_ASSERT(!result.has_value() || !resume_value.has_value());

  if (result.has_value())
    result_ = result;

  if (resume_value.has_value())
    resume_value_ = resume_value;
};

} // namespace caffeine
