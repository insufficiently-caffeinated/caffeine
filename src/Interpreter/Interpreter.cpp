#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/ExprEval.h"
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

#define WRAP_FUNC(func) [](const auto&... args) { return (func)(args...); }

Interpreter::Interpreter(Executor* queue, Context* ctx, FailureLogger* logger,
                         const InterpreterOptions& options)
    : ctx{ctx}, queue{queue}, logger{logger}, options(options) {}

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

#define DEF_SIMPLE_OP(opname, optype)                                          \
  ExecutionResult Interpreter::visit##opname(llvm::optype& op) {               \
    ctx->stack_top().insert(&op, ExprEvaluator(this->ctx).evaluate(op));       \
    return ExecutionResult::Continue;                                          \
  }                                                                            \
  static_assert(true)

DEF_SIMPLE_OP(Add, BinaryOperator);
DEF_SIMPLE_OP(Sub, BinaryOperator);
DEF_SIMPLE_OP(Mul, BinaryOperator);

DEF_SIMPLE_OP(Shl, BinaryOperator);
DEF_SIMPLE_OP(LShr, BinaryOperator);
DEF_SIMPLE_OP(AShr, BinaryOperator);
DEF_SIMPLE_OP(And, BinaryOperator);
DEF_SIMPLE_OP(Or, BinaryOperator);
DEF_SIMPLE_OP(Xor, BinaryOperator);

DEF_SIMPLE_OP(FAdd, BinaryOperator);
DEF_SIMPLE_OP(FSub, BinaryOperator);
DEF_SIMPLE_OP(FMul, BinaryOperator);
DEF_SIMPLE_OP(FDiv, BinaryOperator);

DEF_SIMPLE_OP(Trunc, TruncInst);
DEF_SIMPLE_OP(SExt, SExtInst);
DEF_SIMPLE_OP(ZExt, ZExtInst);
DEF_SIMPLE_OP(IntToPtrInst, IntToPtrInst);
DEF_SIMPLE_OP(PtrToIntInst, PtrToIntInst);
DEF_SIMPLE_OP(BitCastInst, BitCastInst);

DEF_SIMPLE_OP(SelectInst, SelectInst);
DEF_SIMPLE_OP(GetElementPtrInst, GetElementPtrInst);

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

