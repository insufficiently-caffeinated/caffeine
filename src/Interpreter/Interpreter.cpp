#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExprEval.h"
#include "caffeine/Interpreter/ExternalFuncs/CaffeineAssert.h"
#include "caffeine/Interpreter/ExternalFuncs/ChainCall.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/StackFrame.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Model/Value.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/Coverage.h"
#include "caffeine/Support/LLVMFmt.h"
#include "caffeine/Support/Tracing.h"
#include "caffeine/Support/UnsupportedOperation.h"

#include <boost/range/adaptor/transformed.hpp>
#include <boost/range/combine.hpp>
#include <boost/range/iterator_range.hpp>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/GetElementPtrTypeIterator.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <optional>

namespace caffeine {

Interpreter::Interpreter(InterpreterContext* interp) : interp(interp) {}

void Interpreter::execute() {
  if (!interp->context().global_ctors_ran) {
    visitGlobalCtors();
    interp->context().global_ctors_ran = true;
  }

  auto& frame_wrapper = interp->context().stack_top();
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

  visit(inst);

  if (traceblock.is_enabled() && !interp->context().stack.empty()) {
    // Printing expressions can be potentially very expensive so we only do it
    // if expensive annotations are enabled.
    if (CAFFEINE_TRACING_EXPENSIVE_ANNOTATIONS) {
      if (auto variable = interp->lookup(&inst))
        traceblock.annotate("value", fmt::format("{}", *variable));
    }
  }

  traceblock.close();
}

void Interpreter::visit(llvm::Instruction& inst) {
  if (interp->caffeine().coverage()) {
    getInstLine(inst);
  }
  llvm::InstVisitor<Interpreter, void>::visit(inst);
}

void Interpreter::visitInstruction(llvm::Instruction& inst) {
  CAFFEINE_ABORT(
      fmt::format("Instruction '{}' not implemented!", inst.getOpcodeName()));
}

#define DEF_SIMPLE_OP(opname, optype)                                          \
  void Interpreter::visit##opname(llvm::optype& op) {                          \
    interp->store(&op, ExprEvaluator(interp).evaluate(op));                    \
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

void Interpreter::visitUDiv(llvm::BinaryOperator& op) {
  auto lhs = interp->load(op.getOperand(0));
  auto rhs = interp->load(op.getOperand(1));

  auto result = transform_exprs(
      [&](const auto& lhs, const auto& rhs) {
        interp->assert_or_fail(ICmpOp::CreateICmpNE(rhs, 0), "udiv by 0");
        return BinaryOp::CreateUDiv(lhs, rhs);
      },
      lhs, rhs);

  interp->store(&op, std::move(result));
}
void Interpreter::visitSDiv(llvm::BinaryOperator& op) {
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
}
void Interpreter::visitSRem(llvm::BinaryOperator& op) {
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
}
void Interpreter::visitURem(llvm::BinaryOperator& op) {
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
}

void Interpreter::visitPHINode(llvm::PHINode& node) {
  auto& frame = interp->context().stack_top().get_regular();

  // PHI nodes in the entry block is invalid.
  CAFFEINE_ASSERT(frame.prev_block != nullptr);

  auto value = interp->load(node.getIncomingValueForBlock(frame.prev_block));
  interp->store(&node, value);
}
void Interpreter::visitBranchInst(llvm::BranchInst& inst) {
  if (!inst.isConditional()) {
    interp->jump_to(inst.getSuccessor(0));
    return;
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
}
void Interpreter::visitReturnInst(llvm::ReturnInst& inst) {
  if (inst.getNumOperands() != 0) {
    interp->function_return(interp->load(inst.getOperand(0)));
  } else {
    interp->function_return();
  }
}
void Interpreter::visitSwitchInst(llvm::SwitchInst& inst) {
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
}
void Interpreter::visitCallBase(llvm::CallBase& callBase) {
  auto func = callBase.getCalledFunction();
  if (!func)
    return visitIndirectCall(callBase);

  CAFFEINE_ASSERT(!func->isIntrinsic(),
                  fmt::format("bad function call '{}': intrinsic function "
                              "calls should be handled by visitIntrinsic",
                              func->getName().str()));

  // In case of an extern function
  if (func->empty()) {
    return visitExternFunc(callBase);
  }

  std::vector<LLVMValue> args;
  args.reserve(callBase.arg_size());
  for (auto& arg : callBase.args()) {
    args.push_back(interp->load(arg.get()));
  }
  interp->call_function(func, args);
}
void Interpreter::visitCallInst(llvm::CallInst& call) {
  return visitCallBase(call);
}
void Interpreter::visitInvokeInst(llvm::InvokeInst& invoke) {
  return visitCallBase(invoke);
}
void Interpreter::visitResumeInst(llvm::ResumeInst& resume) {
  llvm::Function* caffeine_resume_func =
      interp->getModule()->getFunction("caffeine_resume_func");
  CAFFEINE_ASSERT(caffeine_resume_func, "caffeine_resume_func is not present");
  std::vector<LLVMValue> args;
  llvm::Value* arg = resume.getValue();

  args.push_back(interp->load(arg).aggregate().front());

  interp->call_function(caffeine_resume_func, args);
}
void Interpreter::visitIntrinsicInst(llvm::IntrinsicInst& intrin) {
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
    return;
  default:
    break;
  }

  auto func = interp->caffeine().intrinsic(intrin.getIntrinsicID());
  if (!func) {
    interp->fail(fmt::format("Intrinsic function '{}' is not supported",
                             intrin.getCalledFunction()->getName().str()));
    return;
  }

  llvm::SmallVector<LLVMValue, 4> args;
  args.reserve(intrin.getNumArgOperands());
  for (auto& arg : intrin.args())
    args.push_back(interp->load(arg.get()));

  func->call(intrin.getCalledFunction(), *interp, args);
}
void Interpreter::visitIndirectCall(llvm::CallBase& call) {
  CAFFEINE_ASSERT(
      call.isIndirectCall() || !call.getCalledFunction(),
      "visitIndirectCall called with a non-indirect call instruction");

  auto is_undef = llvm::dyn_cast<llvm::UndefValue>(call.getCalledOperand());
  CAFFEINE_ASSERT(!is_undef, "cannot indirect call an undef function");

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

    Interpreter interp{&fork};
    interp.visitCallBase(*newcall);
  }
}

