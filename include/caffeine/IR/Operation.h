#ifndef CAFFEINE_IR_OPERATION_H
#define CAFFEINE_IR_OPERATION_H

#include <atomic>
#include <cstdint>
#include <iosfwd>
#include <string>
#include <variant>

#include <boost/container/static_vector.hpp>
#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>
#include <llvm/ADT/Hashing.h>
#include <llvm/ADT/iterator_range.h>
#include <llvm/Support/Casting.h>
#include <magic_enum.hpp>

#include "caffeine/ADT/PersistentArray.h"
#include "caffeine/ADT/Ref.h"
#include "caffeine/ADT/SharedArray.h"
#include "caffeine/ADT/StringInterner.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/CopyVTable.h"

#include "caffeine/IR/OperationBase.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine {

/**
 * Base class for all array-typed operations.
 *
 * This allows clients to get the size of an array without having to care about
 * exactly what type of array they are interacting with.
 */
class ArrayBase : public Operation {
protected:
  using Operation::Operation;

public:
  virtual OpRef size() const = 0;

  static bool classof(const Operation* op);
};

/**
 * Symbolic constant.
 *
 * Symbolic constants are uniquely identified by either a string name or a
 * number.
 *
 * Generally user specified constants will be identified by a string name
 * whereas internal constants (e.g. memory allocation addresses) are identified
 * by a number.
 */
class Constant : public Operation {
private:
  Constant(Type t, const Symbol& symbol);
  Constant(Type t, Symbol&& symbol);

public:
  const Symbol& symbol() const;
  InternedString name() const;
  uint64_t number() const;

  bool is_numbered() const;
  bool is_named() const;

  static OpRef Create(Type t, const Symbol& symbol);
  static OpRef Create(Type t, Symbol&& symbol);

  static bool classof(const Operation* op);

private:
  static Opcode op_for_symbol(const Symbol& symbol);
};

/**
 * Integer constant.
 *
 * This represents a constant integer value in an expression.
 * As an example, this would be the 2 in the expression 2 * x.
 */
class ConstantInt : public Operation {
private:
  ConstantInt(const llvm::APInt& iconst);
  ConstantInt(llvm::APInt&& iconst);

public:
  const llvm::APInt& value() const;

  Value as_value() const;

  static OpRef Create(const llvm::APInt& iconst);
  static OpRef Create(llvm::APInt&& iconst);
  // Specialization for creating boolean constants
  static OpRef Create(bool value);
  static OpRef Create(const Value& value);

  static OpRef CreateZero(unsigned bitwidth);

  static bool classof(const Operation* op);
};

/**
 * Floating point constant.
 *
 * This represents a constant floating point value in an expression.
 * As an example, this would be the 2.0f in the expression 2.0f * x.
 */
class ConstantFloat : public Operation {
private:
  ConstantFloat(const llvm::APFloat& fconst);
  ConstantFloat(llvm::APFloat&& fconst);

public:
  const llvm::APFloat& value() const;

  static OpRef Create(const llvm::APFloat& fconst);
  static OpRef Create(llvm::APFloat&& fconst);
  static OpRef Create(double value);

  static bool classof(const Operation* op);
};

/**
 * Symbolic array.
 */
class ConstantArray : public ArrayBase {
private:
  ConstantArray(Symbol&& symbol, const OpRef& size);

public:
  OpRef size() const override;

  const Symbol& symbol() const;

  static OpRef Create(const Symbol& symbol, const OpRef& size);
  static OpRef Create(Symbol&& symbol, const OpRef& size);

  OpRef with_new_operands(llvm::ArrayRef<OpRef> operands) const override;

  const OpRef& operand_at(size_t idx) const override;

  static bool classof(const Operation* op);
};

/**
 * Binary expression (e.g. +, -, etc.).
 *
 * Any more specific operations with 2 operands should inherit from this class.
 */
class BinaryOp : public Operation {
protected:
  BinaryOp(Opcode op, Type t, const OpRef& lhs, const OpRef& rhs);

public:
  const OpRef& lhs() const;
  const OpRef& rhs() const;

  static OpRef Create(Opcode op, const OpRef& lhs, const OpRef& rhs);

