#include <string.h>

#ifdef CAFFEINE_BAZEL

void* memcpy(void* __restrict dest, const void* __restrict src, size_t size) {
  return __builtin_memcpy(dest, src, size);
}

void* memmove(void* dest, const void* src, size_t size) {
  return __builtin_memmove(dest, src, size);
}

void* memset(void* mem, int val, size_t size) {
  return __builtin_memset(mem, val, size);
}

#endif
