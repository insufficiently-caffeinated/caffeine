
#include "caffeine.h"
#include <stdint.h>

uint32_t array[2] = {0, 1};

// Needed to force a non-constant ptrtoint instruction
__attribute__((noinline)) uintptr_t ptrtoint(uint32_t* ptr) {
  return (uintptr_t)ptr;
}

void test(uintptr_t x) {
  caffeine_assert(x != ptrtoint(&array[0]));
}
