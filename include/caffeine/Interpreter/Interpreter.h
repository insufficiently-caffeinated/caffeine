#ifndef CAFFEINE_INTERP_INTERPRETER_H
#define CAFFEINE_INTERP_INTERPRETER_H

#include <functional>
#include <iostream>
#include <memory>

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Interpreter/Options.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/Macros.h"

#include <llvm/ADT/StringRef.h>
#include <llvm/IR/InstVisitor.h>

namespace caffeine {

class Interpreter : public llvm::InstVisitor<Interpreter, void> {
private:
  InterpreterContext* interp;

public:
  /**
   * The interpreter constructor needs an executor and context as well as a way
   * to log assertion failures.
   */
  explicit Interpreter(InterpreterContext* interp);

  void execute();

  void visit(llvm::Instruction& inst);

  void visitInstruction(llvm::Instruction& inst);

  void visitBinaryOperator(llvm::BinaryOperator& op);
  void visitUnaryOperator(llvm::UnaryOperator& op);
  void visitCastInst(llvm::CastInst& op);
  void visitCmpInst(llvm::CmpInst& op);

  void visitUDiv(llvm::BinaryOperator& op);
  void visitSDiv(llvm::BinaryOperator& op);
  void visitURem(llvm::BinaryOperator& op);
  void visitSRem(llvm::BinaryOperator& op);

  void visitPHINode(llvm::PHINode& node);
  void visitBranchInst(llvm::BranchInst& inst);
  void visitReturnInst(llvm::ReturnInst& inst);
  void visitSwitchInst(llvm::SwitchInst& inst);
  void visitCallBase(llvm::CallBase& inst);
  void visitCallInst(llvm::CallInst& inst);
  void visitSelectInst(llvm::SelectInst& inst);
  void visitIntrinsicInst(llvm::IntrinsicInst& inst);
  void visitIndirectCall(llvm::CallBase& inst);
  void visitInvokeInst(llvm::InvokeInst& invoke);
  void visitResumeInst(llvm::ResumeInst& resume);

  void visitGetElementPtrInst(llvm::GetElementPtrInst& inst);
  void visitLoadInst(llvm::LoadInst& inst);
  void visitStoreInst(llvm::StoreInst& inst);

  void visitInsertElementInst(llvm::InsertElementInst& inst);
  void visitExtractElementInst(llvm::ExtractElementInst& inst);
  void visitShuffleVectorInst(llvm::ShuffleVectorInst& inst);
  void visitAllocaInst(llvm::AllocaInst& inst);
  void visitExtractValueInst(llvm::ExtractValueInst& inst);
  void visitInsertValueInst(llvm::InsertValueInst& inst);

  void visitMemCpyInst(llvm::MemCpyInst& memcpy);
  void visitMemMoveInst(llvm::MemMoveInst& memmove);

  void visitDbgInfoIntrinsic(llvm::DbgInfoIntrinsic&);

  void visitGlobalCtors();

private:
  void getInstLine(llvm::Instruction& inst);
  void visitExternFunc(llvm::CallBase& inst);
};

} // namespace caffeine

#endif
