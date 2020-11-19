#include "caffeine/IR/Type.h"

#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Type.h>

using llvm::LLVMContext;

namespace caffeine {

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

Type Type::float_ty(uint32_t exponent, uint32_t mantissa) {
  CAFFEINE_ASSERT(exponent != 0 && exponent < (UINT32_C(1) << 12));
  CAFFEINE_ASSERT(mantissa != 0 && mantissa < (UINT32_C(1) << 12));

  return Type(FloatingPoint, (exponent << 12) | mantissa);
}

Type Type::pointer_ty() {
  return Type(Pointer, 0);
}

llvm::FunctionType* Type::signature() const {
  CAFFEINE_ASSERT(is_function_pointer());

  auto fnty = llvm::dyn_cast_or_null<llvm::FunctionType>(llvm_);
  CAFFEINE_ASSERT(fnty, "function type didn't contain a signature");

  return fnty;
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

  if (type->isPointerTy()) {
    auto contained = type->getContainedType(0);

    if (contained->isFunctionTy())
      return Type(FunctionPointer, 0, contained);
    return Type(Pointer, 0);
  }

  CAFFEINE_UNIMPLEMENTED();
}

} // namespace caffeine
