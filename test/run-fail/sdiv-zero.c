
#include "caffeine.h"
#include <stdint.h>

// Test that signed division checks for divide-by-zero.
int32_t test(int32_t x, int32_t y) {
  caffeine_assume(x == INT32_MIN || y != -1);

  return x / y;
}
