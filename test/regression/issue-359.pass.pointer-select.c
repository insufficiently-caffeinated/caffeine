#include "caffeine.h"
#include <stdint.h>

uint32_t a = 0;
uint32_t b = 0;

void test(uint8_t x) {
  uint32_t* ptr = x ? &a : &b;

  *ptr = 1;
}
