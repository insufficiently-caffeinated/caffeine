#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

namespace caffeine {

std::atomic<uint64_t> StackFrame::next_frame_id{0};

StackFrame::StackFrame_::StackFrame_(llvm::Function* function,
                                     uint64_t frame_id)
    : frame_id{frame_id}, current_block(&function->getEntryBlock()),
      prev_block(nullptr), current(current_block->begin()) {}

StackFrame::ExternalStackFrame_::ExternalStackFrame_(uint64_t frame_id)
    : frame_id{frame_id} {}

void StackFrame::StackFrame_::jump_to(llvm::BasicBlock* block) {
  CAFFEINE_ASSERT(block, "Cannot jump to null block");

  prev_block = current_block;
  current_block = block;
  current = block->begin();
}

void StackFrame::StackFrame_::insert(llvm::Value* value, const OpRef& expr) {
  insert(value, LLVMValue{expr});
}
void StackFrame::StackFrame_::insert(llvm::Value* value,
                                     const LLVMValue& exprs) {
  variables.insert_or_assign(value, exprs);
}

void StackFrame::StackFrame_::set_result(
    std::optional<LLVMValue> result, std::optional<LLVMValue> resume_value) {
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

void StackFrame::ExternalStackFrame_::set_result(
    std::optional<LLVMValue> result, std::optional<LLVMValue> resume_value) {
  // It would be pretty weird if both of these were set at the same
  // time
  CAFFEINE_ASSERT(!result.has_value() || !resume_value.has_value());

  if (result.has_value())
    result_ = result;

  if (resume_value.has_value())
    resume_value_ = resume_value;
};

StackFrame::StackFrame() : frame_id(next_frame_id++) {}

StackFrame StackFrame::RegularFrame(llvm::Function* function) {
  StackFrame frame;
  frame.value_ = StackFrame::StackFrame_(function, frame.frame_id);
  return frame;
}

StackFrame StackFrame::ExternalFrame() {
  StackFrame frame;
  frame.value_ = StackFrame::ExternalStackFrame_(frame.frame_id);
  return frame;
}

const StackFrame::StackFrame_& StackFrame::get_regular() const {
  return std::get<Regular>(value_);
}

const StackFrame::ExternalStackFrame_& StackFrame::get_external() const {
  return std::get<External>(value_);
}

StackFrame::StackFrame_& StackFrame::get_regular() {
  return std::get<Regular>(value_);
}

StackFrame::ExternalStackFrame_& StackFrame::get_external() {
  return std::get<External>(value_);
}

} // namespace caffeine
