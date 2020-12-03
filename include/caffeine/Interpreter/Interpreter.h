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
  ExecutionResult visitUDiv(llvm::BinaryOperator &op);
  // ExecutionResult visitSDiv(llvm::BinaryOperator &op);
  // ExecutionResult visitURem(llvm::BinaryOperator &op);
  // ExecutionResult visitSRem(llvm::BinaryOperator &op);
  // ExecutionResult visitShl(llvm::BinaryOperator &op);
  // ExecutionResult visitLShr(llvm::BinaryOperator &op);
  // ExecutionResult visitAShr(llvm::BinaryOperator &op);
  // ExecutionResult visitAnd(llvm::BinaryOperator &op);
  // ExecutionResult visitOr(llvm::BinaryOperator &op);
  // ExecutionResult visitXor(llvm::BinaryOperator &op);
  // ExecutionResult visitNot(llvm::BinaryOperator &op);

  // ExecutionResult visitTrunc(llvm::TruncInst &trunc);
  // ExecutionResult visitICmpInst(llvm::ICmpInst &icmp);

  // ExecutionResult visitSExtInst(llvm::SExtInst &sext);
  // ExecutionResult visitZExtInst(llvm::ZExtInst &zext);

  ExecutionResult visitPHINode(llvm::PHINode& node);
  ExecutionResult visitBranchInst(llvm::BranchInst& inst);
  ExecutionResult visitReturnInst(llvm::ReturnInst& inst);
  // ExecutionResult visitCallInst(llvm::CallInst &inst);
  // ExecutionResult visitSelectInst(llvm::SelectInst &inst);
};

} // namespace caffeine

#endif
