#ifndef CAFFEINE_IR_TYPE_H
#define CAFFEINE_IR_TYPE_H

#include <cstdint>
#include <optional>

#include "caffeine/ADT/Ref.h"

namespace llvm {
class APInt;
class APFloat;
class Type;
class FunctionType;
class LLVMContext;
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
 */
class Type {
public:
  enum Kind : uint8_t {
    Void,
    Integer,
    FloatingPoint,
    Pointer,
    FunctionPointer
  };

private:
  llvm::Type* llvm_;
  uint32_t kind_ : 8;
  uint32_t desc_ : 24;

  Type(Kind kind, uint32_t desc, llvm::Type* inner = nullptr);

public:
  explicit Type(llvm::Type* type);

  Kind kind() const;

  bool is_void() const;
  bool is_int() const;
  bool is_float() const;
  bool is_pointer() const;
  bool is_function_pointer() const;

  uint32_t bitwidth() const;
  uint32_t mantissa_bits() const;
  uint32_t exponent_bits() const;

  // Signature of a function pointer.
  llvm::FunctionType* signature() const;

  static Type int_ty(uint32_t bitwidth);
  static Type void_ty();
  static Type float_ty(uint32_t exponent, uint32_t mantissa);
  // TODO: Address spaces? Not sure if we want to model them
  static Type pointer_ty();

  static Type from_llvm(llvm::Type* type);

  static Type type_of(const llvm::APInt& apint);
  static Type type_of(const llvm::APFloat& apfloat);

  bool operator==(const Type& b) const;
  bool operator!=(const Type& b) const;

  Type(const Type&) = default;
  Type(Type&&) = default;

  Type& operator=(const Type&) = default;
  Type& operator=(Type&&) = default;
};

} // namespace caffeine

#include "caffeine/IR/Type.inl"

#endif
