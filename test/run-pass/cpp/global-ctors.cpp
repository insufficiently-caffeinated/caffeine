#include "caffeine.h"

bool initialized = false;

class GlobalInit {
public:
  GlobalInit() {
    initialized = true;
  }
};

GlobalInit initializer{};

extern "C" void test() {
  caffeine_assert(initialized);
}
