#ifndef CAFFEINE_IR_OPERATION_H
#define CAFFEINE_IR_OPERATION_H

#include <cstdint>
#include <string>

#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>
#include <llvm/ADT/iterator_range.h>
#include <llvm/Support/Casting.h>

#include "caffeine/ADT/Ref.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

namespace detail {
  // This is meant for internal use within Operation only.
  constexpr uint16_t opcode(uint16_t op, uint16_t nargs, uint16_t aux = 0) {
    if (nargs >= 4)
      CAFFEINE_ABORT("invalid number of arguments for opcode");
    if (nargs >= 0x10)
      CAFFEINE_ABORT("aux data was too large");
    return (op << 6) | (aux << 2) | nargs;
  }

  template <typename T>
  class double_deref_iterator;
} // namespace detail

enum class ICmpOpcode : uint8_t {
  EQ = 0x8,
  NE = 0x9,
  UGT = (0 << 2) | 0x0,
  UGE = (0 << 2) | 0x1,
  ULT = (0 << 2) | 0x2,
  ULE = (0 << 2) | 0x3,
  SGT = (1 << 2) | 0x0,
  SGE = (1 << 2) | 0x1,
  SLT = (1 << 2) | 0x2,
  SLE = (1 << 2) | 0x3
};

enum class FCmpOpcode : uint8_t {
  OEQ = 000,
  OGT = 001,
  OGE = 002,
  OLT = 003,
  OLE = 004,
  ONE = 005,
  ORD = 006,
  UEQ = 010,
  UGT = 011,
  UGE = 012,
  ULT = 013,
  ULE = 014,
  UNE = 015,
  UNO = 016,
};

/**
 * An individual expression node.
 *
 * In general, an expression node has
 * 1. An opcode
 * 2. A type
 * 3. 0-3 operands
 *
 * The base operation class provides access to operands, types, and the
 * opcode. Custom payloads (e.g. for constants) can only be accessed by
 * first downcasting to the relevant class using llvm::dyn_cast.
 *
 * All derived operation types should have the same as the base Operation
 * class (no new members) so it will always be safe to copy Operation
 * instances around.
 *
 * Adding a new opcode
 * ===================
 * To define a new opcode
 *
 * 1. Add the actual opcode to the Opcode enum within Operation. Make sure
 *    to properly set the embedded operand count.
 * 2. (Optional) Define a new derived class that provides opcode-specific
 *    helper functions. It will also need the correct member functions
 *    derived so that llvm::dyn_cast and llvm::isa work.
 * 3. Add a builder function `CreateXXX` to the proper derived class that
 *    builds the correct Operation instance.
 */
class Operation {
public:
  /**
   * Notes on bit representation:
   *  - bits 0..1 contain the number of arguments
   *    (note that ConstantInt and ConstantFloat have 0)
   *  - bits 2..6 are used for instruction-specific data
   *    (e.g. comparison operation for fcmp variants) or grouping various
   *    opcodes together when they don't have auxiliary data.
   *  - the remaining bits are the opcode number.
   */
  enum Opcode : uint16_t {
    Invalid = 0,

    // Constants
    Constant = detail::opcode(1, 0, 2),
    ConstantInt = detail::opcode(1, 0, 0),
    ConstantFloat = detail::opcode(1, 0, 1),

    // Integer opcodes
    Add = detail::opcode(3, 2),
    Sub = detail::opcode(4, 2),
    Mul = detail::opcode(5, 2),
    UDiv = detail::opcode(6, 2),
    SDiv = detail::opcode(7, 2),
    URem = detail::opcode(8, 2),
    SRem = detail::opcode(9, 2),

    And = detail::opcode(10, 2),
    Or = detail::opcode(11, 2),
    Xor = detail::opcode(12, 2),
    Shl = detail::opcode(13, 2),
    LShr = detail::opcode(14, 2),
    AShr = detail::opcode(15, 2),
    Not = detail::opcode(16, 1),

