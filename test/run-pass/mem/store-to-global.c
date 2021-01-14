
#include "caffeine.h"

#include <stdint.h>

volatile uint32_t global_array[1] = {1};

void test() {
  global_array[0] = 0xABCD;

  caffeine_assert(global_array[0] == 0xABCD);
}
