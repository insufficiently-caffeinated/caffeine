#include "caffeine.h"
#include <stdbool.h>
#include <stdint.h>

void test(bool x, bool y) {
  caffeine_assume(x == y);

  if (x) {
    caffeine_assert(y);
  }
}
