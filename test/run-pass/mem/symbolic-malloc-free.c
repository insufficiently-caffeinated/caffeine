#include <caffeine.h>
#include <stdint.h>
#include <stdlib.h>

void test() {
  uint8_t size;
  caffeine_make_symbolic(&size, sizeof(size), "size");

  void* data = malloc(size);
  free(data);
}
