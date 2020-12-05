#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Support/Assert.h"

#include <boost/range/combine.hpp>
#include <boost/range/iterator_range.hpp>
#include <fmt/format.h>

namespace caffeine {

Interpreter::Interpreter(Executor* queue, Context* ctx, FailureLogger* logger)
    : ctx{ctx}, queue{queue}, logger{logger} {}

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
ExecutionResult Interpreter::visitSub(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateSub(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitMul(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateMul(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitUDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  Assertion assertion = ICmpOp::CreateICmp(ICmpOpcode::NE, rhs, 0);
  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT)
    logger->log_failure(model.get(), *ctx);
  ctx->add(assertion);

  frame.insert(&op, BinaryOp::CreateUDiv(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, 0);
  auto cmp2 =
      ICmpOp::CreateICmp(ICmpOpcode::EQ, lhs,
                         ConstantInt::Create(llvm::APInt::getSignedMinValue(
                             lhs->type().bitwidth())));
  auto cmp3 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, -1);

  // lhs == 0 || (lhs == INT_MIN && rhs == -1)
  Assertion assertion =
      BinaryOp::CreateOr(cmp1, BinaryOp::CreateAnd(cmp2, cmp3));
  auto model = ctx->resolve(assertion);
  if (model->result() == SolverResult::SAT)
    logger->log_failure(model.get(), *ctx);
  ctx->add(!assertion);

  frame.insert(&op, BinaryOp::CreateSDiv(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSRem(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, 0);
  auto cmp2 =
      ICmpOp::CreateICmp(ICmpOpcode::EQ, lhs,
                         ConstantInt::Create(llvm::APInt::getSignedMinValue(
                             lhs->type().bitwidth())));
  auto cmp3 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, -1);

  // lhs == 0 || (lhs == INT_MIN && rhs == -1)
  Assertion assertion =
      BinaryOp::CreateOr(cmp1, BinaryOp::CreateAnd(cmp2, cmp3));
  auto model = ctx->resolve(assertion);
  if (model->result() == SolverResult::SAT)
    logger->log_failure(model.get(), *ctx);
  ctx->add(!assertion);

  frame.insert(&op, BinaryOp::CreateSRem(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitURem(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  Assertion assertion = ICmpOp::CreateICmp(ICmpOpcode::NE, rhs, 0);
  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT)
    logger->log_failure(model.get(), *ctx);
  ctx->add(assertion);

  frame.insert(&op, BinaryOp::CreateURem(lhs, rhs));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitShl(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateShl(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitLShr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateLShr(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAShr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateAShr(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAnd(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateAnd(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitOr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateOr(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitXor(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, BinaryOp::CreateXor(lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitNot(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  frame.insert(&op, UnaryOp::CreateNot(frame.lookup(op.getOperand(0))));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitICmpInst(llvm::ICmpInst& icmp) {
  using llvm::ICmpInst;

  auto& frame = ctx->stack_top();

  auto lhs = frame.lookup(icmp.getOperand(0));
  auto rhs = frame.lookup(icmp.getOperand(1));

#define ICMP_CASE(op)                                                          \
  case ICmpInst::ICMP_##op:                                                    \
    frame.insert(&icmp, ICmpOp::CreateICmp(ICmpOpcode::op, lhs, rhs));         \
    return ExecutionResult::Continue

  switch (icmp.getPredicate()) {
    ICMP_CASE(EQ);
    ICMP_CASE(NE);
    ICMP_CASE(UGT);
    ICMP_CASE(UGE);
    ICMP_CASE(ULT);
    ICMP_CASE(ULE);
    ICMP_CASE(SGT);
    ICMP_CASE(SGE);
    ICMP_CASE(SLT);
    ICMP_CASE(SLE);
  default:
    CAFFEINE_UNREACHABLE();
  }
#undef ICMP_CASE
}

ExecutionResult Interpreter::visitTrunc(llvm::TruncInst &trunc) {
  auto& frame = ctx->stack_top();
  auto operand = frame.lookup(trunc.getOperand(0));
  auto truncOp = UnaryOp::CreateTrunc(Type::int_ty(trunc.getType()->getIntegerBitWidth()), operand);
  frame.insert(&trunc, truncOp);

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitSExt(llvm::SExtInst &sext){
  auto& frame = ctx->stack_top();
  auto operand = frame.lookup(sext.getOperand(0));
  auto truncOp = UnaryOp::CreateSExt(Type::int_ty(sext.getType()->getIntegerBitWidth()), operand);
  frame.insert(&sext, truncOp);

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitZExt(llvm::ZExtInst &zext){
  auto& frame = ctx->stack_top();
  auto operand = frame.lookup(zext.getOperand(0));
  auto truncOp = UnaryOp::CreateZExt(Type::int_ty(zext.getType()->getIntegerBitWidth()), operand);
  frame.insert(&zext, truncOp);

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
ExecutionResult Interpreter::visitReturnInst(llvm::ReturnInst& inst) {
  auto& frame = ctx->stack_top();

  ref<Operation> result = nullptr;
  if (inst.getNumOperands() != 0)
    result = frame.lookup(inst.getOperand(0));

  ctx->pop();

  if (ctx->empty())
    return ExecutionResult::Stop;

  if (result) {
    auto& parent = ctx->stack_top();
    auto& caller = *std::prev(parent.current);

    parent.insert(&caller, result);
  }

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitCallInst(llvm::CallInst& call) {
  auto func = call.getCalledFunction();

  if (func->isIntrinsic()) {
    CAFFEINE_ABORT(fmt::format("Intrinsic function '{}' is not supported",
                               func->getName().str()));
  }

  CAFFEINE_ASSERT(!call.isIndirectCall(),
                  "Indirect function calls are not supported yet");

  if (func->empty())
    return visitExternFunc(call);

  StackFrame callee{func};
  auto& frame = ctx->stack_top();
  for (auto arg_pair : boost::combine(
           boost::make_iterator_range(func->arg_begin(), func->arg_end()),
           boost::make_iterator_range(call.arg_begin(), call.arg_end()))) {
    callee.insert(&boost::get<0>(arg_pair),
                  frame.lookup(boost::get<1>(arg_pair).get()));
  }

  ctx->push(std::move(callee));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSelectInst(llvm::SelectInst& inst) {
  auto& frame = ctx->stack_top();
  auto cond = frame.lookup(inst.getCondition());
  auto trueVal = frame.lookup(inst.getTrueValue());
  auto falseVal = frame.lookup(inst.getFalseValue());
  frame.insert(&inst, SelectOp::Create(cond, trueVal, falseVal));

  return ExecutionResult::Continue;
}

/***************************************************
 * External function                               *
 ***************************************************/

ExecutionResult Interpreter::visitExternFunc(llvm::CallInst& call) {
  auto func = call.getCalledFunction();
  auto name = func->getName();

  CAFFEINE_ASSERT(func->empty(),
                  "visitExternFunc called with non-external function");

  if (name == "caffeine_assert")
    return visitAssert(call);
  if (name == "caffeine_assume")
    return visitAssume(call);

  CAFFEINE_ABORT(
      fmt::format("external function '{}' not implemented", name.str()));
}

ExecutionResult Interpreter::visitAssume(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1);

  auto& frame = ctx->stack_top();
  ctx->add(frame.lookup(call.getArgOperand(0)));

  // Don't check whether adding the assumption causes this path to become
  // dead since assumptions are rare, solver calls are expensive, and it'll
  // get caught at the next conditional branch anyway.
  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAssert(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1);

  auto& frame = ctx->stack_top();
  auto assertion = Assertion(frame.lookup(call.getArgOperand(0)));

  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT)
    logger->log_failure(model.get(), *ctx);

  ctx->add(assertion);

  return ExecutionResult::Continue;
}

} // namespace caffeine
