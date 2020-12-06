
#include "caffeine.h"

void test(double x) {
  // This should fail when X is NaN
  caffeine_assert(x == x);
}
