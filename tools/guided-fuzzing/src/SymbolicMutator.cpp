extern "C" {
#include "afl-fuzz.h"
}

#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>

#include "CaffeineMutator.h"
#include "caffeine/ADT/Span.h"

extern "C" {

caffeine::CaffeineMutator* afl_custom_init(afl_state_t* afl, unsigned int) {
  std::string fuzz_target = std::getenv("CAFFEINE_FUZZ_TARGET");

  caffeine::CaffeineMutator* mut =
      new caffeine::CaffeineMutator(fuzz_target, afl);

  return mut;
}

size_t afl_custom_fuzz(caffeine::CaffeineMutator* data, unsigned char* in_buf,
                       size_t, unsigned char** out_buf, unsigned char*, size_t,
                       size_t max_size) {
  *out_buf = in_buf; // Prevent AFL from thinking there was an error
  return data->get_testcase(out_buf, max_size);
}

unsigned int afl_custom_fuzz_count(caffeine::CaffeineMutator* data, char* buf,
                                   size_t buf_size) {
  caffeine::Span<char> testcase(buf, buf_size);
  return data->mutate(testcase);
}

void afl_custom_deinit(caffeine::CaffeineMutator* data) {
  if (data) {
    delete data;
  }
}
}
