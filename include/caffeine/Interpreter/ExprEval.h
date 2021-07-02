#pragma once

#include "caffeine/IR/Operation.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <llvm/IR/InstVisitor.h>
#include <optional>
#include <stdexcept>

namespace caffeine {

class Context;
class LLVMValue;
class LLVMScalar;

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

  class Unevaluatable : public UnsupportedOperationException {
  private:
    llvm::Value* expr_;
    const char* context_;
    mutable std::string msg_cache_;

  public:
    explicit Unevaluatable(llvm::Value* expr, const char* context = nullptr);

    const char* what() const noexcept override;
    llvm::Value* expr() const;
  };

  explicit ExprEvaluator(Context* ctx, Options options = Options());

public:
  LLVMValue visit(llvm::Value* val);
  LLVMValue visit(llvm::Value& val);

  LLVMValue evaluate(llvm::Value* val);
  LLVMValue evaluate(llvm::Value& val);

  std::optional<LLVMValue> try_visit(llvm::Value* val);

  /*********************************************
   * Constant visitor methods                  *
   *********************************************/
  LLVMValue visitConstant(llvm::Constant& cnst);

  // Subclasses of ConstantData
  LLVMValue visitConstantAggregateZero(llvm::ConstantAggregateZero& cnst);
  LLVMValue visitConstantDataVector(llvm::ConstantDataVector& cnst);
  LLVMValue visitConstantDataArray(llvm::ConstantDataArray& cnst);
  LLVMValue visitConstantInt(llvm::ConstantInt& cnst);
  LLVMValue visitConstantFP(llvm::ConstantFP& cnst);
  LLVMValue visitConstantPointerNull(llvm::ConstantPointerNull& cnst);
  LLVMValue visitUndefValue(llvm::UndefValue& undef);

  // Subclasses of ConstantAggregate
  LLVMValue visitConstantArray(llvm::ConstantArray& cnst);
  LLVMValue visitConstantStruct(llvm::ConstantStruct& cnst);
  LLVMValue visitConstantVector(llvm::ConstantVector& cnst);

  // Subclasses of GlobalValue
  LLVMValue visitGlobalVariable(llvm::GlobalVariable& global);
  LLVMValue visitFunction(llvm::Function& func);

  // Extras
  OpRef visitGlobalData(llvm::Constant& cnst, unsigned AS);
  LLVMValue visitConstantExpr(llvm::ConstantExpr& expr);

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

  LLVMValue visitICmp(llvm::ICmpInst& op);
  LLVMValue visitFCmp(llvm::FCmpInst& op);

  LLVMValue visitTrunc(llvm::CastInst& op);
  LLVMValue visitSExt(llvm::CastInst& op);
  LLVMValue visitZExt(llvm::CastInst& op);
  LLVMValue visitFPTrunc(llvm::CastInst& op);
  LLVMValue visitFPExt(llvm::CastInst& op);
  LLVMValue visitUIToFP(llvm::CastInst& op);
  LLVMValue visitSIToFP(llvm::CastInst& op);
  LLVMValue visitFPToUI(llvm::CastInst& op);
  LLVMValue visitFPToSI(llvm::CastInst& op);

  LLVMValue visitPtrToInt(llvm::PtrToIntInst& op);
  LLVMValue visitIntToPtr(llvm::IntToPtrInst& op);

  LLVMValue visitBitCast(llvm::BitCastInst& op);

  LLVMValue visitGetElementPtr(llvm::GetElementPtrInst& op);

  LLVMValue visitSelectInst(llvm::SelectInst& op);

  LLVMValue visitInsertElement(llvm::InsertElementInst& inst);
  LLVMValue visitExtractElement(llvm::ExtractElementInst& inst);
  LLVMValue visitShuffleVector(llvm::ShuffleVectorInst& inst);
  LLVMValue visitExtractValue(llvm::ExtractValueInst& inst);
  LLVMValue visitInsertValue(llvm::InsertValueInst& inst);

private:
  OpRef scalarize(const LLVMScalar& scalar) const;
  LLVMScalar select(const LLVMScalar& cond, const LLVMScalar& t_val,
                    const LLVMScalar& f_val) const;

private:
  Context* ctx;
  Options options;
};

} // namespace caffeine
