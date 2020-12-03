
#include "caffeine.h"
#include <stdint.h>

void test(uint32_t x) {
  caffeine_assume(x != 5);

  if (x != 5) {
    caffeine_assume(true);
  } else {
    caffeine_assert(false);
  }

  caffeine_assert(true);
}
