#ifndef CAFFEINE_INTERP_STACKFRAME_H
#define CAFFEINE_INTERP_STACKFRAME_H

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/BasicBlock.h>

#include <unordered_map>
#include <vector>

#include "caffeine/ADT/ClonePointer.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Memory/MemHeap.h"
#include "caffeine/Model/Value.h"

namespace caffeine {

class Context;
class ExecutionResult;
class InterpreterContext;

class StackAllocation {
public:
  AllocId alloc;
  unsigned heap;

  StackAllocation(const AllocId& allocid, unsigned heap)
      : alloc(allocid), heap(heap) {}
};

class ExternalStackFrame {
protected:
  enum CoroutineExecutionResult {
    Continue, Stop, Call
  };
public:
  uint64_t frame_id;
  std::optional<LLVMValue> result_ = std::nullopt;
  std::optional<LLVMValue> resume_value_ = std::nullopt;

  virtual std::unique_ptr<ExternalStackFrame> clone() const = 0;
  virtual ~ExternalStackFrame() = default;
  ExternalStackFrame(uint64_t frame_id,
                     std::optional<LLVMValue> result_ = std::nullopt,
                     std::optional<LLVMValue> resume_value_ = std::nullopt);

  // Wrapper around corouting logic implementation
  ExecutionResult run(InterpreterContext & context);

protected:
  void set_result(std::optional<LLVMValue> result,
                  std::optional<LLVMValue> resume_value);

  // Coroutine logic implementation
  virtual CoroutineExecutionResult step(InterpreterContext & context) = 0;
  friend class StackFrame;

  uint64_t program_counter = 0;
};

class IRStackFrame {
public:
  uint64_t frame_id;

  // Allocations within the current frame.
  std::vector<StackAllocation> allocations;

  std::unordered_map<llvm::Value*, LLVMValue> variables;
  /**
   * Iterators used by Interpreter::execute
   */
  llvm::BasicBlock* current_block = nullptr;
  llvm::BasicBlock* prev_block = nullptr;
  llvm::BasicBlock::iterator current;

  /**
   * Change the instruction pointer to point at the start of the provided
   * block and update the previous block accordingly.
   *
   * Use this when implementing a jump instruction.
   */
  void jump_to(llvm::BasicBlock* block);

private:
  IRStackFrame(llvm::Function* function, uint64_t frame_id);

public:
  /**
   * Insert a new value into the current stack frame. If that value
   * is already in the current stack frame then it overwrites it.
   */
  void insert(llvm::Value* value, const OpRef& expr);
  void insert(llvm::Value* value, const LLVMValue& exprs);

private:
  void set_result(std::optional<LLVMValue> result,
                  std::optional<LLVMValue> resume_value);
  friend class StackFrame;
};

class StackFrame {
private:
  enum {
    Uninitialized = 0,
    Regular = 1,
    External = 2,
  };

  std::variant<std::monostate, IRStackFrame, clone_ptr<ExternalStackFrame>>
      value_;

public:
  uint64_t frame_id;

  StackFrame();

  static StackFrame RegularFrame(llvm::Function* function);

  /**
   * Set the result of the current instruction in the stack frame.
   * Used by functions in order to set their return value and whether
   * the function resumed or not.
   *
   * If `resume_value` is std::nullopt, then the stack frame current pointer
   * jumps to the normal execution path if the previous instruction was an
   * Invoke.
   *
   * If `resume_value` has a value, then the stack frame current pointer jumps
   * to the exceptional execution path that is determined by the resume value
   * provided (currently unimplemented).
   *
   * This function can be called multiple times, and as a result, if `result` is
   * std::nullopt, it will not override the previously set result.
   *
   * As a result we have the following semantics:
   *  result | resume | meaning
   *  -------+--------+----------------------------
   *     set |    set | nonsense
   *     set |  unset | non void return
   *   unset |    set | perform exceptional outcome (*)
   *   unset |  unset | void return
   *
   * (*) a natural question of what happens when we want to resume with a void
   * value arises. In this case we can probably just stuff a dummy LLVMValue
   * into the resume_value
   */
  void set_result(std::optional<LLVMValue> result,
                  std::optional<LLVMValue> resume_value);

  const IRStackFrame& get_regular() const;
  const clone_ptr<ExternalStackFrame>& get_external() const;

  IRStackFrame& get_regular();
  clone_ptr<ExternalStackFrame>& get_external();

  bool is_regular() const;
  bool is_external() const;

protected:
  static std::atomic<uint64_t> next_frame_id;
};

} // namespace caffeine

#endif
