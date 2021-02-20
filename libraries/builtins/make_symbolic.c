
#include "caffeine-builtins.h"
#include <string.h>

void caffeine_make_symbolic(void* mem, size_t size, const char* name) {
  caffeine_assert(!!name);

  void* symbolic = caffeine_builtin_symbolic_alloca(size, name);
  memcpy(mem, symbolic, size);
}
