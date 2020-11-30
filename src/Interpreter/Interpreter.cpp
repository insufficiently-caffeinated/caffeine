#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Support/Assert.h"

#include <fmt/format.h>

namespace caffeine {

Interpreter::Interpreter(Executor* queue, Context* ctx)
    : ctx{ctx}, queue{queue} {}

void Interpreter::execute() {
  ExecutionResult exec;

  do {
    StackFrame& frame = ctx->stack_top();

    CAFFEINE_ASSERT(frame.current != frame.current_block->end(),
                    "Instruction pointer ran off end of block.");

    llvm::Instruction& inst = *frame.current;

    // Note: Need to increment the iterator before actually doing
    //       anything with the instruction since instructions can
    //       modify the current position (e.g. branch, call, etc.)
    ++frame.current;

    exec = visit(inst);
  } while (exec == ExecutionResult::Continue);
}

ExecutionResult Interpreter::visitInstruction(llvm::Instruction& inst) {
  CAFFEINE_ABORT(
      fmt::format("Instruction '{}' not implemented!", inst.getOpcodeName()));
}

ExecutionResult Interpreter::visitAdd(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateAdd(lhs, rhs));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitPHINode(llvm::PHINode& node) {
  auto& frame = ctx->stack_top();

  // PHI nodes in the entry block is invalid.
  CAFFEINE_ASSERT(frame.prev_block != nullptr);

  auto value = frame.lookup(node.getIncomingValueForBlock(frame.prev_block));
  frame.insert(&node, value);

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitBranchInst(llvm::BranchInst& inst) {
  if (!inst.isConditional()) {
    ctx->stack_top().jump_to(inst.getSuccessor(0));
    return ExecutionResult::Continue;
  }

  auto& frame = ctx->stack_top();
  auto cond = frame.lookup(inst.getCondition());

  auto zero = ConstantInt::Create(llvm::APInt(cond->type().bitwidth(), 0));
  auto assertion = Assertion(cond);
  auto is_t = ctx->check(assertion);
  auto is_f = ctx->check(!assertion);

  // Note: For the purposes of branching we consider unknown to be
  //       equivalent to sat. Maybe future branches will bring the
  //       equation back to being solvable.
  if (is_t != SolverResult::UNSAT && is_f != SolverResult::UNSAT) {
    auto fork = ctx->fork();

    // In cases where both conditions are possible we follow the
    // false path. This should be enough to get us out of most loops
    // and actually exploring the rest of the program.
    fork.add(assertion);
    ctx->add(!assertion);

    fork.stack_top().jump_to(inst.getSuccessor(0));
    ctx->stack_top().jump_to(inst.getSuccessor(1));

    queue->add_context(std::move(fork));
    return ExecutionResult::Continue;
  } else if (is_t != SolverResult::UNSAT) {
    ctx->add(assertion);
    ctx->stack_top().jump_to(inst.getSuccessor(0));
    return ExecutionResult::Continue;
  } else if (is_f != SolverResult::UNSAT) {
    ctx->add(!assertion);
    ctx->stack_top().jump_to(inst.getSuccessor(1));
    return ExecutionResult::Continue;
  } else {
    return ExecutionResult::Stop;
  }
}

} // namespace caffeine
