#include <errno.h>
#include <stdlib.h>

#include "caffeine.h"

void test(int input) {
  volatile char* mem = NULL;
  caffeine_assert(mem == NULL);

  // Since we are trying to allocate 0 bytes `mem` should
  // be set to NULL
  mem = (char*)0x5;
  int res = posix_memalign((void**)&mem, 2, 0);
  caffeine_assert(mem == NULL);

  // Since we are trying to allocate an alignment that
  // has `alignment` % sizeof(void *) != 0 it should fail.
  // Also `mem` should not be modified
  mem = (char*)0x6;
  res = posix_memalign((void**)&mem, 2, 4);
  caffeine_assert(res == EINVAL);
  caffeine_assert(mem == (char*)0x6);

  // Should succeed (also no restrictions on size as far as I can tell from
  // the docs)
  mem = NULL;
  res = posix_memalign((void**)&mem, sizeof(void*), 3);
  caffeine_assert(res == 0);
  caffeine_assert(mem != NULL);
  mem[0] = '0';
  caffeine_assert(mem[0] == '0');

  free((char*)mem);
}
