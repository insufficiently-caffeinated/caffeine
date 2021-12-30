#include "caffeine.h"
#include <stdio.h>
#include <string.h>

const char* thing = "";

void test(int x) {
  caffeine_assert(strlen(thing) < 5);
}
