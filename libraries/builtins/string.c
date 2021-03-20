
#include "caffeine-builtins.h"

#include <stdint.h>
#include <string.h>

static void __attribute__((optnone)) caffeine_builtin_memcpy_nocheck(void* dst_, void* src_, size_t size) {
  char* dst = (char*)caffeine_builtin_resolve(dst_, size);
  char* src = (char*)caffeine_builtin_resolve(src_, size);

  for (size_t i = 0; i < size; ++i) {
    dst[i] = src[i];
  }
}

// This function is called implicitly by the interpreter to implement the memcpy
// intrinsic.
void __attribute__((optnone, used)) caffeine_builtin_memcpy(void* dst, void* src, size_t size) {
  // Assert that the ranges don't overlap
  caffeine_assert(dst + size <= src || src + size <= dst);

  caffeine_builtin_memcpy_nocheck(dst, src, size);
}

// This function is called implicitly by the interpreter to implement the
// memmove intrinsic.
void __attribute__((optnone, used)) caffeine_builtin_memmove(void* dst_, void* src_, size_t size) {
  char* dst = (char*)caffeine_builtin_resolve(dst_, size);
  char* src = (char*)caffeine_builtin_resolve(src_, size);

  // If dst and src overlap and writes to dst would overwrite part of src before
  // we would reach it then we need to copy backwards.
  if (dst + size > src && src + size > dst && dst >= src) {
    for (size_t i = size; i != 0; --i) {
      dst[i - 1] = src[i - 1];
    }
  } else {
    caffeine_builtin_memcpy_nocheck(dst, src, size);
  }
}
