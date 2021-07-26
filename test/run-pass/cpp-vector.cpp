#include "caffeine.h"
#include <vector>

extern "C" void test(int x) {
  std::vector<int> vec;
  vec.push_back(x);
  caffeine_assert(vec.at(0) == x);
}
