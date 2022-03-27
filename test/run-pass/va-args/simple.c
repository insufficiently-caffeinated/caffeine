#include "caffeine.h"
#include <stdarg.h>

__attribute__((noinline)) int read_arg(va_list args) {
  return va_arg(args, int);
}

__attribute__((noinline)) void test_func(size_t count, ...) {
  va_list args;
  va_start(args, count);

  for (size_t i = 0; i < count; ++i) {
    caffeine_assert((size_t)read_arg(args) == i);
  }

  va_end(args);
}

void test() {
  test_func(5, 0, 1, 2, 3, 4);
}
