#include "caffeine.h"

#include <csetjmp>

__attribute__((noinline)) void inner_func(jmp_buf buf, int a) {
  if (a > 5) {
    throw "oh no a > 5";
  }
  longjmp(buf, 11);
}

extern "C" void test(int a) {
  jmp_buf buf;
  caffeine_assume(a < 5);
  switch (setjmp(buf)) {
  case 0:
    try {
      inner_func(buf, a);
    } catch (...) { caffeine_assert(false); }
  default:
    caffeine_assert(false);
    break;

  case 11:
    return;
  }
}
