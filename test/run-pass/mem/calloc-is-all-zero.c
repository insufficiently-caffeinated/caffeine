
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

void test() {
  uint32_t* mem = (uint32_t*)calloc(32, sizeof(uint32_t));

  for (size_t i = 0; i < 32; ++i)
    caffeine_assert(mem[i] == 0);
}
