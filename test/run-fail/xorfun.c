#include "caffeine.h"
#include <stdint.h>

void test(int32_t secret) {
  if ((secret & 0b1) == 1) {
    if ((secret & 0b10) == 0) {
      if ((secret & 0b100) == 0b100) {
        caffeine_assert(false);
      }
    }
  }
}
