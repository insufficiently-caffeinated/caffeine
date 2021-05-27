#include "caffeine.h"
#include <stdint.h>

// ilog2 implementation from http://graphics.stanford.edu/~seander/bithacks.html
__attribute__((noinline)) unsigned ilog2(unsigned v) {
  unsigned int r, shift;

  // clang-format off
  r =     (v > 0xFFFF) << 4; v >>= r;
  shift = (v > 0xFF  ) << 3; v >>= shift; r |= shift;
  shift = (v > 0xF   ) << 2; v >>= shift; r |= shift;
  shift = (v > 0x3   ) << 1; v >>= shift; r |= shift;
                                          r |= (v >> 1);
  // clang-format on

  return r;
}

void test() {
  unsigned a, b, r;
  caffeine_make_symbolic(&a, sizeof(a), "a");
  caffeine_make_symbolic(&b, sizeof(b), "b");

  caffeine_assume(ilog2(a) + ilog2(b) >= 32);
  caffeine_assert(__builtin_umul_overflow(a, b, &r));
  caffeine_assert(r == a * b);
}
