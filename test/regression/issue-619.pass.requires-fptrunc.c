#include "caffeine.h"
#include <float.h>
#include <limits.h>

void test(double x) {
  caffeine_assume(x < 2.0);
  caffeine_assert((float)x != 4.0f);
}
