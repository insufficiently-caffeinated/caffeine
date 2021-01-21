
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

// Needed to avoid vector load/stores
__attribute__((noinline)) uint32_t mul2(uint32_t x) {
  return x * 2;
}

void test(size_t x) {
  caffeine_assume(x < 4);
  caffeine_assume(x >= 1);

  uint32_t mem[4];

  for (uint32_t i = 0; i < x; ++i) {
    mem[i] = mul2(i);
  }

  for (uint32_t i = 0; i < x; ++i) {
    caffeine_assert(mem[i] == i * 2);
  }
}
