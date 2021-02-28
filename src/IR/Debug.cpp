#include "caffeine/IR/Operation.h"

#include <iostream>

namespace caffeine {
void Operation::DebugPrint() const {
  std::cout << *this << std::endl;
}
} // namespace caffeine
