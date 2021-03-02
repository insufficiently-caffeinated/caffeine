
#include "caffeine.h"
#include <stdint.h>

typedef struct {
  uint32_t x;
  uint32_t y;
} test_data;

void test() {
  test_data data;
  caffeine_make_symbolic(&data, sizeof(test_data), "test_data");

  caffeine_assert(data.x != data.y);
}
