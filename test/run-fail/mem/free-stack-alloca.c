
#include "caffeine.h"
#include <stdlib.h>

void test(unsigned x) {
  unsigned mem[32];
  mem[5] = x;
  free(mem);

  // Needed since otherwise clang will optimize away the free
  caffeine_assert(mem[5] == x);
}
