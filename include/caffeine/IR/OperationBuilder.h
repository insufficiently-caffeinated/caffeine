#pragma once

#include "caffeine/IR/Operation.h"

namespace caffeine {
class Context;
class LLVMValue;
class LLVMScalar;
class Pointer;

#define CAFFEINE_DECL_BINOP(op)                                                \
  OpRef create##op(const OpRef& lhs, const OpRef& rhs);                        \
  LLVMValue create##op(const LLVMValue& lhs, const LLVMValue& rhs)

#define CAFFEINE_DECL_INT_BINOP(op)                                            \
  CAFFEINE_DECL_BINOP(op);                                                     \
  OpRef create##op(const OpRef& lhs, int64_t rhs);                             \
  OpRef create##op(const int64_t lhs, const OpRef& rhs)

#define CAFFEINE_DECL_PTR_BINOP(op)                                            \
  CAFFEINE_DECL_INT_BINOP(op);                                                 \
  OpRef create##op(const Pointer& lhs, const OpRef& rhs);                      \
  OpRef create##op(const OpRef& lhs, const Pointer& rhs);                      \
  OpRef create##op(const Pointer& lhs, const Pointer& rhs)

#define CAFFEINE_DECL_OPCODE_BINOP(op, opty)                                   \
  LLVMValue create##op(opty opcode, const LLVMValue& lhs,                      \
                       const LLVMValue& rhs);                                  \
  OpRef create##op(opty opcode, const OpRef& lhs, const OpRef& rhs)

#define CAFFEINE_DECL_UNOP(op)                                                 \
  OpRef create##op(const OpRef& operand);                                      \
  LLVMValue create##op(const LLVMValue& operand)

#define CAFFEINE_DECL_CONVERT_OP(op)                                           \
  OpRef create##op(Type tgt, const OpRef& operand);                            \
  LLVMValue create##op(Type tgt, const LLVMValue& operand)

class OperationBuilder {
public:
  OperationBuilder(Context* ctx);

public:
  OpRef createConstantZero(unsigned bitwidth);

  OpRef createConstantInt(unsigned bitwidth, uint64_t value);
  OpRef createConstantInt(const llvm::APInt& value);
  OpRef createConstantInt(llvm::APInt&& value);

  OpRef createConstantFloat(const llvm::APFloat& value);
  OpRef createConstantFloat(llvm::APFloat&& value);

  OpRef createConstant(Type t, const Symbol& symbol);
  OpRef createConstant(Type t, Symbol&& symbol);

  OpRef createConstantArray(const Symbol& symbol, const OpRef& size);
  OpRef createConstantArray(Symbol&& symbol, const OpRef& size);

  CAFFEINE_DECL_PTR_BINOP(Add);
  CAFFEINE_DECL_PTR_BINOP(Sub);
  CAFFEINE_DECL_INT_BINOP(Mul);
  CAFFEINE_DECL_INT_BINOP(UDiv);
  CAFFEINE_DECL_INT_BINOP(SDiv);
  CAFFEINE_DECL_INT_BINOP(URem);
  CAFFEINE_DECL_INT_BINOP(SRem);

  CAFFEINE_DECL_INT_BINOP(And);
  CAFFEINE_DECL_INT_BINOP(Or);
  CAFFEINE_DECL_INT_BINOP(Xor);
  CAFFEINE_DECL_INT_BINOP(Shl);
  CAFFEINE_DECL_INT_BINOP(LShr);
  CAFFEINE_DECL_INT_BINOP(AShr);

  CAFFEINE_DECL_BINOP(FAdd);
  CAFFEINE_DECL_BINOP(FSub);
  CAFFEINE_DECL_BINOP(FMul);
  CAFFEINE_DECL_BINOP(FDiv);
  CAFFEINE_DECL_BINOP(FRem);

  CAFFEINE_DECL_INT_BINOP(UMulOverflow);
  CAFFEINE_DECL_INT_BINOP(SMulOverflow);

  CAFFEINE_DECL_UNOP(Not);
  CAFFEINE_DECL_UNOP(FNeg);
  CAFFEINE_DECL_UNOP(FIsNaN);

  CAFFEINE_DECL_CONVERT_OP(Trunc);
  CAFFEINE_DECL_CONVERT_OP(ZExt);
  CAFFEINE_DECL_CONVERT_OP(SExt);
  CAFFEINE_DECL_CONVERT_OP(FpTrunc);
  CAFFEINE_DECL_CONVERT_OP(FpExt);
  CAFFEINE_DECL_CONVERT_OP(FpToUI);
  CAFFEINE_DECL_CONVERT_OP(FpToSI);
  CAFFEINE_DECL_CONVERT_OP(UIToFp);
  CAFFEINE_DECL_CONVERT_OP(SIToFp);
  CAFFEINE_DECL_CONVERT_OP(Bitcast);

  CAFFEINE_DECL_CONVERT_OP(TruncOrZExt);
  CAFFEINE_DECL_CONVERT_OP(TruncOrSExt);

  OpRef createSelect(const OpRef& cond, const OpRef& true_value,
                     const OpRef& false_value);
  OpRef createSelect(const OpRef& cond, const Pointer& true_value,
                     const Pointer& false_value);
  LLVMValue createSelect(const LLVMValue& cond, const LLVMValue& true_value,
                         const LLVMValue& false_value);

  CAFFEINE_DECL_OPCODE_BINOP(ICmp, ICmpOpcode);

  CAFFEINE_DECL_PTR_BINOP(ICmpEQ);
  CAFFEINE_DECL_PTR_BINOP(ICmpNE);
  CAFFEINE_DECL_PTR_BINOP(ICmpUGT);
  CAFFEINE_DECL_PTR_BINOP(ICmpUGE);
  CAFFEINE_DECL_PTR_BINOP(ICmpULT);
  CAFFEINE_DECL_PTR_BINOP(ICmpULE);
  CAFFEINE_DECL_PTR_BINOP(ICmpSGT);
  CAFFEINE_DECL_PTR_BINOP(ICmpSGE);
  CAFFEINE_DECL_PTR_BINOP(ICmpSLT);
  CAFFEINE_DECL_PTR_BINOP(ICmpSLE);

  LLVMValue createFCmp(FCmpOpcode opcode, const LLVMValue& lhs,
                       const LLVMValue& rhs);
  OpRef createFCmp(FCmpOpcode opcode, const OpRef& lhs, const OpRef& rhs);

  OpRef createAlloc(const OpRef& size, const OpRef& defaultval);
  OpRef createLoad(const OpRef& data, const OpRef& offset);
  OpRef createStore(const OpRef& data, const OpRef& offset, const OpRef& value);
  OpRef createUndef(Type t);

  OpRef createFixedArray(Type index_ty, llvm::ArrayRef<OpRef> data);
  OpRef createFixedArray(Type index_ty, const OpRef& value, size_t size);

  OpRef createFunctionObject(llvm::Function* function);

private:
  OpRef to_expr(const LLVMScalar& scalar);
  OpRef to_expr(const Pointer& ptr);

  OpRef to_egraph(const OpRef& op);

  Context* ctx;
};

#undef CAFFEINE_DECL_BINOP
#undef CAFFEINE_DECL_INT_BINOP
#undef CAFFEINE_DECL_PTR_BINOP
#undef CAFFEINE_DECL_OPCODE_BINOP
#undef CAFFEINE_DECL_UNOP
#undef CAFFEINE_DECL_CONVERT_OP

} // namespace caffeine
