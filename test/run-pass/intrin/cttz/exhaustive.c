#include "caffeine.h"
#include <limits.h>
#include <stdint.h>

uint32_t naive(uint32_t x) {
  uint32_t count = 0;
  for (; count < 32; ++count) {
    if (x & 1)
      break;
    x >>= 1;
  }
  return count;
}

void test(uint32_t x, uint32_t y, uint32_t z) {
  caffeine_assume(y == __builtin_ctz(x));
  caffeine_assume(z == naive(x));

  caffeine_assert(__builtin_ctz(x) == naive(x));
}
