
#include "caffeine.h"
#include <stdint.h>

uint32_t ilog2(uint32_t x) {
  return 31 - __builtin_clz(x | 1);
}

uint32_t count1(uint32_t x) {
  static uint64_t table[] = {
      4294967296,  8589934582,  8589934582,  8589934582,  12884901788,
      12884901788, 12884901788, 17179868184, 17179868184, 17179868184,
      21474826480, 21474826480, 21474826480, 21474826480, 25769703776,
      25769703776, 25769703776, 30063771072, 30063771072, 30063771072,
      34349738368, 34349738368, 34349738368, 34349738368, 38554705664,
      38554705664, 38554705664, 41949672960, 41949672960, 41949672960,
      42949672960, 42949672960};
  return (x + table[ilog2(x)]) >> 32;
}

uint32_t count2(uint32_t x) {
  static uint32_t table[] = {9,      99,      999,      9999,     99999,
                             999999, 9999999, 99999999, 999999999};
  uint32_t y = (9 * ilog2(x)) >> 5;
  y += x > table[y];
  return y + 1;
}

uint32_t count3(uint32_t x) {
  uint32_t cnt = 1;
  while (x >= 10) {
    cnt += 1;
    x /= 10;
  }
  return cnt;
}

int main(int argc, char** argv) {
  uint32_t x;
  caffeine_make_symbolic(&x, sizeof(x), "x");

  uint32_t c1 = count1(x);
  uint32_t c2 = count2(x);
  uint32_t c3 = count3(x);

  caffeine_assert(c1 == c3);
  caffeine_assert(c2 == c3);

  return 0;
}
