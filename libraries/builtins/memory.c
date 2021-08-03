
#include "caffeine-builtins.h"
#include <stddef.h>
#include <errno.h>

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

int posix_memalign(void **memptr, size_t alignment, size_t size) {
  if (size == 0) {
    *memptr = NULL;
  }

  if (alignment % 2 != 0 || alignment % sizeof(void *) != 0) {
    return EINVAL;
  }

  void * res = caffeine_malloc_align(size, alignment);
  if (res == NULL) {
    return ENOMEM;
  }

  *memptr = res;
  return 0;
}
