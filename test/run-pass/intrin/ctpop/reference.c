#include "caffeine.h"
#include <stdint.h>

uint32_t naive(uint32_t x) {
  uint32_t cnt = 0;
  for (; x != 0; x >>= 1)
    cnt += x & 1;
  return cnt;
}

void test(uint32_t x) {
  caffeine_assert(naive(x) == __builtin_popcount(x));
}
