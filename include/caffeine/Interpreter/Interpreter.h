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

class ExecutionPolicy;
class ExecutionContextStore;
class Interpreter;

class ExecutionResult {
public:
  enum Status { Continue, Dead, Stop, Migrated };
  using ContextVec = llvm::SmallVector<Context, 2>;

  ExecutionResult(Status status);
  ExecutionResult(ContextVec&& contexts, Status status = Dead);

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

typedef ExecutionResult (*InterpreterFunction)(Interpreter&, llvm::CallBase&);

class Interpreter : public llvm::InstVisitor<Interpreter, ExecutionResult> {
private:
  ExecutionPolicy* policy;
  ExecutionContextStore* store;

  Context* ctx;
  FailureLogger* logger;
  InterpreterOptions options;
  std::shared_ptr<Solver> solver;

  InterpreterContext* interp;

public:
  /**
   * The interpreter constructor needs an executor and context as well as a way
   * to log assertion failures.
   */
  Interpreter(ExecutionPolicy* policy, ExecutionContextStore* store,
              FailureLogger* logger, InterpreterContext* interp,
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
  ExecutionResult visitCallBase(llvm::CallBase& inst);
  ExecutionResult visitCallInst(llvm::CallInst& inst);
  ExecutionResult visitSelectInst(llvm::SelectInst& inst);
  ExecutionResult visitIntrinsicInst(llvm::IntrinsicInst& inst);
  ExecutionResult visitIndirectCall(llvm::CallBase& inst);
  ExecutionResult visitInvokeInst(llvm::InvokeInst& invoke);

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

private:
  void logFailure(Context& ctx, const Assertion& assertion,
                  std::string_view message = "");
  void queueContext(Context&& ctx);
  Interpreter cloneWith(InterpreterContext* interp);

private:
  ExecutionResult visitExternFunc(llvm::CallBase& inst);

  ExecutionResult visitSetjmp(llvm::CallBase& inst);
  ExecutionResult visitLongjmp(llvm::CallBase& inst);

  friend class TransformBuilder;

public:
  static std::unordered_map<std::string_view, InterpreterFunction>&
  extern_functions();
};

} // namespace caffeine

#endif
