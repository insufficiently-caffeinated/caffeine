
#include "caffeine.h"
#include <stdint.h>

// Test that signed division checks for overflow in the case
// where x == INT_MIN and y == -1
int32_t test(int32_t x, int32_t y) {
  caffeine_assume(y != 0);
  return x / y;
}
