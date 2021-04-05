#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/ExprEval.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Interpreter/Value.h"
#include "caffeine/Solver/CanonicalizingSolver.h"
#include "caffeine/Solver/SequenceSolver.h"
#include "caffeine/Solver/SimplifyingSolver.h"
#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/Support/Assert.h"

#include <boost/range/adaptor/transformed.hpp>
#include <boost/range/combine.hpp>
#include <boost/range/iterator_range.hpp>
#include <fmt/format.h>
#include <llvm/IR/GetElementPtrTypeIterator.h>
#include <llvm/Support/raw_ostream.h>
#include <z3++.h>

#include <iostream>
#include <optional>

namespace caffeine {

ExecutionResult::ExecutionResult(Status status) : status_(status) {}
ExecutionResult::ExecutionResult(llvm::SmallVector<Context, 2>&& contexts)
    : status_(Dead), contexts_(std::move(contexts)) {}

Interpreter::Interpreter(Context* ctx, ExecutionPolicy* policy,
                         ExecutionContextStore* store, FailureLogger* logger,
                         const InterpreterOptions& options)
    : policy(policy), store(store), ctx(ctx), logger(logger), options(options) {
  solver = caffeine::make_sequence_solver(caffeine::SimplifyingSolver(),
                                          caffeine::CanonicalizingSolver(),
                                          caffeine::Z3Solver());
}

void Interpreter::logFailure(Context& ctx, const Assertion& assertion,
                             std::string_view message) {
  auto model = ctx.resolve(solver, assertion);
  if (model->result() != SolverResult::SAT)
    return;

  logger->log_failure(*model, ctx, Failure(assertion, message));
  policy->on_path_complete(ctx, ExecutionPolicy::Fail);
}
void Interpreter::queueContext(Context&& ctx) {
  policy->on_path_forked(ctx);
  if (policy->should_queue_path(ctx)) {
    store->add_context(std::move(ctx));
  } else {
    policy->on_path_complete(ctx, ExecutionPolicy::Removed);
  }
}

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
      auto& ctxs = res.contexts();

      auto it =
          std::remove_if(ctxs.begin(), ctxs.end(), [&](const Context& ctx) {
            bool prune = !policy->should_queue_path(ctx);
            if (prune)
              policy->on_path_complete(ctx, ExecutionPolicy::Removed);
            return prune;
          });
      ctxs.erase(it, ctxs.end());

