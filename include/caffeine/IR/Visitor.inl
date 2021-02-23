#ifndef CAFFEINE_IR_VISITOR_INL
#define CAFFEINE_IR_VISITOR_INL

#include "caffeine/IR/Visitor.h"
#include "caffeine/Support/Macros.h"

#include <llvm/Support/Casting.h>

#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable : 4002 4003)
#endif

namespace caffeine {

namespace detail::visitor {
  std::string unknown_opcode_msg(const Operation& op);
}

template <template <typename T> class Transform, typename SubClass,
          typename RetTy>
RetTy OpVisitorBase<Transform, SubClass, RetTy>::visit(
    transform_t<Operation>& op) {

#define CAFFEINE_DELEGATE_2(opcode, type_)                                     \
  case Operation::opcode:                                                      \
    return static_cast<SubClass*>(this)->visit##opcode(                        \
        *static_cast<transform_t<type_>*>(&op))
#define CAFFEINE_DELEGATE_3(opcode, type_, name)                               \
  case Operation::opcode:                                                      \
    return static_cast<SubClass*>(this)->visit##name(                          \
        *static_cast<transform_t<type_>*>(&op))

#define DELEGATE(...) CAFFEINE_INVOKE_NUMBERED(CAFFEINE_DELEGATE_, __VA_ARGS__)

  // Special case for icmp and fcmp since they have multiple opcodes
  if (auto* icmp = llvm::dyn_cast<transform_t<ICmpOp>>(&op))
    return static_cast<SubClass*>(this)->visitICmp(*icmp);
  if (auto* fcmp = llvm::dyn_cast<transform_t<FCmpOp>>(&op))
    return static_cast<SubClass*>(this)->visitFCmp(*fcmp);
  if (auto* cnst = llvm::dyn_cast<transform_t<Constant>>(&op))
    return static_cast<SubClass*>(this)->visitConstant(*cnst);

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
    DELEGATE(FIsNaN, UnaryOp);

    DELEGATE(Select, SelectOp, SelectOp);
    DELEGATE(ConstantInt, ConstantInt);
    DELEGATE(ConstantFloat, ConstantFloat);
    DELEGATE(Undef, Undef);
    DELEGATE(FixedArray, FixedArray);

    DELEGATE(Trunc, UnaryOp);
    DELEGATE(SExt, UnaryOp);
    DELEGATE(ZExt, UnaryOp);

    DELEGATE(Alloc, AllocOp, AllocOp);
    DELEGATE(Store, StoreOp, StoreOp);
    DELEGATE(Load, LoadOp, LoadOp);

  case Operation::BinaryOpLast:
  case Operation::UnaryOpLast:
  case Operation::Invalid:
    CAFFEINE_ABORT("tried to visit an invalid operation");

  default:
    // this will also assert if your instruction above doesn't have a
    // delegate call
    CAFFEINE_ABORT(detail::visitor::unknown_opcode_msg(op));
  }

#undef CAFFEINE_DELEGATE_2
#undef CAFFEINE_DELEGATE_3
}

template <template <typename T> class Transform, typename SubClass,
          typename RetTy>
RetTy OpVisitorBase<Transform, SubClass, RetTy>::visit(
    transform_t<Operation>* op) {
  return static_cast<SubClass*>(this)->visit(*op);
}

template <template <typename T> class Transform, typename SubClass,
          typename RetTy>
RetTy OpVisitorBase<Transform, SubClass, RetTy>::operator()(
    transform_t<Operation>& op) {
  return static_cast<SubClass*>(this)->visit(op);
}

template <template <typename T> class Transform, typename SubClass,
          typename RetTy>
RetTy OpVisitorBase<Transform, SubClass, RetTy>::operator()(
    transform_t<Operation>* op) {
  return static_cast<SubClass*>(this)->visit(op);
}

} // namespace caffeine

#ifdef _MSC_VER
#pragma warning(pop)
#endif

#endif
