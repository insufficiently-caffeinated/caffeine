#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Interpreter/Value.h"
#include "caffeine/Support/Assert.h"

#include <boost/range/adaptor/transformed.hpp>
#include <boost/range/combine.hpp>
#include <boost/range/iterator_range.hpp>
#include <fmt/format.h>

#include <optional>

namespace caffeine {

using VarType = StackFrame::VarType;

namespace detail {
  template <typename F, typename Tuple, size_t... Idxs>
  auto apply_detail(F&& func, Tuple&& tuple, std::index_sequence<Idxs...>) {
    return func(tuple.template get<Idxs>()...);
  }

  // Given a functor object and its arguments as a tuple, call the functor
  // using the provided arguments.
  template <typename F, typename Tuple>
  auto apply(F&& func, Tuple&& tuple) {
    return apply_detail(
        std::forward<F>(func), std::forward<Tuple>(tuple),
        std::make_index_sequence<
            boost::tuples::length<std::decay_t<Tuple>>::value>());
  }

  template <typename T, typename U>
  std::pair<T, U> tuple_to_pair(const boost::tuple<T, U>& tuple) {
    return std::make_pair(tuple.template get<0>(), tuple.template get<1>());
  }
} // namespace detail

template <typename R1, typename R2>
auto zip(R1& range1, R2& range2) {
  return boost::combine(range1, range2) |
         boost::adaptors::transformed(
             detail::tuple_to_pair<std::decay_t<decltype(*range1.begin())>,
                                   std::decay_t<decltype(*range2.begin())>>);
}

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

