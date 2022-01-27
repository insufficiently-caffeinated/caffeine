#include "caffeine/IR/OperationBuilder.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Model/Value.h"

namespace caffeine {

OperationBuilder::OperationBuilder(Context* ctx) : ctx(ctx) {}

OpRef OperationBuilder::createConstantZero(unsigned bitwidth) {
  return createConstantInt(llvm::APInt::getNullValue(bitwidth));
}

OpRef OperationBuilder::createConstantInt(unsigned bitwidth, uint64_t value) {
  return createConstantInt(llvm::APInt(bitwidth, value));
}
OpRef OperationBuilder::createConstantInt(llvm::APInt&& value) {
  return ConstantInt::Create(std::move(value));
}
OpRef OperationBuilder::createConstantInt(const llvm::APInt& value) {
  return ConstantInt::Create(value);
}

OpRef OperationBuilder::createConstantFloat(const llvm::APFloat& value) {
  return ConstantFloat::Create(value);
}
OpRef OperationBuilder::createConstantFloat(llvm::APFloat&& value) {
  return ConstantFloat::Create(std::move(value));
}

OpRef OperationBuilder::createConstant(Type t, const Symbol& symbol) {
  return to_egraph(Constant::Create(t, symbol));
}
OpRef OperationBuilder::createConstant(Type t, Symbol&& symbol) {
  return to_egraph(Constant::Create(t, std::move(symbol)));
}

OpRef OperationBuilder::createConstantArray(const Symbol& symbol,
                                            const OpRef& size) {
  return to_egraph(ConstantArray::Create(symbol, size));
}
OpRef OperationBuilder::createConstantArray(Symbol&& symbol,
                                            const OpRef& size) {
  return to_egraph(ConstantArray::Create(std::move(symbol), size));
}

#define DEF_INT_BINOP_OVERLOADS(op)                                            \
  OpRef OperationBuilder::create##op(const OpRef& lhs, int64_t rhs) {          \
    CAFFEINE_ASSERT(lhs, "lhs was null");                                      \
    CAFFEINE_ASSERT(lhs->type().is_int());                                     \
                                                                               \
    auto literal = llvm::APInt(64, static_cast<uint64_t>(rhs));                \
    auto value =                                                               \
        createConstantInt(literal.sextOrTrunc(lhs->type().bitwidth()));        \
    return this->create##op(lhs, value);                                       \
  }                                                                            \
  OpRef OperationBuilder::create##op(int64_t lhs, const OpRef& rhs) {          \
    CAFFEINE_ASSERT(rhs, "rhs was null");                                      \
    CAFFEINE_ASSERT(rhs->type().is_int());                                     \
                                                                               \
    auto literal = llvm::APInt(64, static_cast<uint64_t>(lhs));                \
    auto value =                                                               \
        createConstantInt(literal.sextOrTrunc(rhs->type().bitwidth()));        \
    return create##op(value, rhs);                                             \
  }                                                                            \
  static_assert(true)

#define DEF_PTR_BINOP_OVERLOADS(op)                                            \
  OpRef OperationBuilder::create##op(const Pointer& lhs, const OpRef& rhs) {   \
    return create##op(to_expr(lhs), rhs);                                      \
  }                                                                            \
  OpRef OperationBuilder::create##op(const OpRef& lhs, const Pointer& rhs) {   \
    return create##op(lhs, to_expr(rhs));                                      \
  }                                                                            \
  OpRef OperationBuilder::create##op(const Pointer& lhs, const Pointer& rhs) { \
    return create##op(to_expr(lhs), to_expr(rhs));                             \
  }                                                                            \
  static_assert(true)

#define DEF_CMP_BINOP_OVERLOADS(op)                                            \
  DEF_PTR_BINOP_OVERLOADS(op);                                                 \
  DEF_INT_BINOP_OVERLOADS(op)

#define DEF_ICMP_BINOP_FWD(op)                                                 \
  OpRef OperationBuilder::createICmp##op(const OpRef& lhs, const OpRef& rhs) { \
    return createICmp(ICmpOpcode::op, lhs, rhs);                               \
  }                                                                            \
  DEF_CMP_BINOP_OVERLOADS(ICmp##op)

#define DEF_BINOP(op)                                                          \
  OpRef OperationBuilder::create##op(const OpRef& lhs, const OpRef& rhs) {     \
    return to_egraph(BinaryOp::Create##op(lhs, rhs));                          \
  }                                                                            \
  LLVMValue OperationBuilder::create##op(const LLVMValue& lhs,                 \
                                         const LLVMValue& rhs) {               \
    return transform_elements(                                                 \
        [&](const LLVMScalar& a, const LLVMScalar& b) {                        \
          return this->create##op(this->to_expr(a), this->to_expr(b));         \
        },                                                                     \
        lhs, rhs);                                                             \
  }                                                                            \
  static_assert(true)
#define DEF_UNOP(op)                                                           \
  OpRef OperationBuilder::create##op(const OpRef& operand) {                   \
    return to_egraph(UnaryOp::Create##op(operand));                            \
  }                                                                            \
  LLVMValue OperationBuilder::create##op(const LLVMValue& arg) {               \
    return transform_elements(                                                 \
        [&](const LLVMScalar& x) {                                             \
          return this->create##op(this->to_expr(x));                           \
        },                                                                     \
        arg);                                                                  \
  }                                                                            \
  static_assert(true)
