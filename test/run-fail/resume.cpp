#include "caffeine.h"

extern "C" void test(int a) {
  try {
    if (a == 5) {
      throw "ehehehe";
    }
  } catch (...) { caffeine_assert(false); }
}
