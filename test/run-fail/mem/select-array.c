
#include "caffeine.h"
#include <stdint.h>

int32_t array1[] = {1};
int32_t array2[] = {2};

void test(int32_t x) {
  int32_t* mem = x == 0 ? array1 : array2;

  caffeine_assert(*mem == 2);
}
