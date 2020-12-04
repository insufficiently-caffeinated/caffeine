
#include "caffeine.h"
#include <stdint.h>

// Test that udiv works correctly for large values.
void test(uint32_t x) {
  caffeine_assume(x == UINT32_MAX);
  uint32_t y = x / 4294967246;
  caffeine_assert(y == 1);
}
