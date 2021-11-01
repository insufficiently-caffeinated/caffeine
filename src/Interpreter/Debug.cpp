#include "caffeine/Model/AssertionList.h"
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <iostream>

namespace caffeine {

void AssertionList::DebugPrint() const {
  std::cout << "AssertionList [";
  for (const Assertion& a : *this) {
    std::cout << "\n  " << a;
  }
  std::cout << "\n]" << std::endl;
}

} // namespace caffeine
