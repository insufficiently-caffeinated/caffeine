#include <string.h>
#include <stdio.h>
#include "caffeine.h"

const char * thing = "";

void test(int x) {
  caffeine_assert(strlen(thing) == 5);
}
