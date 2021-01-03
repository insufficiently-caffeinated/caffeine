
#include <stdint.h>
#include <limits.h>

#include "caffeine.h"

uint32_t interleave(uint16_t x, uint16_t y) {
  uint32_t z = 0;

  for (unsigned i = 0; i < CHAR_BIT * sizeof(x); ++i) {
    uint32_t xb = (x >> i) & 1;
    uint32_t yb = (y >> i) & 1;

    z |= xb << (2 * i) | yb << (2 * i + 1);
  }

  return z;
}

void test(uint16_t x) {
  caffeine_assert(interleave(x, x) != 0xFFFFFFFF);
}
