
#include "caffeine.h"
#include <stdint.h>

uint32_t array[4] = {1, 2, 3, 4};

__attribute__((noinline)) uint32_t* offset(uint32_t* ptr, uint32_t x) {
  return ptr + x;
}

void test(uint32_t x) {
  caffeine_assume(x < 4);

  caffeine_assert(offset(array, x) == array + x);
}
