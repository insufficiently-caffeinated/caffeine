#ifndef CAFFEINE_IR_TYPE_H
#define CAFFEINE_IR_TYPE_H

#include <cstdint>
#include <iosfwd>
#include <optional>

#include <llvm/ADT/Hashing.h>

#include "caffeine/ADT/Ref.h"

namespace llvm {
class APInt;
class APFloat;
class Type;
class FunctionType;
class LLVMContext;
class DataLayout;
} // namespace llvm

namespace caffeine {

/**
 * Expression type.
 *
 * This is deliberately meant to be a simplification of LLVM's type hierachy. It
 * has 5 main type kinds.
 * - Void: An empty type. No expression node should have this type but it is
 *   useful for marking an invalid node.
 * - Integer: An integer type. Supports all integer bitwidths supported in LLVM.
 * - Floating Point: A floating point type. Supports arbitrary exponent and
 *   mantissa sizes up to 2^12 - 1. Note that the mantissa size includes the
 *   leading 1 bit (this is implicit in the binary representation for IEEE 754).
 * - Pointer: An untyped pointer. This is effectively an integer with a
 *   target-defined width.
 * - Function Pointer.
 * - Byte array. This is the raw type of a memory allocation. It has a bitwidth
 *   which is the width of the integer used to index into the array.
 */
class Type {
public:
  enum Kind : uint8_t {
    Void,
    Integer,
    FloatingPoint,
    Pointer,
    FunctionPointer,
    Array,
    Vector
  };

private:
  llvm::Type* llvm_;
  uint32_t kind_ : 8;
  uint32_t desc_ : 24;

  Type(Kind kind, uint32_t desc, llvm::Type* inner = nullptr);

  friend llvm::hash_code hash_value(const Type& type);

public:
  explicit Type(llvm::Type* type);

  Kind kind() const;

  bool is_void() const;
  bool is_int() const;
  bool is_float() const;
  bool is_pointer() const;
  bool is_function_pointer() const;
  bool is_array() const;
  bool is_vector() const;

  uint32_t bitwidth() const;
  uint32_t mantissa_bits() const;
  uint32_t exponent_bits() const;

  /**
   * Size of the current type in bytes under the given data layout.
   *
   * Array types have no size and will cause an assertion failure.
   */
  uint32_t byte_size(const llvm::DataLayout& layout) const;

  // Signature of a function pointer.
  llvm::FunctionType* signature() const;

  static Type int_ty(uint32_t bitwidth);
  static Type void_ty();
  static Type float_ty(uint32_t exponent, uint32_t mantissa);
  static Type bool_ty();
  // TODO: Address spaces? Not sure if we want to model them
  static Type pointer_ty();
  // Note: Bitwidth is the bitwidth of the integer used to
  //       index into the byte array.
  static Type array_ty(uint32_t bitwidth);
  static Type vector_ty();

  static Type from_llvm(llvm::Type* type);

  static Type type_of(const llvm::APInt& apint);
  static Type type_of(const llvm::APFloat& apfloat);

  template <typename T>
  static Type type_of();

  bool operator==(const Type& b) const;
  bool operator!=(const Type& b) const;

  Type(const Type&) = default;
  Type(Type&&) = default;

  Type& operator=(const Type&) = default;
  Type& operator=(Type&&) = default;
};

std::ostream& operator<<(std::ostream& os, const Type& t);

} // namespace caffeine

#include "caffeine/IR/Type.inl"

#endif
