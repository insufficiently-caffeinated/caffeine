extern "C" {
#include "afl-fuzz.h"
}

#include <cstdlib>
#include <string>

#include "include/CaffeineMutator.h"
extern "C" {

caffeine::CaffeineMutator* afl_custom_init(afl_state_t* afl,
                                           unsigned int seed) {
  std::string fuzz_target = std::getenv("CAFFEINE_FUZZ_TARGET");

  caffeine::CaffeineMutator* mut =
      new caffeine::CaffeineMutator(fuzz_target, afl);

  return mut;
}

void afl_custom_deinit(caffeine::CaffeineMutator* data) {
  delete data;
}
}
