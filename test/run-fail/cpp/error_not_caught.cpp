#include "caffeine.h"
#include <stdexcept>

extern "C" void test(int b) {
  caffeine_assume(b > 10);
  int a = 0;
  try {
    if (b > 5) {
      throw std::runtime_error("thing");
    }
    caffeine_assert(false);
  } catch (int c) {
    a = 1;
  }
  caffeine_assert(a == 1);
}
