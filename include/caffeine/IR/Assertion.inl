#ifndef CAFFEINE_IR_ASSERTION_INL
#define CAFFEINE_IR_ASSERTION_INL

#include "caffeine/IR/Assertion.h"

namespace caffeine {

inline OpRef& Assertion::value() & {
  return value_;
}
inline OpRef&& Assertion::value() && {
  return std::move(value_);
}
inline const OpRef& Assertion::value() const& {
  return value_;
}
inline const OpRef&& Assertion::value() const&& {
  return std::move(value_);
}

inline bool Assertion::is_empty() const {
  return !value_;
}

} // namespace caffeine

#endif
