#ifndef CAFFEINE_IR_VISITOR_H
#define CAFFEINE_IR_VISITOR_H

#include "caffeine/IR/Operation.h"

#include <llvm/IR/InstVisitor.h>
#include <llvm/Support/Casting.h>
#include <string_view>

namespace caffeine {

namespace detail {
  template <typename T>
  struct as_const {
    typedef const T type;
  };

  template <typename T>
  struct identity {
    typedef T type;
  };
} // namespace detail

#define CAFFEINE_OP_DELEGATE(class_)                                           \
  static_cast<SubClass*>(this)->visit##class_(                                 \
      static_cast<transform_t<class_>&>(O))

/**
 * Base class for operation visitors.
 *
 * An operation visitor is used when you want to perform different actions for
 * different kinds of operations without having to write out lots of casts and a
 * big switch statement.
 *
 * To define your own visitor, inherit from either OpVisitor or ConstOpVisitor
 * depending on whether you want to be able to modify the instruction instances
 * being visited. Then, "override" the visitXXX method to get handle each
 * instruction variant. Note that all methods are staticly resolved, so
 * overriding them doesn't actually declare a virtual method.
 *
 * If you don't implement the visitXXX for some operation type, then the
 * visitXXX for its supertype will be called all the way up to the base
 * visitOperation method. If you handle the visitXXX for the operation
 * superclass then as new operations are added in the future they will be
 * automatically supported.
 *
 * The optional second template argument for OpVisitor and ConstOpVisitor
 * specifies the type that the instruction visitation functions should return.
 * If you specify this, then you *MUST* provide an implementation of
 * visitInstruction.
 *
 * Example
 * =======
 * Suppose we want to create a visitor that could be used to count the number of
 * symbolic constants that occur in an expression tree. It would look something
 * like this:
 *
 * ```cpp
 * class CountingVisitor : ConstOpVisitor<CountingVisitor> {
 * public:
 *   size_t num_consts = 0;
 *
 *   void visitOperation(const Operation& op) {
 *     for (const Operation& operand : op.operands)
 *       visit(operand);
 *   }
 *
 *   void visitConstant(const Constant&) {
 *     num_constants += 1;
 *   }
 * };
 * ```
 *
 * OpVisitorBase Details
 * =====================
 * The OpVisitorBase class has a 3rd leading template parameter which can
 * transform the instruction type before being used as a parameter type. See the
 * template structs within the details block at the start of this header to get
 * an example of how this works.
 */
template <template <typename T> class Transform, typename SubClass,
          typename RetTy = void>
class OpVisitorBase {
private:
  template <typename T>
  using transform_t = typename Transform<T>::type;

public:
  void visitOperation(transform_t<Operation>&) {}

  // clang-format off
  RetTy visitArrayBase(transform_t<ArrayBase>& O) { return CAFFEINE_OP_DELEGATE(Operation); }

  // visit methods for operation classes
  RetTy visitBinaryOp(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitUnaryOp (transform_t<UnaryOp> & O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitSelectOp(transform_t<SelectOp>& O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitAllocOp (transform_t<AllocOp> & O) { return CAFFEINE_OP_DELEGATE(ArrayBase); }
  RetTy visitStoreOp (transform_t<StoreOp> & O) { return CAFFEINE_OP_DELEGATE(ArrayBase); }
  RetTy visitLoadOp  (transform_t<LoadOp>  & O) { return CAFFEINE_OP_DELEGATE(Operation); }

  RetTy visitFCmpOp  (transform_t<FCmpOp>  & O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitICmpOp  (transform_t<ICmpOp>  & O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  // clang-format on

#define HANDLE_OPCLASS(opname, opclass)                                        \
  RetTy visit##opname(transform_t<opclass>& O) {                               \
    if constexpr (std::is_base_of_v<FixedArray, opclass>)                      \
      return CAFFEINE_OP_DELEGATE(ArrayBase);                                  \
    if constexpr (std::string_view(#opname) == #opclass)                       \
      return CAFFEINE_OP_DELEGATE(Operation);                                  \
    return CAFFEINE_OP_DELEGATE(opclass);                                      \
  }
#include "caffeine/IR/Operation.def"

  RetTy visit(transform_t<Operation>* O);
  RetTy visit(transform_t<Operation>& O);

  RetTy operator()(transform_t<Operation>* O);
  RetTy operator()(transform_t<Operation>& O);
};

/**
 * Operation vistor.
 *
 * See the docs on OpVisitorBase for more detailed docs.
 */
template <typename SubClass, typename RetTy = void>
using OpVisitor = OpVisitorBase<detail::identity, SubClass, RetTy>;

/**
 * Const operation visitor.
 *
 * See the docs on OpVisitorBase for more detailed docs.
 */
template <typename SubClass, typename RetTy = void>
using ConstOpVisitor = OpVisitorBase<detail::as_const, SubClass, RetTy>;

#undef CAFFEINE_OP_DELEGATE

} // namespace caffeine

#include "Visitor.inl"

#endif
