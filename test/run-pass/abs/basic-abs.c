
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

void test(int32_t x) {
  caffeine_assume(x < 0 && x != INT32_MIN);
  caffeine_assert(abs(x) == -x);
}