    // Floating-point opcodes
    FAdd = detail::opcode(17, 2),
    FSub = detail::opcode(18, 2),
    FMul = detail::opcode(19, 2),
    FDiv = detail::opcode(20, 2),
    FRem = detail::opcode(21, 2),
    FNeg = detail::opcode(22, 1),

    // Conversion opcodes
    Trunc = detail::opcode(23, 1),
    SExt = detail::opcode(24, 1),
    ZExt = detail::opcode(25, 1),
    FpTrunc = detail::opcode(26, 1),
    FpExt = detail::opcode(27, 1),
    FpToUI = detail::opcode(28, 1),
    FpToSI = detail::opcode(29, 1),
    UIToFp = detail::opcode(30, 1),
    SIToFp = detail::opcode(31, 1),

    // Integer comparison operations
    ICmpEq = detail::opcode(32, 2, (uint16_t)ICmpOpcode::EQ),
    ICmpNe = detail::opcode(32, 2, (uint16_t)ICmpOpcode::NE),
    ICmpUgt = detail::opcode(32, 2, (uint16_t)ICmpOpcode::UGT),
    ICmpUge = detail::opcode(32, 2, (uint16_t)ICmpOpcode::UGE),
    ICmpUlt = detail::opcode(32, 2, (uint16_t)ICmpOpcode::ULT),
    ICmpUle = detail::opcode(32, 2, (uint16_t)ICmpOpcode::ULE),
    ICmpSgt = detail::opcode(32, 2, (uint16_t)ICmpOpcode::SGT),
    ICmpSge = detail::opcode(32, 2, (uint16_t)ICmpOpcode::SGE),
    ICmpSlt = detail::opcode(32, 2, (uint16_t)ICmpOpcode::SLT),
    ICmpSle = detail::opcode(32, 2, (uint16_t)ICmpOpcode::SLE),

    // Floating-point comparison operations
    // See the corresponding predicates in llvm's CmpInst to understand
    // what each of these mean.
    // TODO: Should these be broken down?
    FCmpOeq = detail::opcode(33, 2, (uint16_t)FCmpOpcode::OEQ),
    FCmpOGt = detail::opcode(33, 2, (uint16_t)FCmpOpcode::OGT),
    FCmpOge = detail::opcode(33, 2, (uint16_t)FCmpOpcode::OGE),
    FCmpOlt = detail::opcode(33, 2, (uint16_t)FCmpOpcode::OLT),
    FCmpOle = detail::opcode(33, 2, (uint16_t)FCmpOpcode::OLE),
    FCmpOne = detail::opcode(33, 2, (uint16_t)FCmpOpcode::ONE),
    FCmpOrd = detail::opcode(33, 2, (uint16_t)FCmpOpcode::ORD),
    FCmpUno = detail::opcode(33, 2, (uint16_t)FCmpOpcode::UNO),
    FCmpUeq = detail::opcode(33, 2, (uint16_t)FCmpOpcode::UEQ),
    FCmpUgt = detail::opcode(33, 2, (uint16_t)FCmpOpcode::UGT),
    FCmpUge = detail::opcode(33, 2, (uint16_t)FCmpOpcode::UGE),
    FCmpUlt = detail::opcode(33, 2, (uint16_t)FCmpOpcode::ULT),
    FCmpUle = detail::opcode(33, 2, (uint16_t)FCmpOpcode::ULE),
    FCmpUne = detail::opcode(33, 2, (uint16_t)FCmpOpcode::UNE),

    // Other instructions
    Select = detail::opcode(34, 3)
  };

protected:
  uint16_t opcode_;
  uint16_t dummy_ = 0; // Unused, used for padding
  // When multithreading is implemented this will need to become atomic.
  //
  // Needs to be mutable so that const refs (ref<const Operation>) work.
  mutable uint32_t refcount = 0;
  Type type_;

  union { // TODO: Pointers? Might need a ConstantPointer type
    ref<Operation> operands_[3];
    llvm::APInt iconst_;
    llvm::APFloat fconst_;
    std::string name_;
  };

