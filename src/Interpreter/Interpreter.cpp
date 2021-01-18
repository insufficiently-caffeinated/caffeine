#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Interpreter/Value.h"
#include "caffeine/Support/Assert.h"

#include <boost/range/adaptor/transformed.hpp>
#include <boost/range/combine.hpp>
#include <boost/range/iterator_range.hpp>
#include <fmt/format.h>
#include <llvm/IR/GetElementPtrTypeIterator.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <optional>

namespace caffeine {

/**
 * Combine the two provided iterators into a single one which
 * yields std::pair.
 */
template <typename R1, typename R2>
auto zip(R1& range1, R2& range2) {
  return boost::combine(range1, range2) |
         boost::adaptors::transformed([](const auto& tuple) {
           return std::make_pair(tuple.template get<0>(),
                                 tuple.template get<1>());
         });
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

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateAdd, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSub(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateSub, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitMul(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateMul, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitUDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

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

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

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

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

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

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

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

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateShl, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitLShr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateLShr, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAShr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateAShr, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAnd(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateAnd, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitOr(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateOr, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitXor(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateXor, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitNot(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto operand = ctx->lookup(op.getOperand(0));

  frame.insert(&op, transform(UnaryOp::CreateNot, operand));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitFAdd(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFAdd, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitFSub(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFSub, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitFMul(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFMul, lhs, rhs));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitFDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  frame.insert(&op, transform(BinaryOp::CreateFAdd, lhs, rhs));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitICmpInst(llvm::ICmpInst& icmp) {
  using llvm::ICmpInst;

  auto& frame = ctx->stack_top();

  auto lhs = ctx->lookup(icmp.getOperand(0));
  auto rhs = ctx->lookup(icmp.getOperand(1));

  // Normalize the ContextValue to a comparable value
  auto to_scalar = [&](const ContextValue& value) {
    if (value.is_scalar())
      return value.scalar();
    if (value.is_pointer())
      return value.pointer().value(ctx->heap());
    CAFFEINE_UNREACHABLE();
  };

#define ICMP_CASE(op)                                                          \
  case ICmpInst::ICMP_##op:                                                    \
    frame.insert(&icmp,                                                        \
                 transform_value(                                              \
                     [&](const auto& lhs, const auto& rhs) {                   \
                       return ContextValue(ICmpOp::CreateICmp(                 \
                           ICmpOpcode::op, to_scalar(lhs), to_scalar(rhs)));   \
                     },                                                        \
                     lhs, rhs));                                               \
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

  auto lhs = ctx->lookup(fcmp.getOperand(0));
  auto rhs = ctx->lookup(fcmp.getOperand(1));

// `result` is the boolean value to return if either the lhs or rhs is a NaN
#define FCMP_CASE(op, ourOp, result)                                           \
  case FCmpInst::FCMP_##op:                                                    \
    frame.insert(&fcmp,                                                        \
                 transform(                                                    \
                     [](const auto& lhs, const auto& rhs) {                    \
                       ref<Operation> def = ConstantInt::Create(result);       \
                       ref<Operation> thenFcmp =                               \
                           FCmpOp::CreateFCmp(FCmpOpcode::ourOp, lhs, rhs);    \
                       ref<Operation> neitherIsNaN = SelectOp::Create(         \
                           UnaryOp::CreateFIsNaN(lhs), def,                    \
                           SelectOp::Create(UnaryOp::CreateFIsNaN(rhs), def,   \
                                            thenFcmp));                        \
                       return neitherIsNaN;                                    \
                     },                                                        \
                     lhs, rhs));                                               \
    return ExecutionResult::Continue;

  switch (fcmp.getPredicate()) {
    FCMP_CASE(OEQ, EQ, false);
    FCMP_CASE(OGT, GT, false);
    FCMP_CASE(OGE, GE, false);
    FCMP_CASE(OLT, LT, false);
    FCMP_CASE(OLE, LE, false);
    FCMP_CASE(ONE, NE, false);
    // The 'unordered' instructions return true if either arg is NaN
    FCMP_CASE(UEQ, EQ, true);
    FCMP_CASE(UGT, GT, true);
    FCMP_CASE(UGE, GE, true);
    FCMP_CASE(ULT, LT, true);
    FCMP_CASE(ULE, LE, true);
    FCMP_CASE(UNE, NE, true);

  case FCmpInst::FCMP_UNO:
    frame.insert(&fcmp,
                 transform(
                     [](const auto& lhs, const auto& rhs) {
                       // isnan(lhs) || isnan(rhs)
                       return BinaryOp::CreateOr(UnaryOp::CreateFIsNaN(lhs),
                                                 UnaryOp::CreateFIsNaN(rhs));
                     },
                     rhs, lhs));
    return ExecutionResult::Continue;
  case FCmpInst::FCMP_ORD:
    frame.insert(&fcmp, transform(
                            [](const auto& lhs, const auto& rhs) {
                              // ! ( isnan(lhs) || isnan(rhs) )
                              return UnaryOp::CreateNot(BinaryOp::CreateOr(
                                  UnaryOp::CreateFIsNaN(lhs),
                                  UnaryOp::CreateFIsNaN(rhs)));
                            },
                            rhs, lhs));
    return ExecutionResult::Continue;
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
#undef FCMP_CASE_DEF
}

ExecutionResult Interpreter::visitTrunc(llvm::TruncInst& trunc) {
  auto& frame = ctx->stack_top();
  auto operand = ctx->lookup(trunc.getOperand(0));

  auto func = [&](const auto& operand) {
    return UnaryOp::CreateTrunc(
        Type::int_ty(trunc.getType()->getIntegerBitWidth()), operand);
  };
  frame.insert(&trunc, transform(func, operand));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitSExt(llvm::SExtInst& sext) {
  auto& frame = ctx->stack_top();
  auto operand = ctx->lookup(sext.getOperand(0));

  auto func = [&](const auto& operand) {
    return UnaryOp::CreateSExt(
        Type::int_ty(sext.getType()->getIntegerBitWidth()), operand);
  };
  frame.insert(&sext, transform(func, operand));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitZExt(llvm::ZExtInst& zext) {
  auto& frame = ctx->stack_top();
  auto operand = ctx->lookup(zext.getOperand(0));

  auto func = [&](const auto& operand) {
    return UnaryOp::CreateZExt(
        Type::int_ty(zext.getType()->getIntegerBitWidth()), operand);
  };
  frame.insert(&zext, transform(func, operand));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitBitCastInst(llvm::BitCastInst& bitcast) {
  auto& frame = ctx->stack_top();

  CAFFEINE_ASSERT(bitcast.getType()->isPointerTy(),
                  "non-pointer bitcasts are not yet supported");

  frame.insert(&bitcast, ctx->lookup(bitcast.getOperand(0)));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitPHINode(llvm::PHINode& node) {
  auto& frame = ctx->stack_top();

  // PHI nodes in the entry block is invalid.
  CAFFEINE_ASSERT(frame.prev_block != nullptr);

  auto value = ctx->lookup(node.getIncomingValueForBlock(frame.prev_block));
  frame.insert(&node, value);

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitBranchInst(llvm::BranchInst& inst) {
  if (!inst.isConditional()) {
    ctx->stack_top().jump_to(inst.getSuccessor(0));
    return ExecutionResult::Continue;
  }

  auto cond_ = ctx->lookup(inst.getCondition());
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
  std::optional<ContextValue> result = std::nullopt;
  if (inst.getNumOperands() != 0)
    result = ctx->lookup(inst.getOperand(0));

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
  for (auto [arg, val] :
       zip(boost::make_iterator_range(func->arg_begin(), func->arg_end()),
           boost::make_iterator_range(call.arg_begin(), call.arg_end()))) {
    callee.insert(&arg, ctx->lookup(val.get()));
  }

  ctx->push(std::move(callee));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitSelectInst(llvm::SelectInst& inst) {
  auto& frame = ctx->stack_top();
  auto cond = ctx->lookup(inst.getCondition());
  auto trueVal = ctx->lookup(inst.getTrueValue());
  auto falseVal = ctx->lookup(inst.getFalseValue());
  frame.insert(&inst, transform(SelectOp::Create, cond, trueVal, falseVal));

  return ExecutionResult::Continue;
}

ExecutionResult
Interpreter::visitInsertElementInst(llvm::InsertElementInst& inst) {
  auto& frame = ctx->stack_top();

  auto vec_ = ctx->lookup(inst.getOperand(0));
  auto vec = vec_.vector();
  auto elt = ctx->lookup(inst.getOperand(1)).scalar();
  auto idx = ctx->lookup(inst.getOperand(2)).scalar();

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
ExecutionResult
Interpreter::visitExtractElementInst(llvm::ExtractElementInst& inst) {
  auto& frame = ctx->stack_top();

  auto vec_ = ctx->lookup(inst.getOperand(0));
  auto vec = vec_.vector();
  auto idx = ctx->lookup(inst.getOperand(1)).scalar();

  CAFFEINE_ASSERT(vec.size() != 0);

  ContextValue result =
      transform([](const auto& v) { return Undef::Create(v->type()); }, vec[0]);

  for (size_t i = 0; i < vec.size(); ++i) {
    result = transform(
        [&](const auto& r, const auto& v) {
          return SelectOp::Create(ICmpOp::CreateICmp(ICmpOpcode::EQ, idx, i), v,
                                  r);
        },
        result, vec[i]);
  }

  frame.insert(&inst, std::move(result));

  return ExecutionResult::Continue;
}
ExecutionResult
Interpreter::visitShuffleVectorInst(llvm::ShuffleVectorInst& inst) {
  auto& frame = ctx->stack_top();

  auto vec1_ = ctx->lookup(inst.getOperand(0));
  auto vec2_ = ctx->lookup(inst.getOperand(1));
  auto mask_ = ctx->lookup(inst.getOperand(2));

  auto vec1 = vec1_.vector();
  auto vec2 = vec2_.vector();
  auto mask = mask_.vector();

  std::vector<ContextValue> result;
  result.reserve(vec1.size());

  /**
   * The semantics of shufflevector end up basically being an array lookup.
   * Given two vectors x, y and a mask m, we form one big vector z by
   * concatenating z = x||y. Then the values in m are used as indices in z
   * to get the final vector value.
   *
   * We emulate these semantics by creating nested select chains. For constant
   * masks we rely on constant-folding to make these more efficient.
   */
  for (size_t i = 0; i < mask.size(); ++i) {
    // Any non-specified index is undef
    ContextValue value = transform(
        [&](const auto& v1, const auto& v2) {
          CAFFEINE_ASSERT(v1->type() == v2->type());
          return Undef::Create(v1->type());
        },
        vec1[i], vec2[i]);

    for (size_t j = 0; j < mask.size(); ++j) {
      value = transform(
          [&](const auto& r, const auto& v, const auto& m) {
            return SelectOp::Create(ICmpOp::CreateICmp(ICmpOpcode::EQ, m, j), v,
                                    r);
          },
          value, vec1[j], mask[i]);
    }

    for (size_t j = 0; j < mask.size(); ++j) {
      value = transform(
          [&](const auto& r, const auto& v, const auto& m) {
            return SelectOp::Create(
                ICmpOp::CreateICmp(ICmpOpcode::EQ, m, j + mask.size()), v, r);
          },
          value, vec2[j], mask[i]);
    }

    result.push_back(value);
  }

  frame.insert(&inst, ContextValue(std::move(result)));

  return ExecutionResult::Continue;
}

static llvm::Type* vector_inner_type(llvm::Type* type) {
  while (type->isVectorTy())
    type = type->getVectorElementType();
  return type;
}

ExecutionResult
Interpreter::visitGetElementPtrInst(llvm::GetElementPtrInst& inst) {
  auto& frame = ctx->stack_top();

  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();
  llvm::Value* ptr_op = inst.getOperand(0);
  llvm::Type* ptr_ty = vector_inner_type(ptr_op->getType());

  auto offset_width =
      layout.getPointerSizeInBits(ptr_ty->getPointerAddressSpace());
  auto offset = ConstantInt::Create(llvm::APInt(offset_width, 0));

  auto end = llvm::gep_type_end(&inst);
  for (auto it = llvm::gep_type_begin(&inst); it != end; ++it) {
    if (llvm::StructType* sty = it.getStructTypeOrNull()) {
      auto slo = layout.getStructLayout(sty);
      unsigned index =
          llvm::cast<llvm::ConstantInt>(it.getOperand())->getZExtValue();

      offset = BinaryOp::CreateAdd(offset, ConstantInt::Create(llvm::APInt(
                                               offset->type().bitwidth(),
                                               slo->getElementOffset(index))));
    } else {
      auto value = ctx->lookup(it.getOperand()).scalar();
      unsigned bitwidth = value->type().bitwidth();

      if (bitwidth < offset_width)
        value = UnaryOp::CreateSExt(Type::int_ty(offset_width), value);
      else if (bitwidth > offset_width)
        value = UnaryOp::CreateTrunc(Type::int_ty(offset_width), value);

      auto itemoffset = BinaryOp::CreateMul(
          value, ConstantInt::Create(llvm::APInt(
                     bitwidth, layout.getTypeAllocSize(it.getIndexedType()))));

      offset = BinaryOp::CreateAdd(offset, itemoffset);
    }
  }

  auto result = transform_value(
      [&](const ContextValue& value) {
        const auto& ptr = value.pointer();

        if (inst.isInBounds() && ptr.is_resolved()) {
          return ContextValue(
              Pointer(ptr.alloc(), BinaryOp::CreateAdd(ptr.offset(), offset)));
        } else {
          return ContextValue(
              Pointer(BinaryOp::CreateAdd(ptr.value(ctx->heap()), offset)));
        }
      },
      ctx->lookup(ptr_op));

  frame.insert(&inst, result);

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitLoadInst(llvm::LoadInst& inst) {
  // Note: This treats atomic loads as regular ones since we only model
  //       single-threaded code. If that ever changes then this will need to be
  //       revisited.

  CAFFEINE_ASSERT(!inst.getType()->isVectorTy(),
                  "Load/store of vector types are not supported yet");

  auto operand = ctx->lookup(inst.getOperand(0));
  auto load_ty = Type::from_llvm(inst.getType());
  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();

  // TODO: What are the vector semantics for loads?
  const Pointer& pointer = operand.pointer();

  auto assertion = ctx->heap().check_valid(pointer);
  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT) {
    logger->log_failure(*model, *ctx, Failure(!assertion));

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Stop;
  }

  ctx->add(assertion);

  auto resolved = ctx->heap().resolve(pointer, *ctx);

  for (const Pointer& ptr : resolved) {
    Context forked = ctx->fork();

    Allocation& alloc = ctx->heap()[ptr.alloc()];
    forked.add(alloc.check_inbounds(ptr.offset(), load_ty.byte_size(layout)));

    auto value = alloc.read(ptr.offset(), load_ty, layout);
    forked.stack_top().insert(&inst, value);

    queue->add_context(std::move(forked));
  }

  return ExecutionResult::Stop;
}
ExecutionResult Interpreter::visitStoreInst(llvm::StoreInst& inst) {
  CAFFEINE_ASSERT(!inst.getType()->isVectorTy(),
                  "Load/store of vector types are not supported yet");

  auto dest = ctx->lookup(inst.getOperand(1));
  auto value = [&] {
    auto value = ctx->lookup(inst.getOperand(0));

    if (value.is_scalar())
      return value.scalar();
    if (value.is_pointer())
      return value.pointer().value(ctx->heap());

    CAFFEINE_ABORT("Load/store of vector types are not supported yet");
  }();
  auto val_ty = value->type();

  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();
  const Pointer& pointer = dest.pointer();

  auto assertion = ctx->heap().check_valid(pointer);
  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT) {
    logger->log_failure(*model, *ctx, Failure(!assertion));

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Stop;
  }

  ctx->add(assertion);

  auto resolved = ctx->heap().resolve(pointer, *ctx);
  for (const Pointer& ptr : resolved) {
    Context forked = ctx->fork();

    Allocation& alloc = forked.heap()[ptr.alloc()];
    forked.add(alloc.check_inbounds(ptr.offset(), val_ty.byte_size(layout)));
    alloc.write(ptr.offset(), value, layout);

    queue->add_context(std::move(forked));
  }

  return ExecutionResult::Stop;
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

  auto cond = ctx->lookup(call.getArgOperand(0));
  ctx->add(cond.scalar());

  // Don't check whether adding the assumption causes this path to become
  // dead since assumptions are rare, solver calls are expensive, and it'll
  // get caught at the next conditional branch anyway.
  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAssert(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1);

  auto cond = ctx->lookup(call.getArgOperand(0));
  auto assertion = Assertion(cond.scalar());

  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT)
    logger->log_failure(*model, *ctx, Failure(!assertion));

  ctx->add(assertion);

  return ExecutionResult::Continue;
}

} // namespace caffeine
