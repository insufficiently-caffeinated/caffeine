
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

uint32_t a[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
uint32_t b[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
uint32_t c[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};

void test() {
  for (size_t i = 0; i < 8; ++i)
    c[i] = a[i] + b[i];

  caffeine_assert(c[2] == 4);
}
