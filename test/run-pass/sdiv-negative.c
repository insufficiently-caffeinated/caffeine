
#include "caffeine.h"
#include <stdint.h>

void test(int32_t x) {
  caffeine_assume(x == -50);
  int32_t y = x / -5;
  caffeine_assert(y == 10);
}
