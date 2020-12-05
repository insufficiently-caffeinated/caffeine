#include "caffeine.h"
#include <stdint.h>

#define FNV_PRIME UINT64_C(1099511628211)

#define FNV_OFFSET UINT64_C(14695981039346656037)

uint64_t fnv(uint64_t x) {
  uint64_t hash = FNV_OFFSET;
  hash ^= x;
  hash *= FNV_PRIME;
  return hash;
}

void test(uint64_t x) {
  caffeine_assert(fnv(x) != 0);
}
