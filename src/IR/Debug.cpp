#include "caffeine/IR/Operation.h"

#include <iostream>

namespace caffeine {
void Operation::DebugPrint() const {
  if ((void*)this) {
    std::cout << *this << std::endl;
  } else {
    std::cout << "NULL" << std::endl;
  }
}
} // namespace caffeine
