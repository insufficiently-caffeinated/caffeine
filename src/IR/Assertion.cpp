
#include "caffeine/IR/Assertion.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

Assertion::Assertion(const ref<Operation>& value) : value_(value) {
  CAFFEINE_ASSERT(value, "created assertion with null expression");
  CAFFEINE_ASSERT(value->type() == Type::int_ty(1));
}

bool Assertion::is_constant() const {
  CAFFEINE_ASSERT(value_, "assertion had null value");
  return value_->is_constant();
}

} // namespace caffeine
