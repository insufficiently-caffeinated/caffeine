
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

__attribute__((noinline)) uint32_t* alloc_bytes() {
  uint32_t* bytes = malloc(128 * sizeof(uint32_t));
  bytes[127] = 5;
  memset(bytes, 0x10, sizeof(uint32_t) * 128);

  return bytes;
}

void test() {
  uint32_t* bytes = alloc_bytes();

  caffeine_assert(bytes[127] == 0x10101010);
  caffeine_assert(bytes[0] == 0x10101010);

  free(bytes);
}
