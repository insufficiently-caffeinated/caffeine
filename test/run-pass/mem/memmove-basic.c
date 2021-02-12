
#include "caffeine.h"
#include <stdlib.h>
#include <string.h>

char reference[] = "56789012340123456789";
char data[] = "01234567890123456789";

void test(void) {
  memmove(data, data + 5, 10);

  for (size_t i = 0; i < sizeof(data); ++i) {
    caffeine_assert(reference[i] == data[i]);
  }
}