  frame.insert(&op, transform(BinaryOp::CreateAdd, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSub(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateSub, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitMul(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateMul, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitUDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  auto result = transform(
      [&](const auto& lhs, const auto& rhs) {
        Assertion assertion = ICmpOp::CreateICmp(ICmpOpcode::NE, rhs, 0);
        auto model = ctx->resolve(!assertion);
        if (model->result() == SolverResult::SAT)
          logger->log_failure(*model, *ctx, Failure(!assertion));
        ctx->add(assertion);

        return BinaryOp::CreateUDiv(lhs, rhs);
      },
      lhs, rhs);

  frame.insert(&op, std::move(result));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  auto result = transform(
      [&](const auto& lhs, const auto& rhs) {
        auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, 0);
        auto cmp2 = ICmpOp::CreateICmp(
            ICmpOpcode::EQ, lhs,
            ConstantInt::Create(
                llvm::APInt::getSignedMinValue(lhs->type().bitwidth())));
        auto cmp3 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, -1);

        // lhs == 0 || (lhs == INT_MIN && rhs == -1)
        Assertion assertion =
            BinaryOp::CreateOr(cmp1, BinaryOp::CreateAnd(cmp2, cmp3));
        auto model = ctx->resolve(assertion);
        if (model->result() == SolverResult::SAT)
          logger->log_failure(*model, *ctx, Failure(!assertion));
        ctx->add(!assertion);

        return BinaryOp::CreateSDiv(lhs, rhs);
      },
      lhs, rhs);

  frame.insert(&op, std::move(result));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSRem(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  auto result = transform(
      [&](const auto& lhs, const auto& rhs) {
        auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, 0);
        auto cmp2 = ICmpOp::CreateICmp(
            ICmpOpcode::EQ, lhs,
            ConstantInt::Create(
                llvm::APInt::getSignedMinValue(lhs->type().bitwidth())));
        auto cmp3 = ICmpOp::CreateICmp(ICmpOpcode::EQ, rhs, -1);

        // lhs == 0 || (lhs == INT_MIN && rhs == -1)
        Assertion assertion =
            BinaryOp::CreateOr(cmp1, BinaryOp::CreateAnd(cmp2, cmp3));
        auto model = ctx->resolve(assertion);
        if (model->result() == SolverResult::SAT)
          logger->log_failure(*model, *ctx, Failure(assertion));
        ctx->add(!assertion);

        return BinaryOp::CreateSRem(lhs, rhs);
      },
      lhs, rhs);

  frame.insert(&op, std::move(result));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitURem(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  auto result = transform(
      [&](const auto& lhs, const auto& rhs) {
        Assertion assertion = ICmpOp::CreateICmp(ICmpOpcode::NE, rhs, 0);
        auto model = ctx->resolve(!assertion);
        if (model->result() == SolverResult::SAT)
          logger->log_failure(*model, *ctx, Failure(!assertion));
        ctx->add(assertion);

        return BinaryOp::CreateURem(lhs, rhs);
      },
      lhs, rhs);

  frame.insert(&op, std::move(result));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitShl(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateShl, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitLShr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateLShr, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAShr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateAShr, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAnd(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateAnd, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitOr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateOr, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitXor(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateXor, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitNot(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto operand = frame.lookup(op.getOperand(0));

  frame.insert(&op, transform(UnaryOp::CreateNot, operand));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitFAdd(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFAdd, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitFSub(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFSub, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitFMul(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFMul, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitFDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = frame.lookup(op.getOperand(0));
  auto rhs = frame.lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFAdd, lhs, rhs));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitICmpInst(llvm::ICmpInst& icmp) {
  using llvm::ICmpInst;

  auto& frame = ctx->stack_top();

  auto lhs = frame.lookup(icmp.getOperand(0));
  auto rhs = frame.lookup(icmp.getOperand(1));

#define ICMP_CASE(op)                                                          \
  case ICmpInst::ICMP_##op:                                                    \
    frame.insert(&icmp, transform(                                             \
                            [](const auto& lhs, const auto& rhs) {             \
                              return ICmpOp::CreateICmp(ICmpOpcode::op, lhs,   \
                                                        rhs);                  \
                            },                                                 \
                            lhs, rhs));                                        \
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
} // namespace caffeine
ExecutionResult Interpreter::visitFCmpInst(llvm::FCmpInst& fcmp) {
  using llvm::FCmpInst;

  auto& frame = ctx->stack_top();

  auto lhs = frame.lookup(fcmp.getOperand(0));
  auto rhs = frame.lookup(fcmp.getOperand(1));

#define FCMP_CASE(op)                                                          \
  case FCmpInst::FCMP_##op:                                                    \
    frame.insert(                                                              \
        &fcmp,                                                                 \
        transform(std::bind(FCmpOp::CreateFCmp, FCmpOpcode::op,                \
                            std::placeholders::_1, std::placeholders::_2),     \
                  lhs, rhs));                                                  \
    return ExecutionResult::Continue

  switch (fcmp.getPredicate()) {
    FCMP_CASE(OEQ);
    FCMP_CASE(OGT);
    FCMP_CASE(OGE);
    FCMP_CASE(OLT);
    FCMP_CASE(OLE);
    FCMP_CASE(ONE);
    FCMP_CASE(ORD);
    FCMP_CASE(UEQ);
    FCMP_CASE(UGT);
    FCMP_CASE(UGE);
    FCMP_CASE(ULT);
    FCMP_CASE(ULE);
    FCMP_CASE(UNE);
    FCMP_CASE(UNO);

  case FCmpInst::FCMP_TRUE:
    frame.insert(&fcmp, ConstantInt::Create(true));
    return ExecutionResult::Continue;
  case FCmpInst::FCMP_FALSE:
    frame.insert(&fcmp, ConstantInt::Create(false));
    return ExecutionResult::Continue;

  default:
    CAFFEINE_UNREACHABLE();
  }

#undef FCMP_CASE
}

ExecutionResult Interpreter::visitTrunc(llvm::TruncInst& trunc) {
  auto& frame = ctx->stack_top();
  auto operand = frame.lookup(trunc.getOperand(0));

  auto func = [&](const auto& operand) {
    return UnaryOp::CreateTrunc(
        Type::int_ty(trunc.getType()->getIntegerBitWidth()), operand);
  };
  frame.insert(&trunc, transform(func, operand));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitSExt(llvm::SExtInst& sext) {
  auto& frame = ctx->stack_top();
  auto operand = frame.lookup(sext.getOperand(0));

  auto func = [&](const auto& operand) {
    return UnaryOp::CreateSExt(
        Type::int_ty(sext.getType()->getIntegerBitWidth()), operand);
  };
  frame.insert(&sext, transform(func, operand));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitZExt(llvm::ZExtInst& zext) {
  auto& frame = ctx->stack_top();
  auto operand = frame.lookup(zext.getOperand(0));

  auto func = [&](const auto& operand) {
    return UnaryOp::CreateZExt(
        Type::int_ty(zext.getType()->getIntegerBitWidth()), operand);
  };
  frame.insert(&zext, transform(func, operand));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitPHINode(llvm::PHINode& node) {
  auto& frame = ctx->stack_top();

  // PHI nodes in the entry block is invalid.
  CAFFEINE_ASSERT(frame.prev_block != nullptr);

  frame.insert(&node,
               frame.lookup(node.getIncomingValueForBlock(frame.prev_block)));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitBranchInst(llvm::BranchInst& inst) {
  if (!inst.isConditional()) {
    ctx->stack_top().jump_to(inst.getSuccessor(0));
    return ExecutionResult::Continue;
  }

  auto& frame = ctx->stack_top();
  auto cond_ = frame.lookup(inst.getCondition());
  auto cond = cond_.scalar();

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

  std::optional<ContextValue> result = std::nullopt;
  if (inst.getNumOperands() != 0)
    result = frame.lookup(inst.getOperand(0));

  ctx->pop();

  if (ctx->empty())
    return ExecutionResult::Stop;

  if (result.has_value()) {
    auto& parent = ctx->stack_top();
    auto& caller = *std::prev(parent.current);

    parent.insert(&caller, std::move(*result));
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
  for (auto [arg, val] :
       zip(boost::make_iterator_range(func->arg_begin(), func->arg_end()),
           boost::make_iterator_range(call.arg_begin(), call.arg_end()))) {
    callee.insert(&arg, frame.lookup(val.get()));
  }

  ctx->push(std::move(callee));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSelectInst(llvm::SelectInst& inst) {
  auto& frame = ctx->stack_top();
  auto cond = frame.lookup(inst.getCondition());
  auto trueVal = frame.lookup(inst.getTrueValue());
  auto falseVal = frame.lookup(inst.getFalseValue());
  frame.insert(&inst, transform(SelectOp::Create, cond, trueVal, falseVal));

  return ExecutionResult::Continue;
}

ExecutionResult
Interpreter::visitInsertElementInst(llvm::InsertElementInst& inst) {
  auto& frame = ctx->stack_top();

  auto vec_ = frame.lookup(inst.getOperand(0));
  auto vec = vec_.vector();
  auto elt = frame.lookup(inst.getOperand(1)).scalar();
  auto idx = frame.lookup(inst.getOperand(2)).scalar();

  std::vector<ContextValue> result;
  result.reserve(vec.size());

  for (size_t i = 0; i < vec.size(); ++i) {
    result.push_back(transform(
        [&](const auto& op) {
          return SelectOp::Create(ICmpOp::CreateICmp(ICmpOpcode::EQ, idx, i),
                                  elt, op);
        },
        vec[i]));
  }

  frame.insert(&inst, ContextValue(std::move(result)));

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
  auto cond = frame.lookup(call.getArgOperand(0));
  ctx->add(cond.scalar());

  // Don't check whether adding the assumption causes this path to become
  // dead since assumptions are rare, solver calls are expensive, and it'll
  // get caught at the next conditional branch anyway.
  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAssert(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1);

  auto& frame = ctx->stack_top();
  auto cond = frame.lookup(call.getArgOperand(0));
  auto assertion = Assertion(cond.scalar());

  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT)
    logger->log_failure(*model, *ctx, Failure(!assertion));

  ctx->add(assertion);

  return ExecutionResult::Continue;
}

} // namespace caffeine
