
#include "caffeine.h"

void test() {
  float nan = 0.0 / 0.0;

  caffeine_assert(nan != nan);
  caffeine_assert(nan < nan == false);
  caffeine_assert(nan <= nan == false);
  caffeine_assert(nan > nan == false);
  caffeine_assert(nan >= nan == false);
  caffeine_assert(nan == nan == false);
}
