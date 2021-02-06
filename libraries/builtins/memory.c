
#include "caffeine-builtins.h"
#include <stddef.h>

void* malloc(size_t size) {
  if (size == 0)
    return NULL;

  return caffeine_malloc(size);
}

void* calloc(size_t num, size_t size) {
  size_t total = num * size;

  if (total == 0)
    return NULL;

  return caffeine_calloc(total);
}

void free(void* mem) {
  if (!mem)
    return;

  return caffeine_free(mem);
}
