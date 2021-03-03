
#include "caffeine.h"
#include <stdint.h>
#include <string.h>

struct testdata {
  uint32_t a;
  uint64_t b;
  uint8_t c;
};

void test() {
  struct testdata data;
  memset(&data, 0xCC, sizeof(data));

  caffeine_assert(data.a == 0xCCCCCCCC);
  caffeine_assert(data.b == 0xCCCCCCCCCCCCCCCC);
  caffeine_assert(data.c == 0xCC);
}
