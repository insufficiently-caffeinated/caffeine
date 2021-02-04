
#include "caffeine.h"
#include <stdlib.h>
#include <string.h>

const char data[] = "test data";
char dest[20];

void test(void) {
  memcpy(dest, data, sizeof(data));

  for (size_t i = 0; i < sizeof(data); ++i) {
    caffeine_assert(dest[i] == data[i]);
  }
}
