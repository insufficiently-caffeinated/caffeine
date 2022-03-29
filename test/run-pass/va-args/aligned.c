#include "caffeine.h"
#include <stdarg.h>
#include <stdint.h>

typedef uint64_t aligned_t
    __attribute__((__vector_size__(16), __aligned__(16)));

__attribute__((noinline)) aligned_t read_arg(va_list args) {
  return va_arg(args, aligned_t);
}

__attribute__((noinline)) void test_func(size_t count, ...) {
  va_list args;
  va_start(args, count);

  aligned_t a = read_arg(args);
  int b = va_arg(args, int);
  aligned_t c = read_arg(args);

  caffeine_assert(a[0] == 0x123456789ABCDEF);
  caffeine_assert(a[1] == 0xFEDCBA987654321);
  caffeine_assert(c[0] == 0x51123151230aa91);
  caffeine_assert(c[1] == 0xaabbccddeeff001);
  caffeine_assert(b == -5123);

  va_end(args);
}

void test() {
  aligned_t a = {0x123456789ABCDEF, 0xFEDCBA987654321};
  aligned_t c = {0x51123151230aa91, 0xaabbccddeeff001};
  int b = -5123;

  test_func(3, a, b, c);
}
