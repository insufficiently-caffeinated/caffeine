#ifndef CAFFEINE_INTERP_INTERPRETER_H
#define CAFFEINE_INTERP_INTERPRETER_H

#include <memory>

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/Options.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/InstVisitor.h>

namespace caffeine {

class ExecutionPolicy;
class ExecutionContextStore;

class ExecutionResult {
public:
  enum Status { Continue, Dead, Stop };
  using ContextVec = llvm::SmallVector<Context, 2>;

  ExecutionResult(Status status);
  ExecutionResult(ContextVec&& contexts);

  Status status() const {
    return status_;
  }

  llvm::SmallVectorImpl<Context>& contexts() {
    return contexts_;
  }
  const llvm::SmallVectorImpl<Context>& contexts() const {
    return contexts_;
  }

  bool empty() const {
    return contexts_.empty();
  }

private:
  Status status_;
  ContextVec contexts_;
};

class Interpreter : public llvm::InstVisitor<Interpreter, ExecutionResult> {
private:
  ExecutionPolicy* policy;
  ExecutionContextStore* store;

  Context* ctx;
  FailureLogger* logger;
  InterpreterOptions options;
  std::shared_ptr<Solver> solver;

public:
  /**
   * The interpreter constructor needs an executor and context as well as a way
   * to log assertion failures.
   */
  Interpreter(Context* ctx, ExecutionPolicy* policy,
              ExecutionContextStore* store, FailureLogger* logger,
              const std::shared_ptr<Solver>& solver,
              const InterpreterOptions& options = InterpreterOptions());

  void execute();

  ExecutionResult visitInstruction(llvm::Instruction& inst);

  ExecutionResult visitBinaryOperator(llvm::BinaryOperator& op);
  ExecutionResult visitUnaryOperator(llvm::UnaryOperator& op);
  ExecutionResult visitCastInst(llvm::CastInst& op);
  ExecutionResult visitCmpInst(llvm::CmpInst& op);

  ExecutionResult visitUDiv(llvm::BinaryOperator& op);
  ExecutionResult visitSDiv(llvm::BinaryOperator& op);
  ExecutionResult visitURem(llvm::BinaryOperator& op);
  ExecutionResult visitSRem(llvm::BinaryOperator& op);

  ExecutionResult visitPHINode(llvm::PHINode& node);
  ExecutionResult visitBranchInst(llvm::BranchInst& inst);
  ExecutionResult visitReturnInst(llvm::ReturnInst& inst);
  ExecutionResult visitSwitchInst(llvm::SwitchInst& inst);
  ExecutionResult visitCallInst(llvm::CallInst& inst);
  ExecutionResult visitSelectInst(llvm::SelectInst& inst);
  ExecutionResult visitIntrinsicInst(llvm::IntrinsicInst& inst);
  ExecutionResult visitIndirectCall(llvm::CallInst& inst);

  ExecutionResult visitGetElementPtrInst(llvm::GetElementPtrInst& inst);
  ExecutionResult visitLoadInst(llvm::LoadInst& inst);
  ExecutionResult visitStoreInst(llvm::StoreInst& inst);

  ExecutionResult visitInsertElementInst(llvm::InsertElementInst& inst);
  ExecutionResult visitExtractElementInst(llvm::ExtractElementInst& inst);
  ExecutionResult visitShuffleVectorInst(llvm::ShuffleVectorInst& inst);
  ExecutionResult visitAllocaInst(llvm::AllocaInst& inst);
  ExecutionResult visitExtractValueInst(llvm::ExtractValueInst& inst);
  ExecutionResult visitInsertValueInst(llvm::InsertValueInst& inst);

  ExecutionResult visitMemCpyInst(llvm::MemCpyInst& memcpy);
  ExecutionResult visitMemMoveInst(llvm::MemMoveInst& memmove);
  ExecutionResult visitMemSetInst(llvm::MemSetInst& memset);

  ExecutionResult visitDbgInfoIntrinsic(llvm::DbgInfoIntrinsic&);

  ExecutionResult visitUMulWithOverflowIntrinsic(llvm::IntrinsicInst& inst);
  ExecutionResult visitSMulWithOverflowIntrinsic(llvm::IntrinsicInst& inst);

private:
  void logFailure(Context& ctx, const Assertion& assertion,
                  std::string_view message = "");
  void queueContext(Context&& ctx);
  Interpreter cloneWith(Context* ctx);

private:
  ExecutionResult visitExternFunc(llvm::CallInst& inst);

  ExecutionResult visitAssume(llvm::CallInst& inst);
  ExecutionResult visitAssert(llvm::CallInst& inst);
  ExecutionResult visitSymbolicAlloca(llvm::CallInst& inst);

  ExecutionResult visitMalloc(llvm::CallInst& inst);
  ExecutionResult visitCalloc(llvm::CallInst& inst);
  ExecutionResult visitFree(llvm::CallInst& inst);

  ExecutionResult visitBuiltinResolve(llvm::CallInst& inst);

  friend class TransformBuilder;
};

} // namespace caffeine

#endif
