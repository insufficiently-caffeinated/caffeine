#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x, uint32_t y) {
  caffeine_assume(x == 0);
  caffeine_assume(y == 32);
  caffeine_assert(__builtin_ctz(x) == y);
}
