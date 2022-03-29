#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x) {
  caffeine_assume(x == 0xFFFFFFFF);
  caffeine_assert(__builtin_clz(x) == 0);
}