  // So ref can get at the refcount field.
  //
  // Ideally, this be a friend only for ref<[const] Operation, Deleter>
  // but C++ doesn't allow friend declarations to refer to partial
  // specializations we'll have to settle for all ref instances being
  // friends with us.
  template <typename T, typename Deleter>
  friend class ref;

  friend llvm::hash_code hash_value(const Operation& op);

protected:
  // Specialization that provides some sanity checking when
  // the caller is using a fixed-size array.
  template <size_t N>
  Operation(Opcode op, Type t, ref<Operation> (&operands)[N]);
  Operation(Opcode op, Type t, ref<Operation>* operands);

  Operation(Opcode op, const llvm::APInt& iconst);
  Operation(Opcode op, llvm::APInt&& iconst);

  Operation(Opcode op, const llvm::APFloat& fconst);
  Operation(Opcode op, llvm::APFloat&& fconst);

  Operation(Opcode op, Type t, const std::string& name);

  Operation(Opcode op, Type t, const ref<Operation>& op0);
  Operation(Opcode op, Type t, const ref<Operation>& op0,
            const ref<Operation>& op1);
  Operation(Opcode op, Type t, const ref<Operation>& op0,
            const ref<Operation>& op1, const ref<Operation>& op2);

  Operation();

public:
  /**
   * Indicate whether this Operation instance is valid.
   *
   * It's not possible to construct an invalid instance directly but one
   * can be created by moving out of an existing operation.
   */
  bool valid() const;

  // Get the opcode
  uint16_t opcode() const;

  // Read-only access to the refcount. If this is 0 then this is not a
  // reference-counted Operation instance.
  uint32_t refcnt() const;

  // The type of this operation node.
  Type type() const;

  /**
   * Go from a pointer/cpp reference to a ref.
   *
   * This is only valid if the operation instance is already refcounted
   * (i.e. refcnt() > 0). If not, then calling as_ref will cause an assertion
   * failure.
   */
  ref<Operation> as_ref();
  ref<const Operation> as_ref() const;

  typedef detail::double_deref_iterator<ref<Operation>> operand_iterator;
  typedef detail::double_deref_iterator<const ref<Operation>>
      const_operand_iterator;

  size_t num_operands() const;
  llvm::iterator_range<operand_iterator> operands();
  llvm::iterator_range<const_operand_iterator> operands() const;

  bool operator==(const Operation& op) const;
  bool operator!=(const Operation& op) const;

  bool is_constant() const;

  // Need to manually define these since we have an internal union.
  Operation(const Operation& op) noexcept;
  Operation(Operation&& op) noexcept;

  Operation& operator=(const Operation& op) noexcept;
  Operation& operator=(Operation&& op) noexcept;

  ~Operation();

protected:
  /**
   * Data stored within the aux bits of the opcode. Interpretation of this
   * depends from opcode to opcode so it is left for derived classes to expose
   * however they want.
   */
  uint16_t aux_data() const;

private:
  void invalidate() noexcept;
};

/**
 * Symbolic constant.
 *
 * Symbolic constants are uniquely identified by a string name.
 */
class Constant : public Operation {
private:
  Constant(Type t, const std::string& name);
  Constant(Type t, std::string&& name);

public:
  std::string& name();
  const std::string& name() const;

  static ref<Operation> Create(Type t, const std::string& name);
  static ref<Operation> Create(Type t, std::string&& name);

  static bool classof(const Operation* op);
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
  llvm::APInt& value();
  const llvm::APInt& value() const;

  static ref<Operation> Create(const llvm::APInt& iconst);
  static ref<Operation> Create(llvm::APInt&& iconst);

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
  llvm::APFloat& value();
  const llvm::APFloat& value() const;

  static ref<Operation> Create(const llvm::APFloat& fconst);
  static ref<Operation> Create(llvm::APFloat&& fconst);

