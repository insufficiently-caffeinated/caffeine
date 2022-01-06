
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

void test(int32_t x) {
  caffeine_assume(x < 0);
  caffeine_assert(abs(x) == -x);
}
