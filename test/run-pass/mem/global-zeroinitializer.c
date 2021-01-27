
#include "caffeine.h"
#include <stdint.h>

uint32_t zeros[4] = {0, 0, 0, 0};

void test() {
  caffeine_assert(zeros[0] == 0);
}
