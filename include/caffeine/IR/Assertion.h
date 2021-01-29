#ifndef CAFFEINE_IR_ASSERTION_H
#define CAFFEINE_IR_ASSERTION_H

#include "caffeine/IR/Operation.h"

namespace caffeine {

/**
 * An expression that has boolean (i1) type. Optionally, it can be empty which
 * is semantically equivalent to a constant `true` value.
 *
 * These are what is actually passed in to the solver.
 */
class Assertion {
private:
  ref<Operation> value_;

public:
  Assertion();
  Assertion(const ref<Operation>& value);

  ref<Operation>& value() &;
  ref<Operation>&& value() &&;
  const ref<Operation>& value() const&;
  const ref<Operation>&& value() const&&;

  bool is_empty() const;
  bool is_constant() const;
  bool is_constant(bool value) const;

  Assertion operator!() const;

  static Assertion constant(bool value);
};

std::ostream& operator<<(std::ostream& os, const Assertion& assertion);

} // namespace caffeine

#include "caffeine/IR/Assertion.inl"

#endif
