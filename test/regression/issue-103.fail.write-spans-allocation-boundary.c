
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

void test() {
  volatile uint32_t* mem = (volatile uint32_t*)malloc(10);
  mem[2] = 0;
}