  static OpRef CreateAdd(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateSub(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateMul(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateUDiv(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateSDiv(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateURem(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateSRem(const OpRef& lhs, const OpRef& rhs);

  static OpRef CreateAnd(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateOr(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateXor(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateShl(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateLShr(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateAShr(const OpRef& lhs, const OpRef& rhs);

  static OpRef CreateFAdd(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateFSub(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateFMul(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateFDiv(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateFRem(const OpRef& lhs, const OpRef& rhs);

  // Overflow checking methods. Return a symbolic boolean indicating whether the
  // specified operation would overflow or underflow.

  static OpRef CreateUMulOverflow(const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateSMulOverflow(const OpRef& lhs, const OpRef& rhs);

  // Utility methods for creating integer arithmetic when one of the operations
  // is a constant.

#define CAFFEINE_DECL_BINOP_INT_CONST(op)                                      \
  static OpRef Create##op(const OpRef& lhs, int64_t rhs);                      \
  static OpRef Create##op(int64_t lhs, const OpRef& rhs)

  CAFFEINE_DECL_BINOP_INT_CONST(Add);
  CAFFEINE_DECL_BINOP_INT_CONST(Sub);
  CAFFEINE_DECL_BINOP_INT_CONST(Mul);
  CAFFEINE_DECL_BINOP_INT_CONST(UDiv);
  CAFFEINE_DECL_BINOP_INT_CONST(SDiv);
  CAFFEINE_DECL_BINOP_INT_CONST(URem);
  CAFFEINE_DECL_BINOP_INT_CONST(SRem);

  CAFFEINE_DECL_BINOP_INT_CONST(And);
  CAFFEINE_DECL_BINOP_INT_CONST(Or);
  CAFFEINE_DECL_BINOP_INT_CONST(Xor);
  CAFFEINE_DECL_BINOP_INT_CONST(Shl);
  CAFFEINE_DECL_BINOP_INT_CONST(LShr);
  CAFFEINE_DECL_BINOP_INT_CONST(AShr);

#undef CAFFEINE_DECL_BINOP_INT_CONST

  static bool classof(const Operation* op);
};

/**
 * Unary operations (e.g. not, fneg, conversion operations).
 *
 * Any more specific unary operations should inherit from this class.
 */
class UnaryOp : public Operation {
protected:
  UnaryOp(Opcode op, Type t, const OpRef& operand);

public:
  const OpRef& operand() const;

  static OpRef Create(Opcode op, const OpRef& operand);
  static OpRef Create(Opcode op, const OpRef& operand, Type returnType);
  static OpRef CreateNot(const OpRef& operand);
  static OpRef CreateFNeg(const OpRef& operand);
  static OpRef CreateFIsNaN(const OpRef& operand);

  static OpRef CreateTrunc(Type tgt, const OpRef& operand);
  static OpRef CreateZExt(Type tgt, const OpRef& operand);
  static OpRef CreateSExt(Type tgt, const OpRef& operand);
  static OpRef CreateFpTrunc(Type tgt, const OpRef& operand);
  static OpRef CreateFpExt(Type tgt, const OpRef& operand);
  static OpRef CreateFpToUI(Type tgt, const OpRef& operand);
  static OpRef CreateFpToSI(Type tgt, const OpRef& operand);
  static OpRef CreateUIToFp(Type tgt, const OpRef& operand);
  static OpRef CreateSIToFp(Type tgt, const OpRef& operand);
  static OpRef CreateBitcast(Type tgt, const OpRef& operand);

  /// Create a trunc operation or a zext operation as needed to convert operand
  /// to the required bitwidth. If the bitwidths are the same then does nothing.
  static OpRef CreateTruncOrZExt(Type tgt, const OpRef& operand);
  /// Create a trunc operation or a sext operation as needed to convert operand
  /// to the required bitwidth. If the bitwidths are the same then does nothing.
  static OpRef CreateTruncOrSExt(Type tgt, const OpRef& operand);

  static bool classof(const Operation* op);
};

/**
 * Select instruction.
 *
 * Represented as
 * select %cond, %true_value, %false_value
 */
class SelectOp : public Operation {
protected:
  SelectOp(Type t, const OpRef& cond, const OpRef& true_val,
           const OpRef& false_val);

public:
  const OpRef& condition() const;
  const OpRef& true_value() const;
  const OpRef& false_value() const;

  static OpRef Create(const OpRef& cond, const OpRef& true_value,
                      const OpRef& false_value);

  static bool classof(const Operation* op);
};

/**
 * Integer comparison operation.
 */
class ICmpOp : public BinaryOp {
private:
  ICmpOp(ICmpOpcode cmp, Type t, const OpRef& lhs, const OpRef& rhs);

public:
  ICmpOpcode comparison() const;

  /**
   * Whether the comparison performed by this operation is a signed one.
   *
   * Note that EQ and NE are not considered to be signed or unsigned.
   */
  bool is_signed() const;

  /**
   * Whether the comparison performed by this operation is an unsigned one.
   *
   * Note that EQ and NE are not considered to be signed or unsigned.
   */
  bool is_unsigned() const;

  static OpRef CreateICmp(ICmpOpcode cmp, const OpRef& lhs, const OpRef& rhs);
  static OpRef CreateICmp(ICmpOpcode cmp, int64_t lhs, const OpRef& rhs);
  static OpRef CreateICmp(ICmpOpcode cmp, const OpRef& lhs, int64_t rhs);

#define CAFFEINE_DECL_ICMP_CREATE_VARIANT(opcode)                              \
  static OpRef CreateICmp##opcode(const OpRef& lhs, const OpRef& rhs) {        \
    return CreateICmp(ICmpOpcode::opcode, lhs, rhs);                           \
  }                                                                            \
  static OpRef CreateICmp##opcode(int64_t lhs, const OpRef& rhs) {             \
    return CreateICmp(ICmpOpcode::opcode, lhs, rhs);                           \
  }                                                                            \
  static OpRef CreateICmp##opcode(const OpRef& lhs, int64_t rhs) {             \
    return CreateICmp(ICmpOpcode::opcode, lhs, rhs);                           \
  }                                                                            \
  static_assert(true)

  CAFFEINE_DECL_ICMP_CREATE_VARIANT(EQ);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(NE);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(UGT);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(UGE);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(ULT);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(ULE);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(SGT);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(SGE);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(SLT);
  CAFFEINE_DECL_ICMP_CREATE_VARIANT(SLE);

#undef CAFFEINE_DECL_ICMP_CREATE_VARIANT
  static bool classof(const Operation* op);
};

/**
 * Floating-point comparison operation.
 */
class FCmpOp : public BinaryOp {
private:
  FCmpOp(FCmpOpcode cmp, Type t, const OpRef& lhs, const OpRef& rhs);

public:
  FCmpOpcode comparison() const;

  // Whether this comparison is an ordered one
  bool is_ordered() const;
  // Whether this comparison is an unordered one
  bool is_unordered() const;

  static OpRef CreateFCmp(FCmpOpcode cmp, const OpRef& lhs, const OpRef& rhs);

  static bool classof(const Operation* op);
};

/**
 * Memory allocation operation.
 *
 * This operation creates a new symbolic array that is filled with a default
 * value (of type i8). It is meant to be used for modelling allocations (e.g.
 * malloc or alloca).
 */
class AllocOp : public ArrayBase {
private:
  AllocOp(const OpRef& size, const OpRef& defaultval);

public:
  OpRef size() const override;
  const OpRef& default_value() const;

  static OpRef Create(const OpRef& size, const OpRef& defaultval);

  static bool classof(const Operation* op);
};

/**
 * Memory load operation.
 *
 * This loads a single byte (represented as an i8) from within a data array.
 */
class LoadOp : public Operation {
private:
  LoadOp(const OpRef& data, const OpRef& offset);

public:
  const OpRef& data() const;
  const OpRef& offset() const;

  static OpRef Create(const OpRef& data, const OpRef& offset);

  static bool classof(const Operation* op);
};

/**
 * Memory store operation.
 *
 * This writes a single byte into a data array and yields the new array with the
 * byte at index offset replaced by value.
 */
class StoreOp : public ArrayBase {
private:
  StoreOp(const OpRef& data, const OpRef& offset, const OpRef& value);

public:
  OpRef size() const override;
  const OpRef& data() const;
  const OpRef& offset() const;
  const OpRef& value() const;

  static OpRef Create(const OpRef& data, const OpRef& offset,
                      const OpRef& value);

  static bool classof(const Operation* op);
};

/**
 * Undefined value.
 *
 * Each time this is used it can correspond to any possible bitpattern of
 * it's corresponding type. The resolved value does not have to be consistent
 * between uses of the same value.
 */
class Undef : public Operation {
private:
  Undef(const Type& t);

public:
  static OpRef Create(const Type& t);

  static bool classof(const Operation* op);
};

/**
 * An array with symbolic contents but a fixed size.
 */
class FixedArray final : public ArrayBase {
private:
  FixedArray(Type t, const PersistentArray<OpRef>& data);

public:
  const PersistentArray<OpRef>& data() const;
  OpRef size() const override;

  size_t num_operands() const override;

  OpRef with_new_operands(llvm::ArrayRef<OpRef> operands) const override;

  const OpRef& operand_at(size_t i) const override;

  static OpRef Create(Type index_ty, const PersistentArray<OpRef>& data);
  static OpRef Create(Type index_ty, const OpRef& value, size_t size);

  static bool classof(const Operation* op);
};

class FunctionObject final : public Operation {
private:
  FunctionObject(llvm::Function* function);

public:
  llvm::Function* function() const;

  static OpRef Create(llvm::Function* function);

  static bool classof(const Operation* op);
};

} // namespace caffeine

#include "caffeine/IR/Operation.inl"

#endif
