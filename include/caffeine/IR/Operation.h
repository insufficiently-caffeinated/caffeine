#ifndef CAFFEINE_IR_OPERATION_H
#define CAFFEINE_IR_OPERATION_H

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
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/CopyVTable.h"

namespace caffeine {

namespace detail {
  // This is meant for internal use within Operation only.
  constexpr uint16_t opcode(uint16_t op, uint16_t nargs, uint16_t aux = 0) {
    if (nargs >= 8)
      CAFFEINE_ABORT("invalid number of arguments for opcode");
    if (aux >= 0x10)
      CAFFEINE_ABORT("aux data was too large");
    return (op << 7) | (aux << 3) | nargs;
  }

  constexpr uint16_t opcode_nargs(uint16_t op) {
    return op & 0x7;
  }

  constexpr uint16_t opcode_aux(uint16_t op) {
    return (op >> 3) & 0xF;
  }

  constexpr uint16_t opcode_base(uint16_t op) {
    return op >> 7;
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
  EQ = 000,
  GT = 001,
  GE = 002,
  LT = 003,
  LE = 004,
  NE = 005,
};

/**
 * Identifier for a symbolic constant.
 *
 * It can be either a string or a number as required. Numeric symbol names are
 * usually used for internal symbolic values such as allocations. String ones
 * are usually used for user-specified symbolic values.
 */
class Symbol {
private:
  enum {
    Named = 0,
    Numbered = 1,
  };

  std::variant<std::string, uint64_t> value_;

public:
  Symbol(const std::string& name);
  Symbol(std::string&& name);
  Symbol(uint64_t number);

  template <size_t N>
  Symbol(const char (&name)[N]);

  bool is_named() const;
  bool is_numbered() const;

  std::string_view name() const;
  uint64_t number() const;

  bool operator==(const Symbol& symbol) const;
  bool operator!=(const Symbol& symbol) const;

  friend llvm::hash_code hash_value(const Symbol& symbol);
};

std::ostream& operator<<(std::ostream& os, const Symbol& symbol);

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
 * 4. Add the correct delegation method to the OpVisitorBase class in Visitor.h.
 *    See the other methods there as to how it should be written.
 * 5. Add the opcode + its corresponding name to the switch statement within
 *    opcode_name.
 * 6. Add the logic required to handle the new opcode to ExprEvaluator within
 *    Visitor.cpp. This may also require adding new built-in methods to the
 *    Value type.
 */
class Operation : private CopyVTable {
protected:
  // Base opcode used for FCmp opcodes
  static constexpr uint16_t fcmp_base = 4;
  // Base opcode used for ICmp opcodes
  static constexpr uint16_t icmp_base = 5;

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
    ConstantNamed = detail::opcode(1, 0, 0),
    ConstantNumbered = detail::opcode(1, 0, 1),
    ConstantInt = detail::opcode(1, 0, 5),
    ConstantFloat = detail::opcode(1, 0, 6),
    ConstantArray = detail::opcode(1, 1, 7),

    /**
     * An unnamed symbolic constant that can have any value whenever it is
     * used. Has the same semantics as LLVM's undef.
     *
     * It is valid for solvers to have any value for the undef constant.
     */
    Undef = detail::opcode(1, 0, 15),

    /* Binary Opcodes */
    Add = detail::opcode(2, 2, 0),
    Sub = detail::opcode(2, 2, 1),
    Mul = detail::opcode(2, 2, 2),
    UDiv = detail::opcode(2, 2, 3),
    SDiv = detail::opcode(2, 2, 4),
    URem = detail::opcode(2, 2, 5),
    SRem = detail::opcode(2, 2, 6),

    And = detail::opcode(2, 2, 7),
    Or = detail::opcode(2, 2, 8),
    Xor = detail::opcode(2, 2, 9),
    Shl = detail::opcode(2, 2, 10),
    LShr = detail::opcode(2, 2, 11),
    AShr = detail::opcode(2, 2, 12),

