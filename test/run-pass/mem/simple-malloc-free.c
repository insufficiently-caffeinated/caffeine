#include <caffeine.h>
#include <stdlib.h>

void test() {
  void* data = malloc(10);
  free(data);
}
