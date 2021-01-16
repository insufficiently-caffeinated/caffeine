// SKIP TEST

#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

void test(size_t x) {
  caffeine_assume(x < 32);
  caffeine_assume(x >= 1);

  uint32_t* mem = malloc(x * sizeof(uint32_t));

  for (uint32_t i = 0; i < x; ++i) {
    mem[i] = i * 2;
  }

  for (uint32_t i = 0; i < x; ++i) {
    caffeine_assert(mem[i] == i * 2);
  }
}
