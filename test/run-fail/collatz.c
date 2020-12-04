
#include <limits.h>
#include <stdbool.h>
#include <stdint.h>

#include "caffeine.h"

uint32_t __attribute__((noinline)) modulo(uint32_t x, uint32_t y) {
  return x % y;
}

uint32_t __attribute__((noinline)) collatz(uint32_t x) {
  uint32_t cnt = 0;
  while (x > 1) {
    cnt += 1;

    uint32_t k1 = x / 2;
    uint32_t k2 = 3 * x + 1;

    x = (modulo(x, 2) == 0) ? k1 : k2;
    caffeine_assume(cnt < 10);
  }

  return cnt;
}

void test(uint32_t n) {
  // Select not implemented yet; skip
  return;

  caffeine_assert(collatz(n) <= 2);
}
