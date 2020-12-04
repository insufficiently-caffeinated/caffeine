
#include "caffeine.h"
#include <stdint.h>

uint32_t sdiv(uint32_t x, uint32_t y) {
  caffeine_assume(x == INT32_MIN || y != -1);
  caffeine_assume(y != 0);

  return (int32_t)x / (int32_t)y;
}

uint32_t udiv(uint32_t x, uint32_t y) {
  caffeine_assume(y != 0);

  return x / y;
}

// Test that udiv and sdiv are the same for positive values.
void test(uint32_t x, uint32_t y) {
  caffeine_assume(x < 0x80000000);
  caffeine_assume(y < 0x80000000);

  uint32_t a = sdiv(x, y);
  uint32_t b = udiv(x, y);

  caffeine_assert(a == b);
}
