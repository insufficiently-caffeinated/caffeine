#include "caffeine.h"

#include <setjmp.h>

void test() {
  jmp_buf buf;
  switch (setjmp(buf)) {
  case 0:
    break;
  default:
    caffeine_assert(false);
    break;
  }
}
