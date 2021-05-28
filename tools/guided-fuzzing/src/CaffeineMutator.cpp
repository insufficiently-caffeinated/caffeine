#include "include/CaffeineMutator.h"

#include <cstdlib>
#include <iostream>

#include <llvm/ADT/iterator.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>

#include "caffeine/ADT/Span.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Solver/CanonicalizingSolver.h"
#include "caffeine/Solver/SequenceSolver.h"
#include "caffeine/Solver/SimplifyingSolver.h"
#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/Support/DiagnosticHandler.h"

#include "GuidedExecutionPolicy.h"

#define CAFFEINE_FUZZ_TARGET "LLVMFuzzerTestOneInput"
#define CAFFEINE_FUZZ_START "main"

namespace caffeine {
CaffeineMutator::CaffeineMutator(std::string binary_path, afl_state_t* afl) {
  this->afl = afl;

  llvm_context = std::make_unique<llvm::LLVMContext>();
  llvm_context->setDiagnosticHandler(
      std::make_unique<CaffeineDiagnosticHandler>(), true);

  llvm::SMDiagnostic error;
  module = llvm::parseIRFile(binary_path, error, *llvm_context);

  if (!module) {
    error.print("caffeine-mutator", llvm::errs());
    CAFFEINE_ABORT();
  }

  fuzz_target = module->getFunction(CAFFEINE_FUZZ_START);
  if (fuzz_target == nullptr) {
    llvm::WithColor::error() << "No method '" << CAFFEINE_FUZZ_START << "'\n";
    CAFFEINE_ABORT();
  }

  solver = caffeine::make_sequence_solver(caffeine::SimplifyingSolver(),
                                          caffeine::CanonicalizingSolver(),
                                          caffeine::Z3Solver());
}

size_t CaffeineMutator::mutate(caffeine::Span<uint8_t> data,
                               unsigned char** out_buf, size_t max_size) {
  const std::lock_guard<std::mutex> lock(termination_mutex);
  if (terminated) {
    return 0;
  }

  caffeine::ExecutorOptions options;
  options.num_threads = 1;

  TestCaseStoragePtr cases = std::make_shared<TestCaseStorage>();

  auto context = Context(this->fuzz_target);
  auto frame = context.stack_top();

  auto policy =
      caffeine::GuidedExecutionPolicy(data, "__caffeine_mut", this, cases);
  auto store = caffeine::QueueingContextStore(options.num_threads);
  auto logger = caffeine::PrintingFailureLogger(std::cout);
  auto exec = caffeine::Executor(&policy, &store, &logger, options);

  store.add_context(std::move(context));

  exec.run();

  // Use the first case as the mutated output
  bool got_first = false;
  size_t bytes_written = 0;
  for (auto& test_case : *cases) {
    if (test_case.size() <= max_size) {
      if (!got_first) {
        *out_buf = (unsigned char*)malloc(test_case.size());
        memcpy(*out_buf, test_case.data(), test_case.size());
        bytes_written = test_case.size();
        got_first = true;
      } else {
        // TODO: Write to testcase dir manually
      }
    }
  }

  return bytes_written;
}

caffeine::SharedArray
CaffeineMutator::model_to_testcase(const Model* model, const Context& ctx,
                                   std::string symbol_name) {
  CAFFEINE_ASSERT(model, "Model must be non null");

  return std::move(
      model->evaluate(*ctx.constants.find(symbol_name)->get()).array());
}

void CaffeineMutator::terminate() {
  const std::lock_guard<std::mutex> lock(termination_mutex);
  terminated = true;
  // Module needs to be deleted before the context gets deleted
  module.reset();
}

CaffeineMutator::~CaffeineMutator() {
  terminate();
}

} // namespace caffeine
