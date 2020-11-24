#ifndef CAFFEINE_INTERP_INTERPRETER_H
#define CAFFEINE_INTERP_INTERPRETER_H

#include "caffeine/Interpreter/Executor.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/InstVisitor.h>

namespace caffeine {

enum class ExecutionResult { Continue, Stop };

class Interpreter : public llvm::InstVisitor<Interpreter, ExecutionResult> {
private:
  Executor* queue;

  /**
   * The current set of invariants for this context
   */
  std::vector<Assertion> assertions;

public:
  /**
   * The interpreter constructor needs an executor and context
   *
   * TODO: Add failure tracker
   */
  Interpreter(Executor* queue);

  void execute();

  ExecutionResult visitInstruction(llvm::Instruction &inst);

  ExecutionResult visitPHINode(llvm::PHINode &node)       { CAFFEINE_ABORT(); };
  ExecutionResult visitBranchInst(llvm::BranchInst &inst) { CAFFEINE_ABORT(); };
  ExecutionResult visitReturnInst(llvm::ReturnInst &inst) { CAFFEINE_ABORT(); };
  ExecutionResult visitCallInst(llvm::CallInst &inst)     { CAFFEINE_ABORT(); };
  ExecutionResult visitSelectInst(llvm::SelectInst &inst) { CAFFEINE_ABORT(); };
};

} // namespace caffeine

#endif
