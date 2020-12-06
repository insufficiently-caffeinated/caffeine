
#include "caffeine.h"
#include <stdint.h>

// Murmurhash3 finalizer
uint64_t murmurhash3_f(uint64_t i) {
  i += 1ULL;
  i ^= i >> 33ULL;
  i *= 0xff51afd7ed558ccdULL;
  i ^= i >> 33ULL;
  i *= 0xc4ceb9fe1a85ec53ULL;
  i ^= i >> 33ULL;
  return i;
}

void test(uint64_t a) {
  caffeine_assert(murmurhash3_f(a) != 16);
}
