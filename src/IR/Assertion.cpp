
#include "caffeine/IR/Assertion.h"
#include "caffeine/Support/Assert.h"

#include <iostream>

namespace caffeine {

Assertion::Assertion() : Assertion(constant(true)) {}
Assertion::Assertion(const OpRef& value) : value_(value) {
  CAFFEINE_ASSERT(value, "created assertion with null expression");
  CAFFEINE_ASSERT(value->type() == Type::int_ty(1));
}

bool Assertion::is_constant() const {
  CAFFEINE_ASSERT(value_, "assertion had null value");
  return value_->is_constant();
}

bool Assertion::is_constant_value(bool value) const {
  const auto* intval = llvm::dyn_cast<ConstantInt>(value_.get());

  if (!intval)
    return false;

  return intval->value() == (uint64_t)value;
}

Assertion Assertion::operator!() const {
  CAFFEINE_ASSERT(value_, "assertion had null value");
  return Assertion(UnaryOp::CreateNot(value_));
}

Assertion Assertion::constant(bool value) {
  return Assertion(
      ConstantInt::Create(llvm::APInt(1, static_cast<uint64_t>(value))));
}

std::ostream& operator<<(std::ostream& os, const Assertion& assertion) {
  return os << "(assert " << *assertion.value() << ")";
}

} // namespace caffeine
