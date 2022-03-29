#include "caffeine.h"
#include <inttypes.h>
#include <stdarg.h>
#include <stdint.h>

typedef struct __attribute__((aligned(16))) {
  uint64_t a;
  uint64_t b;
} aligned_t;

#define REPEAT2(x) x, x
#define REPEAT4(x) REPEAT2(x), REPEAT2(x)
#define REPEAT8(x) REPEAT4(x), REPEAT4(x)
#define REPEAT16(x) REPEAT8(x), REPEAT8(x)

static const uint64_t vargs[4] = {0x0102030405060708ull, 0x1112131415161718ull,
                                  0x3132333435363738ull, 0x4142434445464748ull};

__attribute__((noinline)) aligned_t read1(va_list args) {
  return va_arg(args, aligned_t);
}

__attribute__((noinline)) unsigned read2(va_list args) {
  return va_arg(args, unsigned);
}

__attribute__((noinline)) void func2(size_t size, ...) {
  va_list args;
  va_start(args, size);

  for (size_t i = 0; i < 8; ++i) {
    read2(args);
  }

  aligned_t x = read1(args);
  unsigned y = read2(args);
  aligned_t z = read1(args);

  caffeine_assert(x.a == vargs[0]);
  caffeine_assert(x.b == vargs[1]);
  caffeine_assert(y == 0x21222324u);
  caffeine_assert(z.a == vargs[2]);
  caffeine_assert(z.b == vargs[3]);
}

__attribute__((noinline)) void func1(aligned_t x, aligned_t y) {
  func2(16 + 3, REPEAT8(0x7F7F7F7Fu), x, 0x21222324u, y);
}

void test() {
  aligned_t x = {vargs[0], vargs[1]};
  aligned_t y = {vargs[2], vargs[3]};

  func1(x, y);
}
