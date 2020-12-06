#ifndef CAFFEINE_IR_TYPE_INL
#define CAFFEINE_IR_TYPE_INL

#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

#include <climits>

namespace caffeine {

inline Type::Kind Type::kind() const {
  return static_cast<Kind>(kind_);
}

inline bool Type::is_int() const {
  return kind() == Integer;
}
inline bool Type::is_float() const {
  return kind() == FloatingPoint;
}
inline bool Type::is_pointer() const {
  return kind() == Pointer;
}
inline bool Type::is_void() const {
  return kind() == Void;
}
inline bool Type::is_function_pointer() const {
  return kind() == FunctionPointer;
}
inline bool Type::is_array() const {
  return kind() == Array;
}

inline uint32_t Type::bitwidth() const {
  CAFFEINE_ASSERT(is_int());
  return desc_;
}
inline uint32_t Type::mantissa_bits() const {
  CAFFEINE_ASSERT(is_float());
  return desc_ & 0xFFF;
}
inline uint32_t Type::exponent_bits() const {
  CAFFEINE_ASSERT(is_float());
  return desc_ >> 12;
}

inline bool Type::operator==(const Type& b) const {
  return kind_ == b.kind_ && desc_ == b.desc_ && llvm_ == b.llvm_;
}
inline bool Type::operator!=(const Type& b) const {
  return !(*this == b);
}

inline llvm::hash_code hash_value(const Type& type) {
  return llvm::hash_combine(type.llvm_, type.kind_, type.desc_);
}

#define CAFFEINE_TYPE_TYPEOF_INT(ty)                                           \
  template <>                                                                  \
  inline Type Type::type_of<ty>() {                                            \
    return Type::int_ty(sizeof(ty) * CHAR_BIT);                                \
  }                                                                            \
  static_assert(true)

CAFFEINE_TYPE_TYPEOF_INT(unsigned char);
CAFFEINE_TYPE_TYPEOF_INT(unsigned short);
CAFFEINE_TYPE_TYPEOF_INT(unsigned int);
CAFFEINE_TYPE_TYPEOF_INT(unsigned long);
CAFFEINE_TYPE_TYPEOF_INT(unsigned long long);

CAFFEINE_TYPE_TYPEOF_INT(signed char);
CAFFEINE_TYPE_TYPEOF_INT(signed short);
CAFFEINE_TYPE_TYPEOF_INT(signed int);
CAFFEINE_TYPE_TYPEOF_INT(signed long);
CAFFEINE_TYPE_TYPEOF_INT(signed long long);

CAFFEINE_TYPE_TYPEOF_INT(char);

template <>
inline Type Type::type_of<double>() {
  return Type::float_ty(11, 53);
}

template <>
inline Type Type::type_of<float>() {
  return Type::float_ty(8, 24);
}

template <>
inline Type Type::type_of<void>() {
  return Type::void_ty();
}

#undef CAFFEINE_TYPE_TYPEOF_INT

} // namespace caffeine

namespace std {

template <>
struct hash<caffeine::Type> {
  std::size_t operator()(const caffeine::Type& type) const noexcept {
    using llvm::hash_value;
    return hash_value(type);
  }
};

} // namespace std

#endif
