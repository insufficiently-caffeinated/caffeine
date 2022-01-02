#include "caffeine.h"
#include <stdint.h>

void test(int32_t x) {
  caffeine_assume(x < 10 && x > -10);

  float value = x;
  caffeine_assert(x != 15.5);
}
