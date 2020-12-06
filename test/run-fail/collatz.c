
#include <limits.h>
#include <stdbool.h>
#include <stdint.h>

#include "caffeine.h"

uint32_t collatz(uint32_t x) {
  uint32_t cnt = 0;
  while (x > 1) {
    cnt += 1;

    uint32_t k1 = x / 2;
    uint32_t k2 = 3 * x + 1;

    x = (x % 2 == 0) ? k1 : k2;
    caffeine_assume(cnt < 10);
  }

  return cnt;
}

void test(uint32_t n) {
  caffeine_assert(collatz(n) <= 2);
}
