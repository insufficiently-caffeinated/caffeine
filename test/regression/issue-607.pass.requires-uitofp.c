#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x) {
  caffeine_assume(x < 10);
  caffeine_assert((float)x != 15.5f);
}
