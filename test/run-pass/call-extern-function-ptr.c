#include "caffeine.h"
#include <stdint.h>

typedef void (*func_t)(bool);

__attribute__((optnone)) void call_func(func_t func, bool arg) {
  func(arg);
}

void test(uint32_t x) {
  func_t f = x == 0 ? caffeine_assert : caffeine_assume;
  call_func(f, x == 0);

  caffeine_assert(x == 0);
}
