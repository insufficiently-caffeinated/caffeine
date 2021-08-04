#include "caffeine.h"

typedef struct aba {
  struct aba* ohyes;
  int field;
} aba;

aba thingwewant2;
const aba thingwewant = {.field = 5, .ohyes = &thingwewant2};
aba thingwewant1 = {.ohyes = &thingwewant};
aba thingwewant2 = {.ohyes = &thingwewant1};

void test(int a) {
  if (thingwewant2.ohyes->ohyes->field == a) {
    caffeine_assert(true);
  }
}
