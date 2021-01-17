#ifndef CAFFEINE_INTERP_INTERPRETER_H
#define CAFFEINE_INTERP_INTERPRETER_H

#include <memory>

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/InstVisitor.h>

namespace caffeine {

enum class ExecutionResult { Continue, Stop };

class Interpreter : public llvm::InstVisitor<Interpreter, ExecutionResult> {
private:
  Context* ctx;
  Executor* queue;
  FailureLogger* logger;

public:
  /**
   * The interpreter constructor needs an executor and context as well as a way
   * to log assertion failures.
   */
  Interpreter(Executor* queue, Context* ctx, FailureLogger* logger);

  void execute();

  ExecutionResult visitInstruction(llvm::Instruction& inst);

  ExecutionResult visitAdd(llvm::BinaryOperator& op);
  ExecutionResult visitSub(llvm::BinaryOperator& op);
  ExecutionResult visitMul(llvm::BinaryOperator& op);
  ExecutionResult visitUDiv(llvm::BinaryOperator& op);
  ExecutionResult visitSDiv(llvm::BinaryOperator& op);
  ExecutionResult visitURem(llvm::BinaryOperator& op);
  ExecutionResult visitSRem(llvm::BinaryOperator& op);

  ExecutionResult visitShl(llvm::BinaryOperator& op);
  ExecutionResult visitLShr(llvm::BinaryOperator& op);
  ExecutionResult visitAShr(llvm::BinaryOperator& op);
  ExecutionResult visitAnd(llvm::BinaryOperator& op);
  ExecutionResult visitOr(llvm::BinaryOperator& op);
  ExecutionResult visitXor(llvm::BinaryOperator& op);
  ExecutionResult visitNot(llvm::BinaryOperator& op);

  ExecutionResult visitFAdd(llvm::BinaryOperator& op);
  ExecutionResult visitFSub(llvm::BinaryOperator& op);
  ExecutionResult visitFMul(llvm::BinaryOperator& op);
  ExecutionResult visitFDiv(llvm::BinaryOperator& op);

  ExecutionResult visitICmpInst(llvm::ICmpInst& icmp);
  ExecutionResult visitFCmpInst(llvm::FCmpInst& fcmp);

  ExecutionResult visitTrunc(llvm::TruncInst& trunc);

  ExecutionResult visitSExt(llvm::SExtInst& sext);
  ExecutionResult visitZExt(llvm::ZExtInst& zext);

  ExecutionResult visitPHINode(llvm::PHINode& node);
  ExecutionResult visitBranchInst(llvm::BranchInst& inst);
  ExecutionResult visitReturnInst(llvm::ReturnInst& inst);
  ExecutionResult visitCallInst(llvm::CallInst& inst);
  ExecutionResult visitSelectInst(llvm::SelectInst& inst);

  ExecutionResult visitGetElementPtrInst(llvm::GetElementPtrInst& inst);
  ExecutionResult visitLoadInst(llvm::LoadInst& inst);
  ExecutionResult visitStoreInst(llvm::StoreInst& inst);

  ExecutionResult visitInsertElementInst(llvm::InsertElementInst& inst);
  ExecutionResult visitExtractElementInst(llvm::ExtractElementInst& inst);
  ExecutionResult visitShuffleVectorInst(llvm::ShuffleVectorInst& inst);

private:
  ExecutionResult visitExternFunc(llvm::CallInst& inst);

  ExecutionResult visitAssume(llvm::CallInst& inst);
  ExecutionResult visitAssert(llvm::CallInst& inst);
};

} // namespace caffeine

#endif