void Interpreter::visitLoadInst(llvm::LoadInst& inst) {
  // Note: This treats atomic loads as regular ones since we only model
  //       single-threaded code. If that ever changes then this will need to be
  //       revisited.

  auto unresolved = interp->load(inst.getOperand(0)).scalar().pointer();
  auto resolved = interp->resolve_ptr(unresolved, inst.getType(),
                                      "invalid pointer read during load");
  interp->kill();

  for (const Pointer& ptr : resolved) {
    auto fork = interp->fork();
    fork.add_assertion(fork.createICmpEQ(unresolved, ptr));

    fork.store(&inst, fork.mem_read(ptr, inst.getType()));
  }
}
void Interpreter::visitStoreInst(llvm::StoreInst& inst) {
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
    try {
      alloc->write(ptr.offset(), inst.getValueOperand()->getType(), value,
                   fork.context().heaps, layout);
    } catch (AllocationException& ex) { fork.fail(ex.what()); }
  }
}
void Interpreter::visitAllocaInst(llvm::AllocaInst& inst) {
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
}

void Interpreter::visitMemCpyInst(llvm::MemCpyInst&) {
  CAFFEINE_ABORT("llvm.memcpy is not implemented natively within the caffeine "
                 "interpreter. Run gen-builtins over the input bitcode file "
                 "first to generate definitions that caffeine can execute.");
}
void Interpreter::visitMemMoveInst(llvm::MemMoveInst&) {
  CAFFEINE_ABORT("llvm.memmove is not implemented natively within the caffeine "
                 "interpreter. Run gen-builtins over the input bitcode file "
                 "first to generate definitions that caffeine can execute.");
}

void Interpreter::visitDbgInfoIntrinsic(llvm::DbgInfoIntrinsic&) {
  // Ignore debug info since it doesn't affect semantics.
}

/***************************************************
 * External function                               *
 ***************************************************/

void Interpreter::visitExternFunc(llvm::CallBase& call) {
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

    extern_func->call(call.getCalledFunction(), *interp, args);
    return;
  }

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

  uint64_t offset =
      result.evaluate(*ptr.offset(), ctx->egraph).apint().getLimitedValue();
  uint64_t size =
      result.evaluate(*alloc.size(), ctx->egraph).apint().getLimitedValue();
  auto array = std::move(result.evaluate(*alloc.data(), ctx->egraph).array());

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

void Interpreter::getInstLine(llvm::Instruction& inst) {
  if (const auto& loc = inst.getDebugLoc()) {
    unsigned line = loc.getLine();
    auto* dfile = static_cast<llvm::DIScope*>(loc.getScope());
    std::string file = dfile->getFilename().str();
    interp->caffeine().coverage()->touch(file, line);
  }
}

void Interpreter::visitGlobalCtors() {
  auto gcs = interp->context().mod->getGlobalVariable("llvm.global_ctors");
  if (!gcs) {
    return;
  }

  if (gcs->getInitializer()->isNullValue()) {
    return;
  }

  auto gcs_ca = llvm::dyn_cast<llvm::ConstantArray>(gcs->getInitializer());
  CAFFEINE_ASSERT(gcs_ca, "@llvm.global_ctors must be a constant array");

  uint64_t numEle = gcs_ca->getType()->getNumElements();
  std::vector<std::pair<uint64_t, llvm::Function*>> ctors;

  for (uint64_t i = 0; i < numEle; i++) {
    auto ele = gcs_ca->getAggregateElement(i);
    CAFFEINE_ASSERT(ele, "element must be not null");
    unsigned int j = 0;
    auto ind = ele->getAggregateElement(j);
    ele = ele->getAggregateElement(j + 1);

    auto ind_val = llvm::dyn_cast<llvm::ConstantInt>(ind);
    CAFFEINE_ASSERT(ind_val, "key must be a constant int");

    llvm::Function* fp_val = llvm::dyn_cast<llvm::Function>(ele);
    CAFFEINE_ASSERT(fp_val, "value must be a function pointer");

    ctors.push_back(
        std::make_pair(ind_val->getValue().getLimitedValue(), fp_val));
  }

  std::sort(ctors.begin(), ctors.end());
  std::vector<llvm::Function*> to_call;
  for (auto& it : ctors) {
    to_call.push_back(it.second);
  }

  interp->call_external_function(
      std::make_unique<ChainCall>(std::move(to_call)));
}

} // namespace caffeine
