#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x, uint32_t y, uint32_t z) {
  caffeine_assume(x == 0);
  caffeine_assume(y == __builtin_clz(x));
  caffeine_assume(z == 32);
  caffeine_assert(__builtin_clz(x) == z);
}
