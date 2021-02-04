
#include "caffeine-builtins.h"

#include <stdint.h>
#include <string.h>

// This function is called implicitly by the interpreter to implement the memcpy
// intrinsic.
void caffeine_builtin_memcpy(void* dst_, void* src_, size_t size) {
  char* dst = caffeine_builtin_resolve(dst_, size);
  char* src = caffeine_builtin_resolve(src_, size);

  // Assert that the ranges don't overlap
  caffeine_assert(dst + size <= src || src + size <= dst);

  for (size_t i = 0; i < size; ++i) {
    dst[i] = src[i];
  }
}

// This function is called implicitly by the interpreter to implement the
// memmove intrinsic.
void caffeine_builtin_memmove(void* dst_, void* src_, size_t size) {
  char* dst = caffeine_builtin_resolve(dst_, size);
  char* src = caffeine_builtin_resolve(src_, size);

  // If dst and src overlap and writes to dst would overwrite part of src before
  // we would reach it then we need to copy backwards.
  if (dst + size > src && src + size > dst && dst >= src) {
    for (size_t i = size; i != 0; --i) {
      dst[i - 1] = src[i - 1];
    }
  } else {
    caffeine_builtin_memcpy(dst, src, size);
  }
}
