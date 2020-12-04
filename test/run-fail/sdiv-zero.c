
#include "caffeine.h"
#include <stdint.h>

// Test that signed division checks for divide-by-zero.
int32_t test(int32_t x, int32_t y) {
  // Don't have or yet. Need to emulate it.
  if (x == INT32_MIN)
    caffeine_assume(y != -1);

  return x / y;
}