ExecutionResult Interpreter::visitNot(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto operand = ctx->lookup(op.getOperand(0));

  frame.insert(&op, transform(WRAP_FUNC(UnaryOp::CreateNot), operand));

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
      return value.pointer().value(ctx->heap);
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
    frame.insert(&fcmp, transform(                                             \
                            [](const auto& lhs, const auto& rhs) {             \
                              OpRef def = ConstantInt::Create(result);         \
                              OpRef thenFcmp = FCmpOp::CreateFCmp(             \
                                  FCmpOpcode::ourOp, lhs, rhs);                \
                              OpRef neitherIsNaN = SelectOp::Create(           \
                                  UnaryOp::CreateFIsNaN(lhs), def,             \
                                  SelectOp::Create(UnaryOp::CreateFIsNaN(rhs), \
                                                   def, thenFcmp));            \
                              return neitherIsNaN;                             \
                            },                                                 \
                            lhs, rhs));                                        \
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

  CAFFEINE_ASSERT(
      !func->isIntrinsic(),
      "intrinsics function calls should be handled by visitIntrinsic");
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
ExecutionResult Interpreter::visitIntrinsicInst(llvm::IntrinsicInst& intrin) {
  namespace Intrinsic = llvm::Intrinsic;

  switch (intrin.getIntrinsicID()) {
  // These are just markers for when lifetimes are supposed to end.
  case Intrinsic::lifetime_start:
  case Intrinsic::lifetime_end:
    return ExecutionResult::Continue;
  default:
    break;
  }

  CAFFEINE_ABORT(fmt::format("Intrinsic function '{}' is not supported",
                             intrin.getCalledFunction()->getName().str()));
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

ExecutionResult Interpreter::visitLoadInst(llvm::LoadInst& inst) {
  // Note: This treats atomic loads as regular ones since we only model
  //       single-threaded code. If that ever changes then this will need to be
  //       revisited.

  auto operand = ctx->lookup(inst.getOperand(0));
  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();

  // TODO: What are the vector semantics for loads?
  const Pointer& pointer = operand.pointer();

  auto assertion =
      ctx->heap.check_valid(pointer, layout.getTypeStoreSize(inst.getType()));
  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT) {
    logger->log_failure(*model, *ctx, Failure(!assertion));

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Stop;
  }

  auto resolved = ctx->heap.resolve(pointer, *ctx);

  for (const Pointer& ptr : resolved) {
    Context forked = ctx->fork();

    Allocation& alloc = ctx->heap[ptr.alloc()];
    forked.add(alloc.check_inbounds(ptr.offset(),
                                    layout.getTypeStoreSize(inst.getType())));

    auto value = alloc.read(ptr.offset(), inst.getType(), layout);
    forked.stack_top().insert(&inst, value);

    queue->add_context(std::move(forked));
  }

  return ExecutionResult::Stop;
}
ExecutionResult Interpreter::visitStoreInst(llvm::StoreInst& inst) {
  auto value = ctx->lookup(inst.getOperand(0));
  auto dest = ctx->lookup(inst.getOperand(1));
  auto op_ty = inst.getOperand(0)->getType();

  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();
  const Pointer& pointer = dest.pointer();

  auto assertion = ctx->heap.check_valid(
      pointer, layout.getTypeStoreSize(inst.getOperand(0)->getType()));
  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT) {
    logger->log_failure(*model, *ctx, Failure(!assertion));

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Stop;
  }

  auto resolved = ctx->heap.resolve(pointer, *ctx);
  for (const Pointer& ptr : resolved) {
    Context forked = ctx->fork();

    Allocation& alloc = forked.heap[ptr.alloc()];
    forked.add(
        alloc.check_inbounds(ptr.offset(), layout.getTypeStoreSize(op_ty)));
    alloc.write(ptr.offset(), op_ty, value, ctx->heap, layout);

    queue->add_context(std::move(forked));
  }

  return ExecutionResult::Stop;
}
ExecutionResult Interpreter::visitAllocaInst(llvm::AllocaInst& inst) {
  auto& frame = ctx->stack_top();
  const auto& layout = inst.getModule()->getDataLayout();

  uint64_t size =
      layout.getTypeAllocSize(inst.getAllocatedType()).getFixedSize();
  uint64_t align = std::max<uint64_t>(inst.getAlignment(), 1);

  unsigned ptr_width =
      layout.getPointerSizeInBits(inst.getType()->getPointerAddressSpace());

  auto size_op = ConstantInt::Create(llvm::APInt(ptr_width, size));
  auto alloc = ctx->heap.allocate(
      size_op, ConstantInt::Create(llvm::APInt(ptr_width, align)),
      AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0xDD))),
      AllocationKind::Alloca, *ctx);

  frame.insert(&inst,
               ContextValue(Pointer(
                   alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)))));
  frame.allocations.push_back(alloc);

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitMemCpyInst(llvm::MemCpyInst& memcpy) {
  // memcpy is implemented by a C function within the builtins library so we
  // just forward the call to that.
  auto func = memcpy.getModule()->getFunction("caffeine_builtin_memcpy");
  CAFFEINE_ASSERT(func);
  memcpy.setCalledFunction(func);

  return visitCall(memcpy);
}
ExecutionResult Interpreter::visitMemMoveInst(llvm::MemMoveInst& memmove) {
  // memmove is implemented by a C function within the builtins library so we
  // just forward the call to that.
  auto func = memmove.getModule()->getFunction("caffeine_builtin_memmove");
  CAFFEINE_ASSERT(func);
  memmove.setCalledFunction(func);

  return visitCall(memmove);
}
ExecutionResult Interpreter::visitMemSetInst(llvm::MemSetInst& memset) {
  // memset is implemented by a C function within the builtins library so we
  // just forward the call to that.
  auto func = memset.getModule()->getFunction("caffeine_builtin_memset");
  CAFFEINE_ASSERT(func);
  memset.setCalledFunction(func);

  return visitCall(memset);
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

  if (name == "caffeine_malloc")
    return visitMalloc(call);
  if (name == "caffeine_calloc")
    return visitCalloc(call);
  if (name == "caffeine_free")
    return visitFree(call);

  if (name == "caffeine_builtin_resolve")
    return visitBuiltinResolve(call);
  if (name == "caffeine_builtin_symbolic_alloca")
    return visitSymbolicAlloca(call);

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

std::optional<std::string> readSymbolicName(Context* ctx, const Pointer& ptr) {
  const auto& alloc = ctx->heap[ptr.alloc()];

  auto model = ctx->resolve();
  if (model->result() != SolverResult::SAT) {
    return std::nullopt;
  }

  uint64_t offset = model->evaluate(*ptr.offset()).apint().getLimitedValue();
  uint64_t size = model->evaluate(*alloc.size()).apint().getLimitedValue();
  auto array = std::move(model->evaluate(*alloc.data()).array());

  std::string name;
  name.reserve(size - offset);

  const char* values = array.data();
  for (size_t i = offset; i < size; ++i) {
    if (values[i] == 0)
      return name;
    name.push_back(values[i]);
  }

  // TODO: This should really be an error when we would read beyond the end of
  //       the array.
  return std::nullopt;
}

ExecutionResult Interpreter::visitSymbolicAlloca(llvm::CallInst& call) {
  auto size = ctx->lookup(call.getArgOperand(0)).scalar();
  auto name = ctx->lookup(call.getArgOperand(1)).pointer();

  auto resolved = ctx->heap.resolve(name, *ctx);

  CAFFEINE_ASSERT(resolved.size() == 1,
                  "caffeine_make_symbolic called with symbolic name");

  auto alloc_name = readSymbolicName(ctx, resolved.front());
  if (!alloc_name.has_value())
    return ExecutionResult::Stop;

  unsigned ptr_width = size->type().bitwidth();

  auto alloc = ctx->heap.allocate(
      size, ConstantInt::Create(llvm::APInt(ptr_width, 1)),
      ConstantArray::Create(Symbol(std::move(*alloc_name)), size),
      AllocationKind::Alloca, *ctx);

  auto& frame = ctx->stack_top();
  frame.insert(&call,
               ContextValue(Pointer(
                   alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)))));
  frame.allocations.push_back(alloc);

  return ExecutionResult::Continue;
}

