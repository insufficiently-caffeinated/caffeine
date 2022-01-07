#include "caffeine.h"
#include <float.h>
#include <limits.h>

void test(float x) {
  caffeine_assert((double)x != DBL_MIN);
}