      store->add_context_multi(ctxs);
      return;
    }

    if (res.status() != ExecutionResult::Continue) {
      switch (res.status()) {
      case ExecutionResult::Dead:
        policy->on_path_complete(*ctx, ExecutionPolicy::Dead);
        return;
      case ExecutionResult::Stop:
        policy->on_path_complete(*ctx, ExecutionPolicy::Success);
        return;

      case ExecutionResult::Continue:
        CAFFEINE_UNREACHABLE();
      }

      CAFFEINE_UNREACHABLE(
          fmt::format(FMT_STRING("Unexpected ExecutionResult value: {}"),
                      magic_enum::enum_name(res.status())));
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
        if (ctx->check(solver, !assertion) == SolverResult::SAT)
          logFailure(*ctx, !assertion, "udiv by 0");
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
        if (ctx->check(solver, assertion) == SolverResult::SAT)
          logFailure(*ctx, assertion, "sdiv fault (div by 0 or overflow)");
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
        if (ctx->check(solver, assertion) == SolverResult::SAT)
          logFailure(*ctx, assertion, "srem fault (div by 0 or overflow)");
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
        if (ctx->check(solver, !assertion) == SolverResult::SAT)
          logFailure(*ctx, !assertion, "urem fault (div by 0)");
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
  auto is_t = ctx->check(solver, assertion);
  auto is_f = ctx->check(solver, !assertion);

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
  for (auto [arg, val] : llvm::zip(func->args(), call.args())) {
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
  if (ctx->check(solver, !assertion) == SolverResult::SAT) {
    logFailure(*ctx, !assertion, "invalid pointer load");

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Dead;
  }

  auto resolved = ctx->heap.resolve(solver, pointer, *ctx);
  auto forks = ctx->fork(resolved.size());

  for (auto [fork, ptr] : llvm::zip(forks, resolved)) {
    Allocation& alloc = fork.heap[ptr.alloc()];
    fork.add(alloc.check_inbounds(ptr.offset(),
                                  layout.getTypeStoreSize(inst.getType())));

    auto value = alloc.read(ptr.offset(), inst.getType(), layout);
    fork.stack_top().insert(&inst, value);
  }

  return forks;
}
ExecutionResult Interpreter::visitStoreInst(llvm::StoreInst& inst) {
  auto value = ctx->lookup(inst.getOperand(0));
  auto dest = ctx->lookup(inst.getOperand(1));
  auto op_ty = inst.getOperand(0)->getType();

  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();
  const Pointer& pointer = dest.scalar().pointer();

  auto assertion = ctx->heap.check_valid(
      pointer, layout.getTypeStoreSize(inst.getOperand(0)->getType()));
  if (ctx->check(solver, !assertion) == SolverResult::SAT) {
    logFailure(*ctx, !assertion, "invalid pointer store");

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Dead;
  }

  auto resolved = ctx->heap.resolve(solver, pointer, *ctx);
  auto forks = ctx->fork(resolved.size());

  for (auto [fork, ptr] : llvm::zip(forks, resolved)) {
    Allocation& alloc = fork.heap[ptr.alloc()];
    fork.add(
        alloc.check_inbounds(ptr.offset(), layout.getTypeStoreSize(op_ty)));
    alloc.write(ptr.offset(), op_ty, value, fork.heap, layout);
  }

  return forks;
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
ExecutionResult Interpreter::visitMemSetInst(llvm::MemSetInst&) {
  CAFFEINE_ABORT("llvm.memset is not implemented natively within the caffeine "
                 "interpreter. Run gen-builtins over the input bitcode file "
                 "first to generate definitions that caffeine can execute.");
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

  if (name == "caffeine_builtin_resolve" ||
      name.startswith("caffeine.resolve."))
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

  if (ctx->check(solver, !assertion))
    logFailure(*ctx, !assertion, "assertion failure");

  ctx->add(assertion);

  return ExecutionResult::Continue;
}

std::optional<std::string> readSymbolicName(std::shared_ptr<Solver> solver,
                                            Context* ctx, const Pointer& ptr) {
  const auto& alloc = ctx->heap[ptr.alloc()];

  auto model = ctx->resolve(solver);
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

  auto resolved = ctx->heap.resolve(solver, name, *ctx);

  CAFFEINE_ASSERT(!resolved.empty(),
                  "caffeine_make_symbolic called with invalid name pointer");
  CAFFEINE_ASSERT(resolved.size() == 1,
                  "caffeine_make_symbolic called with symbolic name");

  auto alloc_name = readSymbolicName(solver, ctx, resolved.front());
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
    queueContext(std::move(forked));
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
    queueContext(std::move(forked));
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
  if (ctx->check(solver, !is_valid_ptr) == SolverResult::SAT) {
    logFailure(*ctx, !is_valid_ptr, "free called with an invalid pointer");

    return ExecutionResult::Dead;
  }

  auto resolved = heap.resolve(solver, memptr, *ctx);

  auto err_start =
      std::remove_if(resolved.begin(), resolved.end(), [&](const Pointer& ptr) {
        const Allocation& alloc = ctx->heap[ptr.alloc()];

        auto assertion = Assertion(ICmpOp::CreateICmp(
            ICmpOpcode::EQ, ptr.value(ctx->heap), alloc.address()));
        if (ctx->check(solver, !assertion) == SolverResult::SAT) {
          logFailure(*ctx, Assertion::constant(true),
                     "free called with a pointer not allocated by malloc");

          return true;
        }

        return false;
      });
  resolved.erase(err_start, resolved.end());

  auto forks = ctx->fork(resolved.size());

  for (auto [fork, ptr] : llvm::zip(forks, resolved)) {
    Allocation& alloc = fork.heap[ptr.alloc()];
    fork.add(ICmpOp::CreateICmp(ICmpOpcode::EQ, ptr.value(fork.heap),
                                alloc.address()));
    fork.heap.deallocate(ptr.alloc());
  }

  return forks;
}

ExecutionResult Interpreter::visitBuiltinResolve(llvm::CallInst& call) {
  const llvm::DataLayout& layout = call.getModule()->getDataLayout();

  auto mem = ctx->lookup(call.getArgOperand(0)).scalar().pointer();
  auto size = UnaryOp::CreateTruncOrZExt(
      Type::int_ty(layout.getPointerSizeInBits()),
      ctx->lookup(call.getArgOperand(1)).scalar().expr());

  auto assertion = ctx->heap.check_valid(mem, size);
  if (ctx->check(solver, !assertion) == SolverResult::SAT) {
    logFailure(*ctx, !assertion, "invalid pointer");

    // If we're getting an out-of-bounds access then there's a pretty good
    // chance that we'll find that we can overlap with just about any other
    // allocation. This isn't likely to produce useful bugs so we'll kill the
    // context here.
    return ExecutionResult::Dead;
  }

  auto resolved = ctx->heap.resolve(solver, mem, *ctx);

  if (resolved.size() == 1) {
    ctx->stack_top().insert(&call, LLVMValue(resolved[0]));
    return ExecutionResult::Continue;
  }

  auto forks = ctx->fork(resolved.size());
  for (auto [fork, ptr] : llvm::zip(forks, resolved)) {
    fork.stack_top().insert(&call, LLVMValue(ptr));
  }

  return forks;
}

} // namespace caffeine
