
#include "caffeine.h"
#include <stdint.h>

uint32_t ilog2(uint32_t x) {
  return 31 - __builtin_clz(x | 1);
}

uint32_t optimized(uint32_t x) {
  static uint32_t table[] = {9,      99,       999,      9999,     99999,
                             999999, 99999999, 99999999, 999999999};
  uint32_t y = (9 * ilog2(x)) >> 5;
  y += x > table[y];
  return y + 1;
}

uint32_t naive(uint32_t x) {
  uint32_t cnt = 1;
  while (x >= 10) { cnt += 1; x /= 10; }
  return cnt;
}

int main(int argc, char** argv) {
  uint32_t x;
  caffeine_make_symbolic(&x, sizeof(x), "x");
  caffeine_assert(optimized(x) == naive(x));
  return 0;
}
