
#include "caffeine.h"
#include <stdint.h>
#include <stdlib.h>

void test() {
  volatile uint32_t* mem = (volatile uint32_t*)malloc(sizeof(uint32_t) * 3);
  mem[2] = 0;
}
