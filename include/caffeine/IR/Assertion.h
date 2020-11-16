#ifndef CAFFEINE_IR_ASSERTION_H
#define CAFFEINE_IR_ASSERTION_H

#include "caffeine/IR/Operation.h"

namespace caffeine {

class Assertion {
private:
  ref<Operation> value_;

public:
  Assertion() = default;
  Assertion(const ref<Operation>& value);

  ref<Operation>& value() &;
  ref<Operation>&& value() &&;
  const ref<Operation>& value() const&;
  const ref<Operation>&& value() const&&;

  bool is_empty() const;
  bool is_constant() const;
};

} // namespace caffeine

#include "caffeine/IR/Assertion.inl"

#endif
