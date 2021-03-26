#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"

#include <iostream>

namespace caffeine {

namespace {
  // Separate method to silence warnings
  bool is_nonnull(const void* x) {
    return x;
  }
} // namespace

void Operation::DebugPrint() const {
  if (is_nonnull(this)) {
    std::cout << *this << std::endl;
  } else {
    std::cout << "NULL" << std::endl;
  }
}

void Assertion::DebugPrint() const {
  std::cout << *this << std::endl;
}

} // namespace caffeine
