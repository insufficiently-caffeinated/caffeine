#include "caffeine.h"

#include <setjmp.h>

__attribute__((noinline)) void inner_func(jmp_buf buf) {
  longjmp(buf, 11);
}

void test() {
  jmp_buf buf;
  switch (setjmp(buf)) {
  case 0:
    inner_func(buf);
  default:
    caffeine_assert(false);
    break;

  case 11:
    return;
  }
}