    // Floating-point opcodes
    FAdd = detail::opcode(3, 2, 0),
    FSub = detail::opcode(3, 2, 1),
    FMul = detail::opcode(3, 2, 2),
    FDiv = detail::opcode(3, 2, 4),
    FRem = detail::opcode(3, 2, 5),

    // Integer comparison operations
    ICmpEq = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::EQ),
    ICmpNe = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::NE),
    ICmpUgt = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::UGT),
    ICmpUge = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::UGE),
    ICmpUlt = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::ULT),
    ICmpUle = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::ULE),
    ICmpSgt = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::SGT),
    ICmpSge = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::SGE),
    ICmpSlt = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::SLT),
    ICmpSle = detail::opcode(icmp_base, 2, (uint16_t)ICmpOpcode::SLE),

    // Floating-point comparison operations
    // See the corresponding predicates in llvm's CmpInst to understand
    // what each of these mean.
    // TODO: Should these be broken down?
    FCmpEq = detail::opcode(fcmp_base, 2, (uint16_t)FCmpOpcode::EQ),
    FCmpGt = detail::opcode(fcmp_base, 2, (uint16_t)FCmpOpcode::GT),
    FCmpGe = detail::opcode(fcmp_base, 2, (uint16_t)FCmpOpcode::GE),
    FCmpLt = detail::opcode(fcmp_base, 2, (uint16_t)FCmpOpcode::LT),
    FCmpLe = detail::opcode(fcmp_base, 2, (uint16_t)FCmpOpcode::LE),
    FCmpNe = detail::opcode(fcmp_base, 2, (uint16_t)FCmpOpcode::NE),

    BinaryOpLast,
    BinaryOpFirst = Add,

    /* Unary Opcodes */
    Not = detail::opcode(10, 1, 0),
    FNeg = detail::opcode(10, 1, 1),
    FIsNaN = detail::opcode(10, 1, 2),

    // Conversion opcodes
    Trunc = detail::opcode(11, 1, 0),
    SExt = detail::opcode(11, 1, 1),
    ZExt = detail::opcode(11, 1, 2),
    FpTrunc = detail::opcode(11, 1, 3),
    FpExt = detail::opcode(11, 1, 4),
    FpToUI = detail::opcode(11, 1, 5),
    FpToSI = detail::opcode(11, 1, 6),
    UIToFp = detail::opcode(11, 1, 7),
    SIToFp = detail::opcode(11, 1, 8),
    Bitcast = detail::opcode(11, 1, 9),

    UnaryOpLast,
    UnaryOpFirst = Not,

    // Other instructions
    Select = detail::opcode(20, 3),
    FixedArray = detail::opcode(21, 0),

    // Allocation instructions
    /**
     * Create a new symbolic array that is filled with a default value.
     *
     * This is mean to be used for malloc and alloca. Constant arrays with
     * prefilled data should use FixedArray instead.
     */
    Alloc = detail::opcode(21, 2, 0),
    /**
     * Store a byte to a position within an array.
     */
    Store = detail::opcode(21, 3, 1),
    /**
     * Load a byte from a position within an array.
     */
    Load = detail::opcode(21, 2, 2),

    // This one should be last
    OpLast
  };

