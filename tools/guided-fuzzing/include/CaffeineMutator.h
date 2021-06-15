#pragma once

#include <cstdio>
#include <memory>
#include <mutex>
#include <string>

#include <llvm/IR/Module.h>

#include "caffeine/ADT/Span.h"
#include "caffeine/Solver/Solver.h"

extern "C" {
#include "afl-fuzz.h"
}

namespace caffeine {

typedef std::vector<std::string> TestCaseStorage;
typedef std::shared_ptr<TestCaseStorage> TestCaseStoragePtr;

struct CaffeineMutator {
public:
  afl_state_t* afl;

private:
  std::unique_ptr<llvm::Module> module;
  std::unique_ptr<llvm::LLVMContext> llvm_context;
  llvm::Function* fuzz_target;
  std::mutex termination_mutex;
  bool terminated = false;
  TestCaseStoragePtr cases = std::make_shared<TestCaseStorage>();

  std::string last_case;

public:
  std::shared_ptr<Solver> solver;

public:
  CaffeineMutator(std::string binary_path, afl_state_t* afl);
  size_t mutate(caffeine::Span<char> data);
  size_t get_testcase(unsigned char** out_buf, size_t max_size);
  std::optional<caffeine::SharedArray>
  model_to_testcase(const Model* model, const Context& ctx,
                    std::string symbol_name);

  void terminate();
  ~CaffeineMutator();
};

} // namespace caffeine