/**
 * caffeine_malloc is a more limited version of malloc that expects the input
 * size to never be 0.
 */
ExecutionResult Interpreter::visitMalloc(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1, "Invalid malloc signature");
  CAFFEINE_ASSERT(call.getType()->isPointerTy(), "Invalid malloc signature");

  auto size = ctx->lookup(call.getArgOperand(0)).scalar();
  const llvm::DataLayout& layout = call.getModule()->getDataLayout();

  CAFFEINE_ASSERT(size->type().is_int(), "Invalid malloc signature");
  CAFFEINE_ASSERT(
      size->type().bitwidth() ==
          layout.getIndexSizeInBits(call.getType()->getPointerAddressSpace()),
      "Invalid malloc signature");

  auto ptr_width =
      layout.getPointerSizeInBits(call.getType()->getPointerAddressSpace());

  if (options.malloc_can_return_null) {
    Context forked = ctx->fork();
    forked.stack_top().insert(
        &call,
        ContextValue(Pointer(ConstantInt::Create(llvm::APInt(ptr_width, 0)))));
    queue->add_context(std::move(forked));
  }

  auto size_op = UnaryOp::CreateTruncOrZExt(Type::int_ty(ptr_width), size);
  auto alloc = ctx->heap.allocate(
      size_op,
      ConstantInt::Create(llvm::APInt(ptr_width, options.malloc_alignment)),
      AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0xDD))),
      AllocationKind::Malloc, *ctx);

  ctx->stack_top().insert(
      &call, ContextValue(Pointer(
                 alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)))));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitCalloc(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1, "Invalid calloc signature");
  CAFFEINE_ASSERT(call.getType()->isPointerTy(), "Invalid calloc signature");

  auto size = ctx->lookup(call.getArgOperand(0)).scalar();
  const llvm::DataLayout& layout = call.getModule()->getDataLayout();

  CAFFEINE_ASSERT(size->type().is_int(), "Invalid calloc signature");
  CAFFEINE_ASSERT(
      size->type().bitwidth() ==
          layout.getIndexSizeInBits(call.getType()->getPointerAddressSpace()),
      "Invalid calloc signature");

  auto ptr_width =
      layout.getPointerSizeInBits(call.getType()->getPointerAddressSpace());

  if (options.malloc_can_return_null) {
    Context forked = ctx->fork();
    forked.stack_top().insert(
        &call,
        ContextValue(Pointer(ConstantInt::Create(llvm::APInt(ptr_width, 0)))));
    queue->add_context(std::move(forked));
  }

  auto size_op = UnaryOp::CreateTruncOrZExt(Type::int_ty(ptr_width), size);
  auto alloc = ctx->heap.allocate(
      size_op,
      ConstantInt::Create(llvm::APInt(ptr_width, options.malloc_alignment)),
      AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0x00))),
      AllocationKind::Malloc, *ctx);

  ctx->stack_top().insert(
      &call, ContextValue(Pointer(
                 alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)))));

  return ExecutionResult::Continue;
}
/**
 * caffeine_free is a more limited version of free that doesn't expect the input
 * to be a null pointer.
 */
