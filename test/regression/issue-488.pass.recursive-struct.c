#include "caffeine.h"

struct x {
  struct x* field_1;
  int field_2;
};

struct x global = {.field_1 = &global, .field_2 = 5};

void test(int a) {
  if (global.field_2 == a) {
    caffeine_assert(true);
  }
}
