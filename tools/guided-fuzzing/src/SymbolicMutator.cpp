extern "C" {
#include "afl-fuzz.h"
}

#include <cstdlib>
#include <string>

#include "caffeine/ADT/Span.h"
#include "include/CaffeineMutator.h"

extern "C" {

caffeine::CaffeineMutator* afl_custom_init(afl_state_t* afl, unsigned int) {
  std::string fuzz_target = std::getenv("CAFFEINE_FUZZ_TARGET");

  caffeine::CaffeineMutator* mut =
      new caffeine::CaffeineMutator(fuzz_target, afl);

  return mut;
}

size_t afl_custom_fuzz(caffeine::CaffeineMutator* data, unsigned char* buf,
                       size_t buf_size, unsigned char** out_buf, unsigned char*,
                       size_t, size_t max_size) {
  caffeine::Span<uint8_t> testcase(buf, buf_size);
  return data->mutate(testcase, out_buf, max_size);
}

void afl_custom_deinit(caffeine::CaffeineMutator* data) {
  delete data;
}
}
