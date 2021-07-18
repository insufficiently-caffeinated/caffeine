#include "caffeine.h"
#include <cstdint>
#include <vector>

extern "C" void test(int32_t x) {
  std::vector<int32_t> vec;
  vec.push_back(x);
  caffeine_assert(vec.at(0) == x);
}
