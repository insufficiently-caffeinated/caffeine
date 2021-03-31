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

ExecutionResult::ExecutionResult(Status status) : status_(status) {}
ExecutionResult::ExecutionResult(llvm::SmallVector<Context, 2>&& contexts)
    : status_(Dead), contexts_(std::move(contexts)) {}

Interpreter::Interpreter(Executor* queue, Context* ctx, FailureLogger* logger,
                         const InterpreterOptions& options)
    : ctx{ctx}, queue{queue}, logger{logger}, options(options) {}

void Interpreter::execute() {
  while (true) {
    StackFrame& frame = ctx->stack_top();

    CAFFEINE_ASSERT(frame.current != frame.current_block->end(),
                    "Instruction pointer ran off end of block.");

    llvm::Instruction& inst = *frame.current;

    // Note: Need to increment the iterator before actually doing
    //       anything with the instruction since instructions can
    //       modify the current position (e.g. branch, call, etc.)
    ++frame.current;

    ExecutionResult res = visit(inst);

    if (!res.contexts().empty()) {
      for (Context& ctx : res.contexts()) {
        queue->add_context(std::move(ctx));
      }
      break;
    }

    if (res.status() != ExecutionResult::Continue) {
      break;
    }
  }
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

DEF_SIMPLE_OP(BinaryOperator, BinaryOperator);
DEF_SIMPLE_OP(UnaryOperator, UnaryOperator);
DEF_SIMPLE_OP(CastInst, CastInst);
DEF_SIMPLE_OP(CmpInst, CmpInst);

DEF_SIMPLE_OP(SelectInst, SelectInst);
DEF_SIMPLE_OP(GetElementPtrInst, GetElementPtrInst);

DEF_SIMPLE_OP(InsertElementInst, InsertElementInst);
DEF_SIMPLE_OP(ExtractElementInst, ExtractElementInst);
DEF_SIMPLE_OP(ShuffleVectorInst, ShuffleVectorInst);

ExecutionResult Interpreter::visitUDiv(llvm::BinaryOperator& op) {
  StackFrame& frame = ctx->stack_top();

  auto lhs = ctx->lookup(op.getOperand(0));
  auto rhs = ctx->lookup(op.getOperand(1));

  auto result = transform_exprs(
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

  auto result = transform_exprs(
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

  auto result = transform_exprs(
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

  auto result = transform_exprs(
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

  auto cond = ctx->lookup(inst.getCondition()).scalar().expr();
  auto assertion = Assertion(cond);
  auto is_t = ctx->check(assertion);
  auto is_f = ctx->check(!assertion);

  size_t count = 0;
  count += is_t != SolverResult::UNSAT;
  count += is_f != SolverResult::UNSAT;

  auto forks = ctx->fork(count);
  size_t idx = 0;

  // Note: For the purposes of branching we consider unknown to be
  //       equivalent to sat. Maybe future branches will bring the
  //       equation back to being solvable.
  if (is_t != SolverResult::UNSAT) {
    auto& fork = forks[idx++];

    fork.add(assertion);
    fork.stack_top().jump_to(inst.getSuccessor(0));
  }

  if (is_f != SolverResult::UNSAT) {
    auto& fork = forks[idx++];

    fork.add(!assertion);
    fork.stack_top().jump_to(inst.getSuccessor(1));
  }

  return forks;
}
ExecutionResult Interpreter::visitReturnInst(llvm::ReturnInst& inst) {
  std::optional<LLVMValue> result = std::nullopt;
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

ExecutionResult Interpreter::visitLoadInst(llvm::LoadInst& inst) {
  // Note: This treats atomic loads as regular ones since we only model
  //       single-threaded code. If that ever changes then this will need to be
  //       revisited.

  auto operand = ctx->lookup(inst.getOperand(0));
  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();

  // TODO: What are the vector semantics for loads?
  const Pointer& pointer = operand.scalar().pointer();

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
    Context forked = ctx->fork_once();

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
  const Pointer& pointer = dest.scalar().pointer();

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
    Context forked = ctx->fork_once();

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

  frame.insert(&inst, LLVMValue(Pointer(alloc, ConstantInt::Create(llvm::APInt(
                                                   ptr_width, 0)))));
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
  ctx->add(cond.scalar().expr());

  // Don't check whether adding the assumption causes this path to become
  // dead since assumptions are rare, solver calls are expensive, and it'll
  // get caught at the next conditional branch anyway.
  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitAssert(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1);

  auto cond = ctx->lookup(call.getArgOperand(0));
  auto assertion = Assertion(cond.scalar().expr());

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
  auto size = ctx->lookup(call.getArgOperand(0)).scalar().expr();
  auto name = ctx->lookup(call.getArgOperand(1)).scalar().pointer();

  auto resolved = ctx->heap.resolve(name, *ctx);

  CAFFEINE_ASSERT(!resolved.empty(),
                  "caffeine_make_symbolic called with invalid name pointer");
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
  frame.insert(&call, LLVMValue(Pointer(alloc, ConstantInt::Create(llvm::APInt(
                                                   ptr_width, 0)))));
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

  auto size = ctx->lookup(call.getArgOperand(0)).scalar().expr();
  const llvm::DataLayout& layout = call.getModule()->getDataLayout();

  CAFFEINE_ASSERT(size->type().is_int(), "Invalid malloc signature");
  CAFFEINE_ASSERT(
      size->type().bitwidth() ==
          layout.getIndexSizeInBits(call.getType()->getPointerAddressSpace()),
      "Invalid malloc signature");

  auto ptr_width =
      layout.getPointerSizeInBits(call.getType()->getPointerAddressSpace());

  if (options.malloc_can_return_null) {
    Context forked = ctx->fork_once();
    forked.stack_top().insert(
        &call,
        LLVMValue(Pointer(ConstantInt::Create(llvm::APInt(ptr_width, 0)))));
    queue->add_context(std::move(forked));
  }

  auto size_op = UnaryOp::CreateTruncOrZExt(Type::int_ty(ptr_width), size);
  auto alloc = ctx->heap.allocate(
      size_op,
      ConstantInt::Create(llvm::APInt(ptr_width, options.malloc_alignment)),
      AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0xDD))),
      AllocationKind::Malloc, *ctx);

  ctx->stack_top().insert(
      &call, LLVMValue(Pointer(
                 alloc, ConstantInt::Create(llvm::APInt(ptr_width, 0)))));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitCalloc(llvm::CallInst& call) {
  CAFFEINE_ASSERT(call.getNumArgOperands() == 1, "Invalid calloc signature");
  CAFFEINE_ASSERT(call.getType()->isPointerTy(), "Invalid calloc signature");

  auto size = ctx->lookup(call.getArgOperand(0)).scalar().expr();
  const llvm::DataLayout& layout = call.getModule()->getDataLayout();

  CAFFEINE_ASSERT(size->type().is_int(), "Invalid calloc signature");
  CAFFEINE_ASSERT(
      size->type().bitwidth() ==
          layout.getIndexSizeInBits(call.getType()->getPointerAddressSpace()),
      "Invalid calloc signature");

  auto ptr_width =
      layout.getPointerSizeInBits(call.getType()->getPointerAddressSpace());

  if (options.malloc_can_return_null) {
    Context forked = ctx->fork_once();
    forked.stack_top().insert(
        &call,
        LLVMValue(Pointer(ConstantInt::Create(llvm::APInt(ptr_width, 0)))));
    queue->add_context(std::move(forked));
  }

  auto size_op = UnaryOp::CreateTruncOrZExt(Type::int_ty(ptr_width), size);
  auto alloc = ctx->heap.allocate(
      size_op,
      ConstantInt::Create(llvm::APInt(ptr_width, options.malloc_alignment)),
      AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0x00))),
      AllocationKind::Malloc, *ctx);

  ctx->stack_top().insert(
      &call, LLVMValue(Pointer(
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
  auto memptr = ctx->lookup(call.getArgOperand(0)).scalar().pointer();

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
    Context forked = ctx->fork_once();

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
  auto mem = ctx->lookup(call.getArgOperand(0)).scalar().pointer();
  auto size = ctx->lookup(call.getArgOperand(1)).scalar().expr();

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
    ctx->stack_top().insert(&call, LLVMValue(resolved[0]));
    return ExecutionResult::Continue;
  }

  for (const auto& ptr : resolved) {
    Context forked = ctx->fork_once();
    forked.stack_top().insert(&call, LLVMValue(ptr));
    queue->add_context(std::move(forked));
  }

  return ExecutionResult::Stop;
}

} // namespace caffeine