  static bool classof(const Operation* op);
};

/**
 * Binary expression (e.g. +, -, etc.).
 *
 * Any more specific operations with 2 operands should inherit from this class.
 */
class BinaryOp : public Operation {
protected:
  BinaryOp(Opcode op, Type t, const ref<Operation>& lhs,
           const ref<Operation>& rhs);

public:
  const ref<Operation>& lhs() const;
  const ref<Operation>& rhs() const;

  ref<Operation>& lhs();
  ref<Operation>& rhs();

  static ref<Operation> Create(Opcode op, const ref<Operation>& lhs,
                               const ref<Operation>& rhs);

  static ref<Operation> CreateAdd(const ref<Operation>& lhs,
                                  const ref<Operation>& rhs);
  static ref<Operation> CreateSub(const ref<Operation>& lhs,
                                  const ref<Operation>& rhs);
  static ref<Operation> CreateMul(const ref<Operation>& lhs,
                                  const ref<Operation>& rhs);
  static ref<Operation> CreateUDiv(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateSDiv(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateURem(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateSRem(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);

  static ref<Operation> CreateAnd(const ref<Operation>& lhs,
                                  const ref<Operation>& rhs);
  static ref<Operation> CreateOr(const ref<Operation>& lhs,
                                 const ref<Operation>& rhs);
  static ref<Operation> CreateXor(const ref<Operation>& lhs,
                                  const ref<Operation>& rhs);
  static ref<Operation> CreateShl(const ref<Operation>& lhs,
                                  const ref<Operation>& rhs);
  static ref<Operation> CreateLShr(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateAShr(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);

  static ref<Operation> CreateFAdd(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateFSub(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateFMul(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateFDiv(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateFRem(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);

  static bool classof(const Operation* op);
};

/**
 * Unary operations (e.g. not and fneg).
 *
 * Any more specific unary operations should inherit from this class.
 */
class UnaryOp : public Operation {
protected:
  UnaryOp(Opcode op, Type t, const ref<Operation>& operand);

public:
  ref<Operation>& operand();
  const ref<Operation>& operand() const;

  static ref<Operation> Create(Opcode op, const ref<Operation>& operand);
  static ref<Operation> CreateNot(const ref<Operation>& operand);
  static ref<Operation> CreateFNeg(const ref<Operation>& operand);

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
  SelectOp(Type t, const ref<Operation>& cond, const ref<Operation>& true_val,
           const ref<Operation>& false_val);

public:
  ref<Operation>& condition();
  ref<Operation>& true_value();
  ref<Operation>& false_value();

  const ref<Operation>& condition() const;
  const ref<Operation>& true_value() const;
  const ref<Operation>& false_value() const;

  static ref<Operation> Create(const ref<Operation>& cond,
                               const ref<Operation>& true_value,
                               const ref<Operation>& false_value);

  bool classof(const Operation* op);
};

/**
 * Integer comparison operation.
 */
class ICmpOp : public BinaryOp {
private:
  ICmpOp(ICmpOpcode cmp, Type t, const ref<Operation>& lhs,
         const ref<Operation>& rhs);

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

  static ref<Operation> CreateICmp(ICmpOpcode cmp, const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);

  bool classof(const Operation* op);
};

/**
 * Floating-point comparison operation.
 */
class FCmpOp : public BinaryOp {
private:
  FCmpOp(FCmpOpcode cmp, Type t, const ref<Operation>& lhs,
         const ref<Operation>& rhs);

public:
  FCmpOpcode comparison() const;

  // Whether this comparison is an ordered one
  bool is_ordered() const;
  // Whether this comparison is an unordered one
  bool is_unordered() const;

  static ref<Operation> CreateFCmp(FCmpOpcode cmp, const ref<Operation>& lhs,
                                   const ref<Operation>& rhs);

  bool classof(const Operation* op);
};

} // namespace caffeine

#include "caffeine/IR/Operation.inl"

#endif
