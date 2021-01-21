
#include "caffeine.h"
#include <stddef.h>
 
// This is a more limited version of malloc that expects size != 0
void* caffeine_malloc(size_t size);
void* caffeine_calloc(size_t size);

// This is a more limited version of free that expects mem != nullptr
void caffeine_free(void* mem);

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
