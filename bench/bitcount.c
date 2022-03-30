#include "caffeine.h"
#include <stdint.h>

uint32_t bitcount_naive(uint32_t x) {
  uint32_t cnt = 0;
  for (; x != 0; x >>= 1)
    cnt += x & 1;
  return cnt;
}

// Note: This needs to be optnone so that clang doesn't optimize it down to
//       a call to the llvm.ctpop intrinsic since caffeine doesn't support
//       that yet.
uint32_t __attribute__((optnone)) bitcount_fast(uint32_t v) {
  v = v - ((v >> 1) & 0x55555555);
  v = (v & 0x33333333) + ((v >> 2) & 0x33333333);
  v = ((v + (v >> 4) & 0xF0F0F0F) * 0x1010101) >> 24;
  return v & 31;
}

int main(int argc, char** argv) {
  uint32_t x;
  caffeine_make_symbolic(&x, sizeof(x), "x");

  uint32_t cnt1 = bitcount_naive(x);
  uint32_t cnt2 = bitcount_fast(x);

  caffeine_assert(cnt1 == cnt2);
  return 0;
}
