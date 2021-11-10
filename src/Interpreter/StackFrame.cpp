#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

namespace caffeine {

std::atomic<uint64_t> StackFrame::next_frame_id{0};

IRStackFrame::IRStackFrame(llvm::Function* function, uint64_t frame_id)
    : frame_id{frame_id}, current_block(&function->getEntryBlock()),
      prev_block(nullptr), current(current_block->begin()) {}

void IRStackFrame::jump_to(llvm::BasicBlock* block) {
  CAFFEINE_ASSERT(block, "Cannot jump to null block");

  prev_block = current_block;
  current_block = block;
  current = block->begin();
}

void IRStackFrame::insert(llvm::Value* value, const OpRef& expr) {
  insert(value, LLVMValue{expr});
}
void IRStackFrame::insert(llvm::Value* value, const LLVMValue& exprs) {
  variables.insert_or_assign(value, exprs);
}

void IRStackFrame::set_result(std::optional<LLVMValue> result,
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

ExternalStackFrame::ExternalStackFrame(std::vector<LLVMValue>&& args,
                                       llvm::Function* func)
    : frame_id{StackFrame::get_next_frame_id()}, args{args}, func{func} {}

uint64_t StackFrame::get_next_frame_id() {
  return next_frame_id++;
}

StackFrame::StackFrame() : frame_id(get_next_frame_id()) {}

StackFrame::StackFrame(std::unique_ptr<ExternalStackFrame>&& frame)
    : value_(clone_ptr(std::move(frame))), frame_id(get_external()->frame_id) {}

StackFrame StackFrame::RegularFrame(llvm::Function* function) {
  StackFrame frame;
  frame.value_ = IRStackFrame(function, frame.frame_id);
  return frame;
}

const IRStackFrame& StackFrame::get_regular() const {
  return std::get<Regular>(value_);
}

const clone_ptr<ExternalStackFrame>& StackFrame::get_external() const {
  return std::get<External>(value_);
}

IRStackFrame& StackFrame::get_regular() {
  return std::get<Regular>(value_);
}

clone_ptr<ExternalStackFrame>& StackFrame::get_external() {
  return std::get<External>(value_);
}

void StackFrame::set_result(std::optional<LLVMValue> result,
                            std::optional<LLVMValue> resume_value) {
  if (is_regular()) {
    get_regular().set_result(result, resume_value);
  } else if (is_external()) {
    get_external()->set_result(result, resume_value);
  } else {
    CAFFEINE_UNREACHABLE("Malformed StackFrame detected");
  }
};

bool StackFrame::is_regular() const {
  return value_.index() == Regular;
}

bool StackFrame::is_external() const {
  return value_.index() == External;
}

} // namespace caffeine
