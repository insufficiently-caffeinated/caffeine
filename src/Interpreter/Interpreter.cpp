#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExprEval.h"
#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssert.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Interpreter/TransformBuilder.h"
#include "caffeine/Model/Value.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/LLVMFmt.h"
#include "caffeine/Support/Tracing.h"
#include "caffeine/Support/UnsupportedOperation.h"

#include <boost/range/adaptor/transformed.hpp>
#include <boost/range/combine.hpp>
#include <boost/range/iterator_range.hpp>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/IR/GetElementPtrTypeIterator.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <optional>

namespace caffeine {

template <ExecutionResult (Interpreter::*kFunc)(llvm::CallBase&)>
struct as_nonmember {
private:
  static ExecutionResult func_impl(Interpreter& interp, llvm::CallBase& inst) {
    return std::invoke(kFunc, interp, inst);
  }

public:
  static constexpr InterpreterFunction value = &func_impl;
};

template <ExecutionResult (Interpreter::*kFunc)(llvm::CallBase&)>
static constexpr InterpreterFunction as_nonmember_v =
    as_nonmember<kFunc>::value;

std::unordered_map<std::string_view, InterpreterFunction>&
Interpreter::extern_functions() {
  static std::unordered_map<std::string_view, InterpreterFunction>
      kExternFunctions = ([] {
        std::unordered_map<std::string_view, InterpreterFunction> funcs;
        auto reg = [&](std::string_view name, InterpreterFunction func) {
          funcs.insert({name, func});
        };

        reg("setjmp", as_nonmember_v<&Interpreter::visitSetjmp>);
        reg("_setjmp", as_nonmember_v<&Interpreter::visitSetjmp>);
        reg("longjmp", as_nonmember_v<&Interpreter::visitLongjmp>);

        return funcs;
      })();

  return kExternFunctions;
}

ExecutionResult::ExecutionResult(Status status) : status_(status) {}
ExecutionResult::ExecutionResult(llvm::SmallVector<Context, 2>&& contexts,
                                 Status status)
    : status_(status), contexts_(std::move(contexts)) {}

Interpreter::Interpreter(ExecutionPolicy* policy, ExecutionContextStore* store,
                         FailureLogger* logger, InterpreterContext* interp,
                         const std::shared_ptr<Solver>& solver,
                         const InterpreterOptions& options)
    : policy(policy), store(store), logger(logger), options(options),
      solver(solver), interp(interp) {
  ctx = &interp->context();
}

void Interpreter::logFailure(Context& ctx, const Assertion& assertion,
                             std::string_view message) {
  auto result = ctx.resolve(solver, assertion);
  if (result != SolverResult::SAT)
    return;

  logger->log_failure(result.model(), ctx, Failure(assertion, message));
  policy->on_path_complete(ctx, ExecutionPolicy::Fail, assertion);
}
void Interpreter::queueContext(Context&& ctx) {
  policy->on_path_forked(ctx);
  if (policy->should_queue_path(ctx)) {
    store->add_context(std::move(ctx));
  } else {
    policy->on_path_complete(ctx, ExecutionPolicy::Removed);
  }
}

Interpreter Interpreter::cloneWith(InterpreterContext* interp) {
  CAFFEINE_ASSERT(interp);

  Interpreter cloned = *this;
  cloned.interp = interp;
  cloned.ctx = &interp->context();
  return cloned;
}

void Interpreter::execute() {
  auto& frame_wrapper = ctx->stack_top();
  if (frame_wrapper.is_external()) {
    frame_wrapper.get_external()->step(*interp);
    return;
  }

  auto& frame = frame_wrapper.get_regular();

  CAFFEINE_ASSERT(frame.current != frame.current_block->end(),
                  "Instruction pointer ran off end of block.");

  llvm::Instruction& inst = *frame.current;
  auto traceblock = CAFFEINE_TRACE_SPAN(fmt::format(FMT_STRING("{}"), inst));
  traceblock.annotate("cat", "instruction");

  // Note: Need to increment the iterator before actually doing
  //       anything with the instruction since instructions can
  //       modify the current position (e.g. branch, call, etc.)
  ++frame.current;

  ExecutionResult res = visit(inst);

  if (traceblock.is_enabled() && !ctx->stack.empty()) {
    // Printing expressions can be potentially very expensive so we only do it
    // if expensive annotations are enabled.
    if (CAFFEINE_TRACING_EXPENSIVE_ANNOTATIONS) {
      auto& frame = ctx->stack_top().get_regular();
      auto it = frame.variables.find(&inst);
      if (it != frame.variables.end()) {
        traceblock.annotate("value", fmt::format("{}", it->second));
      }
    }
  }

  traceblock.close();

  // All new contexts were created via InterpreterContext::fork
  if (res.status() == ExecutionResult::Migrated) {
    return;
  }

  if (res.status() != ExecutionResult::Continue) {
    interp->kill();

    for (Context& ctx : res.contexts()) {
      if (policy->should_queue_path(ctx)) {
        interp->fork_existing(std::move(ctx));
      } else {
        policy->on_path_complete(ctx, ExecutionPolicy::Removed);
      }
    }
  }
}

ExecutionResult Interpreter::visitInstruction(llvm::Instruction& inst) {
  CAFFEINE_ABORT(
      fmt::format("Instruction '{}' not implemented!", inst.getOpcodeName()));
}

#define DEF_SIMPLE_OP(opname, optype)                                          \
  ExecutionResult Interpreter::visit##opname(llvm::optype& op) {               \
    interp->store(&op, ExprEvaluator(&interp->context()).evaluate(op));        \
    return ExecutionResult::Migrated;                                          \
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
DEF_SIMPLE_OP(ExtractValueInst, ExtractValueInst);
DEF_SIMPLE_OP(InsertValueInst, InsertValueInst);

ExecutionResult Interpreter::visitUDiv(llvm::BinaryOperator& op) {
  auto lhs = interp->load(op.getOperand(0));
  auto rhs = interp->load(op.getOperand(1));

  auto result = transform_exprs(
      [&](const auto& lhs, const auto& rhs) {
        interp->assert_or_fail(ICmpOp::CreateICmpNE(rhs, 0), "udiv by 0");
        return BinaryOp::CreateUDiv(lhs, rhs);
      },
      lhs, rhs);

  interp->store(&op, std::move(result));

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitSDiv(llvm::BinaryOperator& op) {
  auto lhs = interp->load(op.getOperand(0));
  auto rhs = interp->load(op.getOperand(1));

  auto result = transform_exprs(
      [&](const auto& lhs, const auto& rhs) {
        auto cmp1 = ICmpOp::CreateICmpEQ(rhs, 0);
        auto cmp2 = ICmpOp::CreateICmpEQ(
            lhs, ConstantInt::Create(
                     llvm::APInt::getSignedMinValue(lhs->type().bitwidth())));
        auto cmp3 = ICmpOp::CreateICmpEQ(rhs, -1);

        // lhs == 0 || (lhs == INT_MIN && rhs == -1)
        auto assertion = Assertion(
            BinaryOp::CreateOr(cmp1, BinaryOp::CreateAnd(cmp2, cmp3)));
        interp->assert_or_fail(!assertion, "sdiv fault (div by 0 or overflow)");

        return BinaryOp::CreateSDiv(lhs, rhs);
      },
      lhs, rhs);

  interp->store(&op, std::move(result));

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitSRem(llvm::BinaryOperator& op) {
  auto lhs = interp->load(op.getOperand(0));
  auto rhs = interp->load(op.getOperand(1));

  auto result = transform_exprs(
      [&](const auto& lhs, const auto& rhs) {
        auto cmp1 = ICmpOp::CreateICmpEQ(rhs, 0);
        auto cmp2 = ICmpOp::CreateICmpEQ(
            lhs, ConstantInt::Create(
                     llvm::APInt::getSignedMinValue(lhs->type().bitwidth())));
        auto cmp3 = ICmpOp::CreateICmpEQ(rhs, -1);

        // lhs == 0 || (lhs == INT_MIN && rhs == -1)
        auto assertion = Assertion(
            BinaryOp::CreateOr(cmp1, BinaryOp::CreateAnd(cmp2, cmp3)));
        interp->assert_or_fail(!assertion, "srem fault (div by 0 or overflow)");

        return BinaryOp::CreateSRem(lhs, rhs);
      },
      lhs, rhs);

  interp->store(&op, std::move(result));

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitURem(llvm::BinaryOperator& op) {
  auto lhs = interp->load(op.getOperand(0));
  auto rhs = interp->load(op.getOperand(1));

  auto result = transform_exprs(
      [&](const auto& lhs, const auto& rhs) {
        interp->assert_or_fail(ICmpOp::CreateICmpNE(rhs, 0),
                               "urem fault (div by 0)");
        return BinaryOp::CreateURem(lhs, rhs);
      },
      lhs, rhs);

  interp->store(&op, std::move(result));

  return ExecutionResult::Continue;
}

ExecutionResult Interpreter::visitPHINode(llvm::PHINode& node) {
  auto& frame = interp->context().stack_top().get_regular();

  // PHI nodes in the entry block is invalid.
  CAFFEINE_ASSERT(frame.prev_block != nullptr);

  auto value = interp->load(node.getIncomingValueForBlock(frame.prev_block));
  interp->store(&node, value);

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitBranchInst(llvm::BranchInst& inst) {
  if (!inst.isConditional()) {
    interp->jump_to(inst.getSuccessor(0));
    return ExecutionResult::Migrated;
  }

  auto assertion = Assertion(interp->load(inst.getCondition()).scalar().expr());
  auto is_t = interp->check(assertion);
  auto is_f = interp->check(!assertion);

  // Note: For the purposes of branching we consider unknown to be
  //       equivalent to sat. Maybe future branches will bring the
  //       equation back to being solvable.
  if (is_t != SolverResult::UNSAT) {
    auto fork = interp->fork();
    fork.add_assertion(assertion);
    fork.jump_to(inst.getSuccessor(0));
  }

  if (is_f != SolverResult::UNSAT) {
    auto fork = interp->fork();

    fork.add_assertion(!assertion);
    fork.jump_to(inst.getSuccessor(1));
  }

  interp->kill();

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitReturnInst(llvm::ReturnInst& inst) {
  if (inst.getNumOperands() != 0) {
    interp->function_return(interp->load(inst.getOperand(0)));
  } else {
    interp->function_return();
  }

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitSwitchInst(llvm::SwitchInst& inst) {
  auto cond = interp->load(inst.getCondition()).scalar().expr();
  llvm::SmallVector<Assertion, 16> assertions;

  assertions.reserve(inst.getNumCases());

  for (auto value : inst.cases()) {
    auto assertion = Assertion(ICmpOp::CreateICmpEQ(
        cond, ConstantInt::Create(value.getCaseValue()->getValue())));

    if (interp->check(assertion) == SolverResult::UNSAT)
      continue;
    assertions.push_back(!assertion);

    auto fork = interp->fork();
    fork.add_assertion(assertion);
    fork.jump_to(value.getCaseSuccessor());
  }

  for (auto& assertion : assertions) {
    interp->add_assertion(std::move(assertion));
  }

  if (interp->check() != SolverResult::UNSAT) {
    interp->jump_to(inst.getDefaultDest());
  } else {
    interp->kill();
  }

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitCallBase(llvm::CallBase& callBase) {
  auto func = callBase.getCalledFunction();
  if (!func)
    return visitIndirectCall(callBase);

  CAFFEINE_ASSERT(!func->isIntrinsic(),
                  fmt::format("bad function call '{}': intrinsic function "
                              "calls should be handled by visitIntrinsic",
                              func->getName().str()));

  // In case of an extern function
  if (func->empty()) {
    auto* prev_inst = &*ctx->stack_top().get_regular().current;
    auto invoke = llvm::dyn_cast<llvm::InvokeInst>(&callBase);

    auto res = visitExternFunc(callBase);

    // TODO: Get rid of this logic and shove it into visitExternFunc
    if (!invoke)
      return res;

    if (interp->context().stack_top().is_external()) {
      return res;
    }

    if (res.empty()) {
      if (&*ctx->stack_top().get_regular().current == prev_inst) {
        ctx->stack_top().set_result(std::nullopt, std::nullopt);
      }
    } else {
      for (auto& ctx_ : res.contexts()) {
        if (&*ctx_.stack_top().get_regular().current == prev_inst) {
          ctx->stack_top().set_result(std::nullopt, std::nullopt);
        }
      }
    }

    return res;
  }

  // In case of a normal function call
  auto frame_wrapper = StackFrame::RegularFrame(func);
  auto& callee = frame_wrapper.get_regular();
  for (auto [arg, val] : llvm::zip(func->args(), callBase.args())) {
    callee.insert(&arg, ctx->lookup(val.get()));
  }

  ctx->push(std::move(frame_wrapper));

  return ExecutionResult::Continue;
}
ExecutionResult Interpreter::visitCallInst(llvm::CallInst& call) {
  return visitCallBase(call);
}
ExecutionResult Interpreter::visitInvokeInst(llvm::InvokeInst& invoke) {
  return visitCallBase(invoke);
}
ExecutionResult Interpreter::visitIntrinsicInst(llvm::IntrinsicInst& intrin) {
  namespace Intrinsic = llvm::Intrinsic;

  // Note that some intrinsics are quickly filtered out here since they
  // have no effect on program behaviour and this way we don't need to
  // write a bunch of boilerplate to handle them.
  switch (intrin.getIntrinsicID()) {
  // These are just markers for when lifetimes are supposed to end.
  case Intrinsic::lifetime_start:
  case Intrinsic::lifetime_end:
  // These are for debug info, they have no run time behaviour.
  case Intrinsic::dbg_addr:
  case Intrinsic::dbg_declare:
  case Intrinsic::dbg_label:
  case Intrinsic::dbg_value:
    return ExecutionResult::Migrated;
  default:
    break;
  }

  auto func = interp->caffeine().intrinsic(intrin.getIntrinsicID());
  if (!func) {
    interp->fail(fmt::format("Intrinsic function '{}' is not supported",
                             intrin.getCalledFunction()->getName().str()));
    return ExecutionResult::Migrated;
  }

  llvm::SmallVector<LLVMValue, 4> args;
  args.reserve(intrin.getNumArgOperands());
  for (auto& arg : intrin.args())
    args.push_back(interp->load(arg.get()));

  func->call(*interp, args);

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitIndirectCall(llvm::CallBase& call) {
  CAFFEINE_ASSERT(
      call.isIndirectCall() || !call.getCalledFunction(),
      "visitIndirectCall called with a non-indirect call instruction");

  auto pointer = interp->load(call.getCalledOperand()).scalar().pointer();
  CAFFEINE_ASSERT(
      pointer.heap() == MemHeapMgr::FUNCTION_INDEX,
      "Indirect call instruction called with pointer of wrong type");

  auto resolved = interp->resolve_ptr(pointer, 1, "invalid function pointer");
  interp->kill();

  auto newcall = llvm::cast<llvm::CallBase>(call.clone());
  auto _guard = llvm::unique_value(newcall);

  for (auto& ptr : resolved) {
    auto fork = interp->fork();
    Allocation& alloc = fork.context().heaps.ptr_allocation(ptr);
    fork.add_assertion(ICmpOp::CreateICmpEQ(
        alloc.address(), pointer.value(fork.context().heaps)));

    newcall->setCalledFunction(
        llvm::cast<FunctionObject>(*alloc.data()).function());

    Interpreter interp = cloneWith(&fork);
    auto result = interp.visitCallBase(*newcall);

    switch (result.status()) {
    case ExecutionResult::Migrated:
    case ExecutionResult::Continue:
      break;
    default:
      fork.kill();

      for (Context& ctx : result.contexts()) {
        if (policy->should_queue_path(ctx)) {
          fork.fork_existing(std::move(ctx));
        } else {
          policy->on_path_complete(ctx, ExecutionPolicy::Removed);
        }
      }
    }
  }

  return ExecutionResult::Migrated;
}

ExecutionResult Interpreter::visitLoadInst(llvm::LoadInst& inst) {
  // Note: This treats atomic loads as regular ones since we only model
  //       single-threaded code. If that ever changes then this will need to be
  //       revisited.

  auto operand = inst.getOperand(0);

  auto ops = TransformBuilder();
  auto resolved = ops.resolve(operand, inst.getType());
  auto loaded = ops.read(resolved, inst.getType());

  ops.assign(&inst, loaded);

  return ops.execute(this);
}
ExecutionResult Interpreter::visitStoreInst(llvm::StoreInst& inst) {
  const llvm::DataLayout& layout = inst.getModule()->getDataLayout();

  auto unresolved = interp->load(inst.getPointerOperand()).scalar().pointer();
  auto value = interp->load(inst.getValueOperand());

  auto resolved = interp->resolve_ptr(
      unresolved, layout.getTypeStoreSize(inst.getValueOperand()->getType()),
      "invalid pointer store");

  interp->kill();
  for (const Pointer& ptr : resolved) {
    auto fork = interp->fork();
    fork.add_assertion(
        ICmpOp::CreateICmpEQ(ptr.value(interp->context().heaps),
                             unresolved.value(interp->context().heaps)));

    Allocation* alloc = fork.ptr_allocation(ptr);
    CAFFEINE_ASSERT(alloc);
    alloc->write(ptr.offset(), inst.getValueOperand()->getType(), value,
                 fork.context().heaps, layout);
  }

  return ExecutionResult::Migrated;
}
ExecutionResult Interpreter::visitAllocaInst(llvm::AllocaInst& inst) {
  const llvm::DataLayout& layout = interp->getModule()->getDataLayout();

  uint64_t size =
      layout.getTypeAllocSize(inst.getAllocatedType()).getFixedSize();
  uint64_t align = std::max<uint64_t>(inst.getAlignment(), 1);

  unsigned address_space = inst.getType()->getPointerAddressSpace();
  unsigned ptr_width = layout.getPointerTypeSizeInBits(inst.getType());

  auto pointer = interp->allocate_repeated(
      ConstantInt::Create(llvm::APInt(ptr_width, size)),
      ConstantInt::Create(llvm::APInt(ptr_width, align)),
      ConstantInt::Create(llvm::APInt(8, 0xDD)), address_space,
      AllocationKind::Alloca, AllocationPermissions::ReadWrite);
  interp->store(&inst, LLVMValue(pointer));

  return ExecutionResult::Migrated;
}

ExecutionResult Interpreter::visitMemCpyInst(llvm::MemCpyInst&) {
  CAFFEINE_ABORT("llvm.memcpy is not implemented natively within the caffeine "
                 "interpreter. Run gen-builtins over the input bitcode file "
                 "first to generate definitions that caffeine can execute.");
}
ExecutionResult Interpreter::visitMemMoveInst(llvm::MemMoveInst&) {
  CAFFEINE_ABORT("llvm.memmove is not implemented natively within the caffeine "
                 "interpreter. Run gen-builtins over the input bitcode file "
                 "first to generate definitions that caffeine can execute.");
}
ExecutionResult Interpreter::visitMemSetInst(llvm::MemSetInst&) {
  CAFFEINE_ABORT("llvm.memset is not implemented natively within the caffeine "
                 "interpreter. Run gen-builtins over the input bitcode file "
                 "first to generate definitions that caffeine can execute.");
}

ExecutionResult Interpreter::visitDbgInfoIntrinsic(llvm::DbgInfoIntrinsic&) {
  // Ignore debug info since it doesn't affect semantics.
  return ExecutionResult::Continue;
}

/***************************************************
 * External function                               *
 ***************************************************/

ExecutionResult Interpreter::visitExternFunc(llvm::CallBase& call) {
  auto func = call.getCalledFunction();
  auto name = func->getName();

  CAFFEINE_ASSERT(func->empty(),
                  "visitExternFunc called with non-external function");

  if (name.startswith("caffeine.resolve."))
    name = "caffeine_builtin_resolve";

  auto extern_func =
      interp->caffeine().function(std::string_view(name.data(), name.size()));
  if (extern_func) {
    llvm::SmallVector<LLVMValue, 4> args;
    args.reserve(call.getNumArgOperands());
    for (unsigned int i = 0; i < call.getNumArgOperands(); i++) {
      args.push_back(interp->load(call.getArgOperand(i)));
    }

    extern_func->call(*interp, args);
    return ExecutionResult::Migrated;
  }

  auto it = extern_functions().find(name);
  if (it != extern_functions().end())
    return it->second(*this, call);

  CAFFEINE_ABORT(
      fmt::format("external function '{}' not implemented", name.str()));
}

std::optional<std::string> readSymbolicName(std::shared_ptr<Solver> solver,
                                            Context* ctx, const Pointer& ptr) {
  const auto& alloc = ctx->heaps[ptr.heap()][ptr.alloc()];

  auto result = ctx->resolve(solver);
  if (result != SolverResult::SAT) {
    CAFFEINE_UNSUPPORTED("Unable to resolve symbolic name");
    return std::nullopt;
  }

  uint64_t offset = result.evaluate(*ptr.offset()).apint().getLimitedValue();
  uint64_t size = result.evaluate(*alloc.size()).apint().getLimitedValue();
  auto array = std::move(result.evaluate(*alloc.data()).array());

  std::string name;
  name.reserve(size - offset);

  const char* values = array.data();
  const char* start = values + offset;
  const char* end = (const char*)std::memchr(start, 0, size - offset);
  if (!end) {
    CAFFEINE_UNSUPPORTED("Symbolic name was not null-terminated");
    return std::nullopt;
  }

  return std::string(start, end);
}

} // namespace caffeine
