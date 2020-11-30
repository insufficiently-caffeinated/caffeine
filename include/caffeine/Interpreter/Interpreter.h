#ifndef CAFFEINE_INTERP_INTERPRETER_H
#define CAFFEINE_INTERP_INTERPRETER_H

#include <memory>

#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/InstVisitor.h>

namespace caffeine {

enum class ExecutionResult { Continue, Stop };

class Interpreter : public llvm::InstVisitor<Interpreter, ExecutionResult> {
private:
  Context* ctx;
  Executor* queue;

public:
  /**
   * The interpreter constructor needs an executor and context
   *
   * TODO: Add failure tracker
   */
  Interpreter(Executor* queue, Context* ct);

  void execute();

  ExecutionResult visitInstruction(llvm::Instruction& inst);

  ExecutionResult visitAdd(llvm::BinaryOperator& op);
  ExecutionResult visitPHINode(llvm::PHINode& node);
  ExecutionResult visitBranchInst(llvm::BranchInst&);
  ExecutionResult visitReturnInst(llvm::ReturnInst&) {
    CAFFEINE_UNIMPLEMENTED();
  };
  ExecutionResult visitCallInst(llvm::CallInst&) {
    CAFFEINE_UNIMPLEMENTED();
  };
  ExecutionResult visitSelectInst(llvm::SelectInst&) {
    CAFFEINE_UNIMPLEMENTED();
  };
};

} // namespace caffeine

#endif