#define DEF_CONVERT(op)                                                        \
  OpRef OperationBuilder::create##op(Type tgt, const OpRef& operand) {         \
    return to_egraph(UnaryOp::Create##op(tgt, operand));                       \
  }                                                                            \
  LLVMValue OperationBuilder::create##op(Type tgt, const LLVMValue& x) {       \
    return transform_elements(                                                 \
        [&](const LLVMScalar& x) {                                             \
          return this->create##op(tgt, this->to_expr(x));                      \
        },                                                                     \
        x);                                                                    \
  }                                                                            \
  static_assert(true)

#define DEF_INT_BINOP(op)                                                      \
  DEF_BINOP(op);                                                               \
  DEF_INT_BINOP_OVERLOADS(op)

#define DEF_PTR_BINOP(op)                                                      \
  DEF_INT_BINOP(op);                                                           \
  DEF_PTR_BINOP_OVERLOADS(op)

DEF_PTR_BINOP(Add);
DEF_PTR_BINOP(Sub);
DEF_INT_BINOP(Mul);
DEF_INT_BINOP(UDiv);
DEF_INT_BINOP(SDiv);
DEF_INT_BINOP(URem);
DEF_INT_BINOP(SRem);

DEF_INT_BINOP(UMulOverflow);
DEF_INT_BINOP(SMulOverflow);

DEF_INT_BINOP(And);
DEF_INT_BINOP(Or);
DEF_INT_BINOP(Xor);
DEF_INT_BINOP(Shl);
DEF_INT_BINOP(LShr);
DEF_INT_BINOP(AShr);

DEF_BINOP(FAdd);
DEF_BINOP(FSub);
DEF_BINOP(FMul);
DEF_BINOP(FDiv);
DEF_BINOP(FRem);

DEF_UNOP(Not);
DEF_UNOP(FNeg);
DEF_UNOP(FIsNaN);

DEF_CONVERT(Trunc);
DEF_CONVERT(ZExt);
DEF_CONVERT(SExt);
DEF_CONVERT(FpTrunc);
DEF_CONVERT(FpExt);
DEF_CONVERT(FpToUI);
DEF_CONVERT(FpToSI);
DEF_CONVERT(UIToFp);
DEF_CONVERT(SIToFp);
DEF_CONVERT(Bitcast);

DEF_CONVERT(TruncOrZExt);
DEF_CONVERT(TruncOrSExt);

LLVMValue OperationBuilder::createICmp(ICmpOpcode opcode, const LLVMValue& lhs,
                                       const LLVMValue& rhs) {
  return transform_elements(
      [&](const LLVMScalar& a, const LLVMScalar& b) -> LLVMScalar {
        return this->createICmp(opcode, to_expr(a), to_expr(b));
      },
      lhs, rhs);
}
OpRef OperationBuilder::createICmp(ICmpOpcode opcode, const OpRef& lhs,
                                   const OpRef& rhs) {
  return to_egraph(ICmpOp::CreateICmp(opcode, lhs, rhs));
}

DEF_ICMP_BINOP_FWD(EQ);
DEF_ICMP_BINOP_FWD(NE);
DEF_ICMP_BINOP_FWD(UGT);
DEF_ICMP_BINOP_FWD(UGE);
DEF_ICMP_BINOP_FWD(ULT);
DEF_ICMP_BINOP_FWD(ULE);
DEF_ICMP_BINOP_FWD(SGT);
DEF_ICMP_BINOP_FWD(SGE);
DEF_ICMP_BINOP_FWD(SLT);
DEF_ICMP_BINOP_FWD(SLE);

LLVMValue OperationBuilder::createFCmp(FCmpOpcode opcode, const LLVMValue& lhs,
                                       const LLVMValue& rhs) {
  return transform_elements(
      [&](const LLVMScalar& a, const LLVMScalar& b) -> LLVMScalar {
        return this->createFCmp(opcode, a.expr(), b.expr());
      },
      lhs, rhs);
}
OpRef OperationBuilder::createFCmp(FCmpOpcode opcode, const OpRef& lhs,
                                   const OpRef& rhs) {
  return to_egraph(FCmpOp::CreateFCmp(opcode, lhs, rhs));
}

OpRef OperationBuilder::createAlloc(const OpRef& size,
                                    const OpRef& defaultval) {
  return AllocOp::Create(size, defaultval);
}
OpRef OperationBuilder::createLoad(const OpRef& data, const OpRef& offset) {
  return to_egraph(LoadOp::Create(data, offset));
}
OpRef OperationBuilder::createStore(const OpRef& data, const OpRef& offset,
                                    const OpRef& value) {
  return StoreOp::Create(data, offset, value);
}
OpRef OperationBuilder::createUndef(Type t) {
  return to_egraph(Undef::Create(t));
}

OpRef OperationBuilder::createFixedArray(Type index_ty,
                                         llvm::ArrayRef<OpRef> data) {
  return FixedArray::Create(index_ty, data);
}
OpRef OperationBuilder::createFixedArray(Type index_ty, const OpRef& value,
                                         size_t size) {
  return FixedArray::Create(index_ty, value, size);
}

OpRef OperationBuilder::createFunctionObject(llvm::Function* function) {
  return FunctionObject::Create(function);
}

OpRef OperationBuilder::to_expr(const LLVMScalar& scalar) {
  if (scalar.is_expr())
    return scalar.expr();

  return to_expr(scalar.pointer());
}
OpRef OperationBuilder::to_expr(const Pointer& ptr) {
  return ptr.value(ctx->heaps);
}

OpRef OperationBuilder::to_egraph(const OpRef& op) {
  return EGraphNode::Create(op->type(), ctx->egraph.add(*op));
}

} // namespace caffeine
