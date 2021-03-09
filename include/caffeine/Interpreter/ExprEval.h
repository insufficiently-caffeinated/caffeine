#pragma once

#include <llvm/IR/InstVisitor.h>

namespace caffeine {

class Context;
class LLVMValue;

/**
 * LLVM IR expression evaluator.
 *
 * This class is designed to evaluate expressions which don't require any
 * context forking. This makes it suitable for evaluating LLVM constant
 * expressions and certain simple instructions.
 *
 * This class will never insert a value into the context. Depending on
 * configuration, it may create new allocations if attempting to evaluate a
 * global allocation.
 */
class ExprEvaluator : public llvm::InstVisitor<ExprEvaluator, LLVMValue> {
private:
  using BaseType = llvm::InstVisitor<ExprEvaluator, LLVMValue>;

public:
  struct Options {
    bool create_allocations = true;

    constexpr Options() noexcept {}
  };

  explicit ExprEvaluator(Context* ctx, Options options = Options());

  LLVMValue visit(llvm::Value* val);


  /*********************************************
   * InstVisitor override methods              *
   *********************************************/

  LLVMValue visitInstruction(llvm::Instruction& inst);

  LLVMValue visitAdd(llvm::BinaryOperator& op);
  LLVMValue visitSub(llvm::BinaryOperator& op);
  LLVMValue visitMul(llvm::BinaryOperator& op);
  LLVMValue visitUDiv(llvm::BinaryOperator& op);
  LLVMValue visitSDiv(llvm::BinaryOperator& op);
  LLVMValue visitURem(llvm::BinaryOperator& op);
  LLVMValue visitSRem(llvm::BinaryOperator& op);

  LLVMValue visitShl(llvm::BinaryOperator& op);
  LLVMValue visitLShr(llvm::BinaryOperator& op);
  LLVMValue visitAShr(llvm::BinaryOperator& op);
  LLVMValue visitAnd(llvm::BinaryOperator& op);
  LLVMValue visitOr(llvm::BinaryOperator& op);
  LLVMValue visitXor(llvm::BinaryOperator& op);

  LLVMValue visitFAdd(llvm::BinaryOperator& op);
  LLVMValue visitFSub(llvm::BinaryOperator& op);
  LLVMValue visitFMul(llvm::BinaryOperator& op);
  LLVMValue visitFDiv(llvm::BinaryOperator& op);

  LLVMValue visitFNeg(llvm::UnaryOperator& op);

  LLVMValue visitTrunc(llvm::CastInst& op);
  LLVMValue visitSExt(llvm::CastInst& op);
  LLVMValue visitZExt(llvm::CastInst& op);
  LLVMValue visitFPTrunc(llvm::CastInst& op);
  LLVMValue visitFPExt(llvm::CastInst& op);
  LLVMValue visitUIToFP(llvm::CastInst& op);
  LLVMValue visitSIToFP(llvm::CastInst& op);
  LLVMValue visitFPToUI(llvm::CastInst& op);
  LLVMValue visitFPToSI(llvm::CastInst& op);

private:
  Context* ctx;
  Options options;
};

} // namespace caffeine
