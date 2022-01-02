#include "caffeine.h"
#include <stdint.h>

void test(float f) {
  caffeine_assume(f > 0.0f);
  caffeine_assume(f < 20000000.0f);

  // This is the smallest-magnitude integer not representable by a
  // floating-point number.
  caffeine_assert((uint32_t)f != UINT32_C(16777217));
}