protected:
  using ConstantData = std::pair<Symbol, ref<Operation>>;
  using FixedData = PersistentArray<ref<Operation>>;
  using OpVec = boost::container::static_vector<ref<Operation>, 3>;
  using Inner = std::variant<std::monostate, OpVec, llvm::APInt, llvm::APFloat,
                             FixedData, ConstantData>;

  uint16_t opcode_;
  uint16_t dummy_ = 0; // Unused, used for padding
  // When multithreading is implemented this will need to become atomic.
  //
  // Needs to be mutable so that const refs (ref<const Operation>) work.
  mutable uint32_t refcount = 0;
  Type type_;
  Inner inner_;

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
  Operation(Opcode op, Type t, const Inner& inner);
  Operation(Opcode op, Type t, Inner&& inner);

  Operation(Opcode op, Type t, const ref<Operation>* operands);

  Operation(Opcode op, Type t, const ref<Operation>& op0);
  Operation(Opcode op, Type t, const ref<Operation>& op0,
            const ref<Operation>& op1);
  Operation(Opcode op, Type t, const ref<Operation>& op0,
            const ref<Operation>& op1, const ref<Operation>& op2);

  Operation();
  Operation(Opcode op, Type t);

  using CopyVTable::copy_vtable;

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

  // Get a static string that contains the opcode name. Returns "Unknown" on
  // unknown opcode.
  std::string_view opcode_name() const;
  static std::string_view opcode_name(Opcode op);

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

  /**
   * Get this operation as a ref, or create a new ref with a copy if it isn't
   * already a reference.
   */
  ref<Operation> into_ref() const;

  typedef detail::double_deref_iterator<ref<Operation>> operand_iterator;
  typedef detail::double_deref_iterator<const ref<Operation>>
      const_operand_iterator;

  virtual size_t num_operands() const;
  virtual llvm::iterator_range<operand_iterator> operands();
  virtual llvm::iterator_range<const_operand_iterator> operands() const;

  Operation& operator[](size_t idx);
  const Operation& operator[](size_t idx) const;

  bool operator==(const Operation& op) const;
  bool operator!=(const Operation& op) const;

  bool is_constant() const;

  template <typename T>
  bool is() const {
    return llvm::isa<T>(*this);
  }

  /**
   * Create a new operation using the same opcode as the current one but with
   * new operands.
   */
  virtual ref<Operation>
  with_new_operands(llvm::ArrayRef<ref<Operation>> operands) const;

  /**
   * Accessors to operand references.
   */
  virtual ref<Operation>& operand_at(size_t idx);
  virtual const ref<Operation>& operand_at(size_t idx) const;

  // Need to define this since refcount shouldn't be copied/moved.
  Operation(const Operation& op);
  Operation(Operation&& op) noexcept;

  Operation& operator=(const Operation& op);
  Operation& operator=(Operation&& op) noexcept;

  // Need to force operation to have a vtable
  virtual ~Operation() = default;

protected:
  /**
   * Data stored within the aux bits of the opcode. Interpretation of this
   * depends from opcode to opcode so it is left for derived classes to expose
   * however they want.
   */
  uint16_t aux_data() const;
};

std::ostream& operator<<(std::ostream& os, const Operation& op);

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
  virtual ref<Operation> size() const = 0;

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
  std::string_view name() const;
  uint64_t number() const;

  bool is_numbered() const;
  bool is_named() const;

  static ref<Operation> Create(Type t, const Symbol& symbol);
  static ref<Operation> Create(Type t, Symbol&& symbol);

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
  llvm::APInt& value();
  const llvm::APInt& value() const;

  static ref<Operation> Create(const llvm::APInt& iconst);
  static ref<Operation> Create(llvm::APInt&& iconst);
  // Specialization for creating boolean constants
  static ref<Operation> Create(bool value);

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
  static ref<Operation> Create(double value);

  static bool classof(const Operation* op);
};

/**
 * Symbolic array.
 */
class ConstantArray : public ArrayBase {
private:
  ConstantArray(Symbol&& symbol, const ref<Operation>& size);

public:
  ref<Operation> size() const override;

  const Symbol& symbol() const;

  static ref<Operation> Create(const Symbol& symbol,
                               const ref<Operation>& size);
  static ref<Operation> Create(Symbol&& symbol, const ref<Operation>& size);

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

  // Utility methods for creating integer arithmetic when one of the operations
  // is a constant.

#define CAFFEINE_DECL_BINOP_INT_CONST(op)                                      \
  static ref<Operation> Create##op(const ref<Operation>& lhs, int64_t rhs);    \
  static ref<Operation> Create##op(int64_t lhs, const ref<Operation>& rhs)

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
  UnaryOp(Opcode op, Type t, const ref<Operation>& operand);

public:
  ref<Operation>& operand();
  const ref<Operation>& operand() const;

