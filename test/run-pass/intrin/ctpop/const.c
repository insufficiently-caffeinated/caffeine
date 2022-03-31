#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x) {
  caffeine_assume(x == 0xF0F08);
  caffeine_assert(__builtin_popcount(x) == 9);
}
