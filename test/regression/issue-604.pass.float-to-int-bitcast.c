#include "caffeine.h"
#include <math.h>

// Just test that libc is present
void test(double x) {
  caffeine_assume(x == 1.1);
  caffeine_assert((pow(2.2, x) < 5.3));
}