  static ref<Operation> Create(Opcode op, const ref<Operation>& operand);
  static ref<Operation> Create(Opcode op, const ref<Operation>& operand,
                               Type returnType);
  static ref<Operation> CreateNot(const ref<Operation>& operand);
  static ref<Operation> CreateFNeg(const ref<Operation>& operand);
  static ref<Operation> CreateFIsNaN(const ref<Operation>& operand);

  static ref<Operation> CreateTrunc(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateZExt(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateSExt(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateFpTrunc(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateFpExt(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateFpToUI(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateFpToSI(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateUIToFp(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateSIToFp(Type tgt, const ref<Operation>& operand);
  static ref<Operation> CreateBitcast(Type tgt, const ref<Operation>& operand);

  /// Create a trunc operation or a zext operation as needed to convert operand
  /// to the required bitwidth. If the bitwidths are the same then does nothing.
  static ref<Operation> CreateTruncOrZExt(Type tgt,
                                          const ref<Operation>& operand);
  /// Create a trunc operation or a sext operation as needed to convert operand
  /// to the required bitwidth. If the bitwidths are the same then does nothing.
  static ref<Operation> CreateTruncOrSExt(Type tgt,
                                          const ref<Operation>& operand);

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

  static bool classof(const Operation* op);
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
  static ref<Operation> CreateICmp(ICmpOpcode cmp, int64_t lhs,
                                   const ref<Operation>& rhs);
  static ref<Operation> CreateICmp(ICmpOpcode cmp, const ref<Operation>& lhs,
                                   int64_t rhs);

  static bool classof(const Operation* op);
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
  AllocOp(const ref<Operation>& size, const ref<Operation>& defaultval);

public:
  ref<Operation> size() const override;

  ref<Operation>& default_value();
  const ref<Operation>& default_value() const;

  static ref<Operation> Create(const ref<Operation>& size,
                               const ref<Operation>& defaultval);

  static bool classof(const Operation* op);
};

/**
 * Memory load operation.
 *
 * This loads a single byte (represented as an i8) from within a data array.
 */
class LoadOp : public Operation {
private:
  LoadOp(const ref<Operation>& data, const ref<Operation>& offset);

public:
  ref<Operation>& data();
  const ref<Operation>& data() const;

  ref<Operation>& offset();
  const ref<Operation>& offset() const;

  static ref<Operation> Create(const ref<Operation>& data,
                               const ref<Operation>& offset);

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
  StoreOp(const ref<Operation>& data, const ref<Operation>& offset,
          const ref<Operation>& value);

public:
  ref<Operation> size() const override;

  ref<Operation>& data();
  const ref<Operation>& data() const;

  ref<Operation>& offset();
  const ref<Operation>& offset() const;

  ref<Operation>& value();
  const ref<Operation>& value() const;

  static ref<Operation> Create(const ref<Operation>& data,
                               const ref<Operation>& offset,
                               const ref<Operation>& value);

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
  static ref<Operation> Create(const Type& t);

  static bool classof(const Operation* op);
};

/**
 * An array with symbolic contents but a fixed size.
 */
class FixedArray final : public ArrayBase {
private:
  FixedArray(Type t, const PersistentArray<ref<Operation>>& data);

public:
  PersistentArray<ref<Operation>>& data();
  const PersistentArray<ref<Operation>>& data() const;
  ref<Operation> size() const override;

  size_t num_operands() const override;
  llvm::iterator_range<operand_iterator> operands() override;
  llvm::iterator_range<const_operand_iterator> operands() const override;

  ref<Operation>
  with_new_operands(llvm::ArrayRef<ref<Operation>> operands) const override;

  ref<Operation>& operand_at(size_t i) override;
  const ref<Operation>& operand_at(size_t i) const override;

  static ref<Operation> Create(Type index_ty,
                               const PersistentArray<ref<Operation>>& data);
  static ref<Operation> Create(Type index_ty, const ref<Operation>& value,
                               size_t size);

  static bool classof(const Operation* op);
};

} // namespace caffeine

#include "caffeine/IR/Operation.inl"

#endif
