#include "caffeine.h"

extern "C" void test(int b) {
  caffeine_assume(b > 10);
  int a = 0;
  try {
    if (b > 5) {
      throw 555;
    }
    caffeine_assert(false);
  } catch (int c) {
    a = 1;
    caffeine_assert(c == 555);
  }
  caffeine_assert(a == 1);
}
