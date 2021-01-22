
#include "caffeine.h"

__attribute__((noinline)) unsigned* returns_internal_alloca(unsigned x) {
  unsigned mem[32];
  mem[5] = x;
  return mem;
}

void test() {
  unsigned* mem = returns_internal_alloca(5);
  mem[2] = 0;
}
