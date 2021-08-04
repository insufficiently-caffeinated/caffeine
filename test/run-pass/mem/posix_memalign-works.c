#include <errno.h>
#include <stdint.h>
#include <stdlib.h>

#include "caffeine.h"

void test(uint32_t input) {
  volatile char* mem = NULL;
  caffeine_assume(input > 0);
  caffeine_assume(input % 2 == 0);
  caffeine_assume(input % sizeof(void*) == 0);

  // Should succeed (also no restrictions on size as far as I can tell from
  // the docs)
  int res = posix_memalign((void**)&mem, input, 3);
  caffeine_assert(res == 0);
  caffeine_assert(mem != NULL);
  mem[0] = '0';
  caffeine_assert(mem[0] == '0');
  caffeine_assert(((size_t)mem) % input == 0);

  free((char*)mem);
}
