#pragma once

#include <cstdio>
#include <memory>
#include <string>

#include <llvm/IR/Module.h>

#include "caffeine/ADT/Span.h"
#include "caffeine/Solver/Solver.h"

extern "C" {
#include "afl-fuzz.h"
}

namespace caffeine {

class CaffeineMutator {
public:
  afl_state_t* afl;

private:
  std::unique_ptr<llvm::Module> module;
  llvm::Function* fuzz_target;
  std::shared_ptr<Solver> solver;

public:
  CaffeineMutator(std::string binary_path, afl_state_t* afl);
  size_t mutate(caffeine::Span<uint8_t> data, unsigned char** out_buf,
                size_t max_size);
};

} // namespace caffeine
