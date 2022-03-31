#include "caffeine.h"
#include <limits.h>
#include <stdint.h>

#define bitsizeof(x) (sizeof(x) * CHAR_BIT)

uint32_t naive(uint32_t x) {
  uint32_t count = 0;
  for (; count < 32; ++count) {
    if (x & (UINT32_C(1) << (bitsizeof(x) - 1)))
      break;
    x <<= 1;
  }
  return count;
}

void test(uint32_t x) {
  caffeine_assert(__builtin_clz(x) == naive(x));
}
