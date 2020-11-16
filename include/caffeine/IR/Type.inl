#ifndef CAFFEINE_IR_TYPE_INL
#define CAFFEINE_IR_TYPE_INL

#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

Type::Kind Type::kind() const {
  return static_cast<Kind>(kind_);
}

bool Type::is_int() const {
  return kind() == Integer;
}
bool Type::is_float() const {
  return kind() == FloatingPoint;
}
bool Type::is_pointer() const {
  return kind() == Pointer;
}
bool Type::is_void() const {
  return kind() == Void;
}
bool Type::is_function_pointer() const {
  return kind() == FunctionPointer;
}

uint32_t Type::bitwidth() const {
  CAFFEINE_ASSERT(is_int());
  return desc_;
}
uint32_t Type::mantissa_bits() const {
  CAFFEINE_ASSERT(is_float());
  return desc_ & 0xFFF;
}
uint32_t Type::exponent_bits() const {
  CAFFEINE_ASSERT(is_float());
  return desc_ >> 12;
}

bool Type::operator==(const Type& b) const {
  return kind_ == b.kind_ && desc_ == b.desc_ && llvm_ == b.llvm_;
}
bool Type::operator!=(const Type& b) const {
  return !(*this == b);
}

}

#endif
