
#include "caffeine.h"
#include <stdint.h>

uint32_t array[2] = {0, 1};

void test(uint32_t x) {
  array[0] = x;

  caffeine_assert(*(uint64_t*)array != 0);
}
