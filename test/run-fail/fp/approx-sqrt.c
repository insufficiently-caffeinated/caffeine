// SKIP TEST

#include "caffeine.h"
#include <stdlib.h>

double approx_sqrt(double x) {
  double r = 1.0;

  for (size_t i = 0; i < 5; ++i) {
    r -= (r * r - x) / (2.0 * r);
  }

  return r;
}

void test(double x) {
  // No NaNs
  caffeine_assume(x == x);
  caffeine_assume(x > 0.0);
  caffeine_assume(x < 1.0);

  double v = approx_sqrt(x);

  caffeine_assert(v * v <= x * 2.0);
}
