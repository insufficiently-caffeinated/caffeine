#include "include/CaffeineMutator.h"

#include <cstdlib>

#include <llvm/ADT/iterator.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>

#include "caffeine/ADT/Span.h"
#include "caffeine/Support/DiagnosticHandler.h"

#include "include/GuidedExecutionPolicy.h"

#define CAFFEINE_FUZZ_TARGET "LLVMFuzzerTestOneInput"

namespace caffeine {
CaffeineMutator::CaffeineMutator(std::string binary_path, afl_state_t* afl) {
  this->afl = afl;

  llvm::LLVMContext context;
  context.setDiagnosticHandler(std::make_unique<DecafDiagnosticHandler>(),
                               true);

  llvm::SMDiagnostic error;
  module = llvm::parseIRFile(binary_path, error, context);

  if (!module) {
    error.print("caffeine-mutator", llvm::errs());
    std::exit(1);
  }

  fuzz_target = module->getFunction(CAFFEINE_FUZZ_TARGET);
  if (!fuzz_target) {
    llvm::WithColor::error() << "No method '" << CAFFEINE_FUZZ_TARGET << "'\n";
    std::exit(1);
  }

  // Make sure we have the right function signature
  CAFFEINE_ASSERT(fuzz_target->arg_size() == 2,
                  "Fuzz target must have two parameters");

  auto firstArgTy =
      llvm::dyn_cast<llvm::PointerType>(fuzz_target->getArg(0)->getType());
  CAFFEINE_ASSERT(firstArgTy, "First parameter must be a pointer");
  auto intTy = llvm::dyn_cast<llvm::IntegerType>(firstArgTy->getElementType());
  CAFFEINE_ASSERT(firstArgTy,
                  "First parameter must be a pointer to an integer array");
  CAFFEINE_ASSERT(firstArgTy->getIntegerBitWidth() == 8,
                  "First parameter must be a pointer to a byte integer array");
  CAFFEINE_ASSERT(fuzz_target->args().begin()->onlyReadsMemory(),
                  "We have a pointer to a const value");

  auto secondArgTy =
      llvm::dyn_cast<llvm::IntegerType>(fuzz_target->getArg(1)->getType());
  CAFFEINE_ASSERT(firstArgTy, "Second parameter must be an integer");
}

size_t CaffeineMutator::mutate(caffeine::Span<uint8_t> data,
                               unsigned char** out_buf, size_t max_size) {
  auto policy = caffeine::AlwaysAllowExecutionPolicy();
  auto store = caffeine::QueueingContextStore(1);
  auto exec = caffeine::Executor(&policy, &store, &logger, options);

  auto context = Context(function);
  context.heaps.set_concrete(!force_symbolic_allocator);
  store.add_context(std::move(context));
}

} // namespace caffeine
