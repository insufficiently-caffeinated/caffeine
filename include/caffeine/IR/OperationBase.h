#pragma once

#include "caffeine/ADT/PersistentArray.h"
#include "caffeine/IR/Symbol.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/CopyVTable.h"
#include <boost/container/static_vector.hpp>
#include <cstdint>
#include <initializer_list>
#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>
#include <llvm/Support/Casting.h>
#include <memory>
#include <variant>

// Get definitions of CAFFEINE_FCMP_BASE and CAFFEINE_ICMP_BASE
#include "caffeine/IR/Operation.def"

namespace llvm {
class Function;
}

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

  class operand_iterator;
} // namespace detail

class Operation;
class OperationData;
class Value;

using OpRef = std::shared_ptr<const Operation>;

enum class ICmpOpcode : uint8_t {
  // Note: The values here need to be kept in sync with the ones in
  // Operation.def
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
  // Note: The values here need to be kept in sync with the ones in
  // Operation.def
  EQ = 000,
  GT = 001,
  GE = 002,
  LT = 003,
  LE = 004,
  NE = 005,
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
 * 4. Add the correct delegation method to the OpVisitorBase class in Visitor.h.
 *    See the other methods there as to how it should be written.
 * 5. Add the opcode + its corresponding name to the switch statement within
 *    opcode_name.
 * 6. Add the logic required to handle the new opcode to ExprEvaluator within
 *    Visitor.cpp. This may also require adding new built-in methods to the
 *    Value type.
 */
class Operation : public std::enable_shared_from_this<Operation> {
protected:
  // Base opcode used for FCmp opcodes
  static constexpr uint16_t fcmp_base = CAFFEINE_FCMP_BASE;
  // Base opcode used for ICmp opcodes
  static constexpr uint16_t icmp_base = CAFFEINE_ICMP_BASE;

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

#define HANDLE_FULL_OP(opcode_, opname, opclass, op_base, op_nargs, op_aux)    \
  opcode_ = detail::opcode(op_base, op_nargs, op_aux),
#define HANDLE_UNARY_OP_LAST() UnaryOpLast,
#define HANDLE_UNARY_OP_FIRST(op) UnaryOpFirst = op,
#define HANDLE_BINARY_OP_LAST() BinaryOpLast,
#define HANDLE_BINARY_OP_FIRST(op) BinaryOpFirst = op,

#include "caffeine/IR/Operation.def"

    // This one should be last
    OpLast
  };

protected:
  Type type_;

  std::shared_ptr<OperationData> data_;
  llvm::SmallVector<OpRef, 4> operands_;

  friend llvm::hash_code hash_value(const Operation& op);

protected:
  Operation(std::unique_ptr<OperationData>&& data,
            std::initializer_list<OpRef> operands = {});
  Operation(std::unique_ptr<OperationData>&& data,
            llvm::ArrayRef<OpRef> operands);
  Operation(const std::shared_ptr<OperationData>& data,
            llvm::SmallVector<OpRef, 4>&& operands);

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

  // Get a static string that contains the opcode name. Returns "Unknown" on
  // unknown opcode.
  std::string_view opcode_name() const;
  static std::string_view opcode_name(Opcode op);

  // The type of this operation node.
  Type type() const;

  /**
   * Go from a pointer/cpp reference to a ref.
   *
   * This is only valid if the operation instance is already refcounted
   * (i.e. refcnt() > 0). If not, then calling as_ref will cause an assertion
   * failure.
   */
  ref<const Operation> as_ref() const;

  typedef detail::operand_iterator operand_iterator;
  typedef detail::operand_iterator const_operand_iterator;

  size_t num_operands() const;
  llvm::iterator_range<const_operand_iterator> operands() const;

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
  OpRef with_new_operands(llvm::ArrayRef<OpRef> operands) const;

  /**
   * Accessors to operand references.
   */
  const OpRef& operand_at(size_t idx) const;

  const std::shared_ptr<OperationData>& data() const;

  Operation(Operation&& op) = default;
  Operation& operator=(Operation&& op) = default;

  ~Operation() = default;

  /**
   * Create an operation instance directly from an OperationData instance and an
   * array of operands.
   */
  static OpRef CreateRaw(const std::shared_ptr<OperationData>& data,
                         llvm::ArrayRef<OpRef> operands = {});
  static OpRef CreateRaw(const std::shared_ptr<OperationData>& data,
                         llvm::SmallVector<OpRef, 4>&& operands);

protected:
  /**
   * Data stored within the aux bits of the opcode. Interpretation of this
   * depends from opcode to opcode so it is left for derived classes to expose
   * however they want.
   */
  uint16_t aux_data() const;

public:
  // Utility during debugging - should never actually be called by the program.
  void DebugPrint() const;

private:
  void reset();
};

class OperationData {
public:
  using Opcode = Operation::Opcode;

  OperationData();
  OperationData(Opcode op, Type t);
  virtual ~OperationData() = default;

public:
  // Indicate whether this OperationData instance is valid.
  bool valid() const {
    return opcode() != Opcode::Invalid;
  }

  // Get the opcode for this OperationData instance.
  Opcode opcode() const {
    return static_cast<Opcode>(opcode_);
  }

  // Get a static string that contains the opcode name. Returns "Unknown" on
  // unknown opcode.
  std::string_view opcode_name() const;
  static std::string_view opcode_name(Opcode op);

  // The type of this OperationData instance.
  Type type() const {
    return type_;
  }

  /**
   * Data stored within the aux bits of the opcode. Interpretation of this
   * depends from opcode to opcode so it is left for derived classes to expose
   * however they want.
   */
  uint16_t aux_data() const {
    return detail::opcode_aux(opcode());
  }

  bool operator==(const OperationData& op) const;
  bool operator!=(const OperationData& op) const;

  std::unique_ptr<OperationData> clone() const;

  static bool classof(const Operation*) {
    return true;
  }

  OperationData(OperationData&&) = delete;
  OperationData(const OperationData&) = delete;
  OperationData& operator=(OperationData&&) = delete;
  OperationData& operator=(const OperationData&) = delete;

  friend llvm::hash_code hash_value(const OperationData& op);

protected:
  // Hash any data stored in the derived members of this class.
  virtual llvm::hash_code hash() const {
    return 0;
  }

private:
  Type type_;
  Opcode opcode_;
};

std::ostream& operator<<(std::ostream& os, const Operation& op);
std::ostream& operator<<(std::ostream& os, Operation::Opcode opcode);

} // namespace caffeine
