#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Support/Assert.h"

#include <fmt/format.h>

namespace caffeine {

Interpreter::Interpreter(Executor* queue, Context *ctx, const std::shared_ptr<Solver> & solver) :
  ctx{ctx},
  queue{queue},
  solver{solver} {

}

void Interpreter::execute() {
  ExecutionResult exec;

  do {
    StackFrame &frame = ctx->stack_top();

    CAFFEINE_ASSERT(frame.current != frame.current_block->end(),
                 "Instruction pointer ran off end of block.");

    llvm::Instruction &inst = *frame.current;

    // Note: Need to increment the iterator before actually doing
    //       anything with the instruction since instructions can
    //       modify the current position (e.g. branch, call, etc.)
    ++frame.current;

    exec = visit(inst);
  } while (exec == ExecutionResult::Continue);
}

ExecutionResult Interpreter::visitInstruction(llvm::Instruction &inst) {
  CAFFEINE_ABORT(fmt::format("Instruction '{}' not implemented!", inst.getOpcodeName()));
}

ExecutionResult Interpreter::visitAdd(llvm::BinaryOperator &op) {
  StackFrame &frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateAdd(lhs, rhs));

  return ExecutionResult::Continue;
}

}