ExecutionResult Interpreter::visitFree(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1, "Invalid free signature");
  CAFFEINE_ASSERT(call.getType()->isVoidTy(), "Invalid free signature");
  CAFFEINE_ASSERT(call.getArgOperand(0)->getType()->isPointerTy(),
                  "Invalid free signature");

  auto& heap = ctx->heap;
  auto memptr = ctx->lookup(call.getArgOperand(0)).pointer();

  auto is_valid_ptr = heap.check_starts_allocation(memptr);
  auto model = ctx->resolve(!is_valid_ptr);
  if (model->result() == SolverResult::SAT) {
    logger->log_failure(
        *model, *ctx,
        Failure(is_valid_ptr, "Attempted to free an invalid pointer"));
    return ExecutionResult::Stop;
  }

  auto resolved = heap.resolve(memptr, *ctx);
  CAFFEINE_ASSERT(!resolved.empty());

  for (size_t i = 1; i < resolved.size(); ++i) {
    Context forked = ctx->fork();

    Allocation& alloc = forked.heap[resolved[i].alloc()];

    forked.add(ICmpOp::CreateICmp(
        ICmpOpcode::EQ, resolved[i].value(forked.heap), alloc.address()));

    if (alloc.kind() != AllocationKind::Malloc) {
      auto model = ctx->resolve();

      if (model->result() == SolverResult::SAT)
        logger->log_failure(*model, forked,
                            Failure(Assertion::constant(true),
                                    "Attempted to free a pointer that was not "
                                    "allocated by malloc"));

      continue;
    }

    forked.heap.deallocate(resolved[i].alloc());
    queue->add_context(std::move(forked));
  }

  heap.deallocate(resolved[0].alloc());

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitBuiltinResolve(llvm::CallInst& call) {
  auto mem = ctx->lookup(call.getArgOperand(0)).pointer();
  auto size = ctx->lookup(call.getArgOperand(1)).scalar();

  auto assertion = ctx->heap.check_valid(mem, size);
  auto model = ctx->resolve(!assertion);
  if (model->result() == SolverResult::SAT) {
    logger->log_failure(*model, *ctx, Failure(!assertion));

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Stop;
  }

  auto resolved = ctx->heap.resolve(mem, *ctx);

  if (resolved.size() == 1) {
    ctx->stack_top().insert(&call, ContextValue(resolved[0]));
    return ExecutionResult::Continue;
  }

  for (const auto& ptr : resolved) {
    Context forked = ctx->fork();
    forked.stack_top().insert(&call, ContextValue(ptr));
    queue->add_context(std::move(forked));
  }

  return ExecutionResult::Stop;
}

} // namespace caffeine
