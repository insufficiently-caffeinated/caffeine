#pragma once

#include <cstdio>
#include <string>

// Definition required otherwise AFL defines "R" which breaks some LLVM code
#define AFL_LLVM_PASS (1)

extern "C" {
#include "afl-fuzz.h"
}

namespace caffeine {

class CaffeineMutator {
private:
  afl_state_t* afl;

public:
  CaffeineMutator(std::string binary_path, afl_state_t* afl);
};

} // namespace caffeine
