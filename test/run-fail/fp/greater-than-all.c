
#include "caffeine.h"
#include <float.h>

void test(double x) {
  // TODO: Support isnan
  caffeine_assume(x == x);

  caffeine_assert(x <= DBL_MAX);
}
