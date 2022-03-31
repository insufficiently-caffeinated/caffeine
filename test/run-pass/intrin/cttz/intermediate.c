#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x) {
  caffeine_assume(x == 0x00010000);
  caffeine_assert(__builtin_ctz(x) == 16);
}
