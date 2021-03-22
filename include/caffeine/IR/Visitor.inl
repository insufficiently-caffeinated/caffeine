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
  switch (op.opcode()) {
#define HANDLE_OP(opcode, opname, opclass)                                     \
  case Operation::opcode:                                                      \
    return static_cast<SubClass*>(this)->visit##opname(                        \
        *static_cast<transform_t<opclass>*>(&op));
#include "caffeine/IR/Operation.def"

  case Operation::BinaryOpLast:
  case Operation::UnaryOpLast:
  case Operation::Invalid:
    CAFFEINE_ABORT("tried to visit an invalid operation");
  }

  // this will also assert if your instruction above doesn't have a
  // delegate call
  CAFFEINE_ABORT(detail::visitor::unknown_opcode_msg(op));
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
