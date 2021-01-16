
#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x) {
  uint32_t a = x + 1020202;
  uint32_t b = a * 555142;
  uint32_t c = b - 1321;

  caffeine_assert(c + 5 != 0);
}
