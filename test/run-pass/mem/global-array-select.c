
#include "caffeine.h"

#include <stdint.h>

uint32_t global_array[4] = {1, 2, 3, 4};

void test(uint32_t x) {
  caffeine_assume(x < 4);

  global_array[3] = 0;

  caffeine_assert(global_array[x] < 4);
}
