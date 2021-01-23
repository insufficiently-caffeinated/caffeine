#ifndef CAFFEINE_IR_VISITOR_H
#define CAFFEINE_IR_VISITOR_H

#include "caffeine/IR/Operation.h"

#include <llvm/IR/InstVisitor.h>
#include <llvm/Support/Casting.h>

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
  RetTy visitArray(transform_t<Array>& O) { return CAFFEINE_OP_DELEGATE(Operation); }

  RetTy visitConstant     (transform_t<Constant>     & O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitConstantInt  (transform_t<ConstantInt>  & O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitConstantFloat(transform_t<ConstantFloat>& O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitConstantArray(transform_t<ConstantArray>& O) { return CAFFEINE_OP_DELEGATE(ArrayBase); }
  RetTy visitUndef        (transform_t<Undef>        & O) { return CAFFEINE_OP_DELEGATE(Operation); }

  RetTy visitBinaryOp(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitUnaryOp (transform_t<UnaryOp> & O) { return CAFFEINE_OP_DELEGATE(Operation); }
  RetTy visitSelectOp(transform_t<SelectOp>& O) { return CAFFEINE_OP_DELEGATE(Operation); }

  RetTy visitAllocOp(transform_t<AllocOp>& O) { return CAFFEINE_OP_DELEGATE(ArrayBase); }
  RetTy visitStoreOp(transform_t<StoreOp>& O) { return CAFFEINE_OP_DELEGATE(ArrayBase); }
  RetTy visitLoadOp (transform_t<LoadOp>&  O) { return CAFFEINE_OP_DELEGATE(Operation); }

  // Binary operations
  RetTy visitAdd (transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitSub (transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitMul (transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitUDiv(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitSDiv(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitURem(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitSRem(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitAnd (transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitOr  (transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitXor (transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitShl (transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitLShr(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitAShr(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitFAdd(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitFSub(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitFMul(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitFDiv(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitFRem(transform_t<BinaryOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }

  RetTy visitICmp(transform_t<ICmpOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }
  RetTy visitFCmp(transform_t<FCmpOp>& O) { return CAFFEINE_OP_DELEGATE(BinaryOp); }

  // Unary operations
  RetTy visitNot (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitFNeg(transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitFIsNaN(transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }

  RetTy visitTrunc  (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitZExt   (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitSExt   (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitFpTrunc(transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitFpExt  (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitFpToUI (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitFpToSI (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitUIToFp (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitSIToFp (transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  RetTy visitBitcast(transform_t<UnaryOp>& O) { return CAFFEINE_OP_DELEGATE(UnaryOp); }
  // clang-format on

  RetTy visit(transform_t<Operation>* O);
  RetTy visit(transform_t<Operation>& O);
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
