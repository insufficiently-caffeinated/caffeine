#ifndef CAFFEINE_IR_TYPE_INL
#define CAFFEINE_IR_TYPE_INL

#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

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
