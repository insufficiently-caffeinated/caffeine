#ifndef CAFFEINE_IR_VISITOR_INL
#define CAFFEINE_IR_VISITOR_INL

#include "caffeine/IR/Visitor.h"

#include <llvm/Support/Casting.h>

namespace caffeine {

template <template <typename T> class Transform, typename SubClass,
          typename RetTy>
RetTy OpVisitorBase<Transform, SubClass, RetTy>::visit(
    transform_t<Operation>& op) {
#define DELEGATE(opcode, type_)                                                \
  case Operation::opcode:                                                      \
    return static_cast<SubClass*>(this)->visit##opcode(                        \
        *static_cast<transform_t<type_>*>(&op))

  // Special case for icmp and fcmp since they have multiple opcodes
  if (auto* icmp = llvm::dyn_cast<transform_t<ICmpOp>>(&op))
    return static_cast<SubClass*>(this)->visitICmp(*icmp);
  if (auto* fcmp = llvm::dyn_cast<transform_t<FCmpOp>>(&op))
    return static_cast<SubClass*>(this)->visitFCmp(*fcmp);

  switch (op.opcode()) {
    DELEGATE(Add, BinaryOp);
    DELEGATE(Sub, BinaryOp);
    DELEGATE(Mul, BinaryOp);
    DELEGATE(UDiv, BinaryOp);
    DELEGATE(SDiv, BinaryOp);
    DELEGATE(URem, BinaryOp);
    DELEGATE(SRem, BinaryOp);
    DELEGATE(And, BinaryOp);
    DELEGATE(Or, BinaryOp);
    DELEGATE(Xor, BinaryOp);
    DELEGATE(Shl, BinaryOp);
    DELEGATE(LShr, BinaryOp);
    DELEGATE(AShr, BinaryOp);
    DELEGATE(FAdd, BinaryOp);
    DELEGATE(FSub, BinaryOp);
    DELEGATE(FMul, BinaryOp);
    DELEGATE(FDiv, BinaryOp);
    DELEGATE(FRem, BinaryOp);

    DELEGATE(Not, UnaryOp);
    DELEGATE(FNeg, UnaryOp);

    DELEGATE(SelectOp, SelectOp);
    DELEGATE(Constant, Constant);
    DELEGATE(ConstantInt, ConstantInt);
    DELEGATE(ConstantFloat, ConstantFloat);

  case Operation::Invalid:
    CAFFEINE_ABORT("tried to visit an invalid operation");
  
  default:
    CAFFEINE_ABORT("unknown operation opcode");
  }

#undef DELEGATE
}

} // namespace caffeine

#endif
