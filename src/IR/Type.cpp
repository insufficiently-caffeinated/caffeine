#include "caffeine/IR/Type.h"

#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>
#include <llvm/ADT/Hashing.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Type.h>

#include <iostream>

using llvm::LLVMContext;

namespace caffeine {

static uint32_t divceil(uint32_t x, uint32_t y) {
  return (x + (y - 1)) / y;
}

Type::Type(Kind kind, uint32_t desc, llvm::Type* inner)
    : llvm_(inner), kind_(kind), desc_(desc) {
  CAFFEINE_ASSERT(desc < (UINT32_C(1) << 24));
}

Type::Type(llvm::Type* type) : Type(Type::from_llvm(type)) {}

Type Type::int_ty(uint32_t bitwidth) {
  CAFFEINE_ASSERT(bitwidth != 0 && bitwidth < (UINT32_C(1) << 24));
  return Type(Integer, bitwidth);
}

Type Type::void_ty() {
  return Type(Void, 0);
}

Type Type::bool_ty() {
  return Type::int_ty(1);
}

Type Type::float_ty(uint32_t exponent, uint32_t mantissa) {
  CAFFEINE_ASSERT(exponent != 0 && exponent < (UINT32_C(1) << 12));
  CAFFEINE_ASSERT(mantissa != 0 && mantissa < (UINT32_C(1) << 12));

  return Type(FloatingPoint, (exponent << 12) | mantissa);
}

Type Type::pointer_ty() {
  return Type(Pointer, 0);
}

Type Type::array_ty(uint32_t bitwidth) {
  return Type(Array, bitwidth);
}

Type Type::vector_ty() {
  return Type(Vector, 0);
}

uint32_t Type::byte_size(const llvm::DataLayout& layout) const {
  // TODO: Might not always want to hardcode this?
  constexpr uint32_t bits_per_byte = 8;

  switch (kind()) {
  case Void:
    return 0;
  case Integer:
    return divceil(bitwidth(), bits_per_byte);
  case FloatingPoint:
    return divceil(mantissa_bits() + exponent_bits(), bits_per_byte);
  case Pointer:
    return layout.getPointerSize();
  case Function:
    CAFFEINE_ABORT("Functions have no size");
  case Array:
    CAFFEINE_ABORT("Arrays have no size");
  case Vector:
    CAFFEINE_ABORT("Vectors have no size");
  }

  CAFFEINE_UNREACHABLE("Unknown type kind");
}

Type Type::type_of(const llvm::APInt& apint) {
  return Type::int_ty(apint.getBitWidth());
}
Type Type::type_of(const llvm::APFloat& apfloat) {
  using llvm::APFloat;

  const llvm::fltSemantics& semantics = apfloat.getSemantics();

  uint32_t mantissa = APFloat::semanticsPrecision(semantics);
  uint32_t exponent = APFloat::semanticsSizeInBits(semantics) - mantissa;

  return Type::float_ty(exponent, mantissa);
}

Type Type::from_llvm(llvm::Type* type) {
  CAFFEINE_ASSERT(!type->isVectorTy(),
                  "vector types are not supported in expressions");
  CAFFEINE_ASSERT(!type->isTokenTy(),
                  "token types are not supported in expressions");
  CAFFEINE_ASSERT(!type->isMetadataTy(),
                  "metadata types are not supported in expressions");
  CAFFEINE_ASSERT(!type->isLabelTy(),
                  "label types are not supported in expressions");
  // Note: we can have pointers to structs, arrays, functions, etc. but
  //       we can't represent them directly.
  CAFFEINE_ASSERT(!type->isStructTy(),
                  "struct types are not supported in expressions");
  CAFFEINE_ASSERT(!type->isFunctionTy(),
                  "functions can only be used as function pointer types");
  CAFFEINE_ASSERT(!type->isArrayTy(),
                  "array types are not supported in expressions");

  if (type->isVoidTy())
    return Type::void_ty();

  // Handle floating point types
  if (type->isHalfTy())
    return Type::float_ty(5, 11);
  if (type->isFloatTy())
    return Type::float_ty(8, 24);
  if (type->isDoubleTy())
    return Type::float_ty(11, 53);
  if (type->isFP128Ty())
    return Type::float_ty(15, 113);
  if (type->isX86_FP80Ty())
    return Type::float_ty(15, 64);
  // Not entirely sure how the PPC implements it's FP128 type.
  // Leave it out for now.
  if (type->isPPC_FP128Ty())
    CAFFEINE_UNIMPLEMENTED();

  if (type->isIntegerTy())
    return Type::int_ty(type->getIntegerBitWidth());

  if (type->isPointerTy())
    return Type(Pointer, 0);

  if (type->isFunctionTy())
    return Type(Function, 0);

  CAFFEINE_UNIMPLEMENTED();
}

std::ostream& operator<<(std::ostream& os, const Type& t) {
  if (t.is_void())
    return os << "void";

  if (t.is_int())
    return os << "i" << t.bitwidth();

  if (t.is_float())
    // TODO: Need a way to distinguish between same-size floats
    //       for now this should work.
    return os << "f" << (t.mantissa_bits() + t.exponent_bits());

  if (t.is_pointer())
    return os << "void*";

  if (t.is_array())
    return os << "array";

  if (t.is_vector())
    return os << "vector";

  // TODO: Properly implement printing for any missing types
  return os << "<unimplemented>";
}

} // namespace caffeine
