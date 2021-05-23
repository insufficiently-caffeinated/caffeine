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

  fuzz_target = module->getFunction(CAFFEINE_FUZZ_TARGET);
  if (fuzz_target == nullptr) {
    llvm::WithColor::error() << "No method '" << CAFFEINE_FUZZ_TARGET << "'\n";
    CAFFEINE_ABORT();
  }

  // Make sure we have the right function signature
  CAFFEINE_ASSERT(fuzz_target->arg_size() == 2,
                  "Fuzz target must have two parameters");

  auto first_arg = fuzz_target->getArg(0);
  CAFFEINE_ASSERT(first_arg, "fuzz_target has an argument");

  auto first_arg_ty = llvm::dyn_cast<llvm::PointerType>(first_arg->getType());
  CAFFEINE_ASSERT(first_arg_ty, "First parameter must be a pointer");
  auto intTy =
      llvm::dyn_cast<llvm::IntegerType>(first_arg_ty->getElementType());
  CAFFEINE_ASSERT(intTy,
                  "First parameter must be a pointer to an integer array");
  CAFFEINE_ASSERT(first_arg_ty->getElementType()->getIntegerBitWidth() == 8,
                  "First parameter must be a pointer to a byte integer array");

  auto second_arg_ty =
      llvm::dyn_cast<llvm::IntegerType>(fuzz_target->getArg(1)->getType());
  CAFFEINE_ASSERT(second_arg_ty, "Second parameter must be an integer");

  solver = caffeine::make_sequence_solver(caffeine::SimplifyingSolver(),
                                          caffeine::CanonicalizingSolver(),
                                          caffeine::Z3Solver());
}

size_t CaffeineMutator::mutate(caffeine::Span<uint8_t> data,
                               unsigned char** out_buf, size_t max_size) {
  caffeine::ExecutorOptions options;
  options.num_threads = 1;

  auto first_arg = fuzz_target->getArg(0);
  auto first_arg_ty = first_arg->getType();

  TestCaseStoragePtr cases = std::make_shared<TestCaseStorage>();

  auto addr_space = first_arg_ty->getPointerAddressSpace();
  auto ptr_width = module->getDataLayout().getPointerSizeInBits(addr_space);
  auto size = ConstantInt::Create(llvm::APInt(ptr_width, data.size()));

  auto context = Context(this->fuzz_target);
  auto frame = context.stack_top();

  // Assert that the size and contents of the test case are the same. These
  // assertions are used to guide the symbolic execution through the program.
  auto assertion_list = AssertionList{Assertion(ICmpOp::CreateICmpEQ(
      context.lookup(fuzz_target->getArg(1)).scalar().expr(),
      (int64_t)data.size()))};

  auto ptr = context.lookup(first_arg).scalar().pointer();

  {
    CAFFEINE_ASSERT(ptr.is_resolved(), "Pointer must be resolved");
    auto arr = context.lookup(fuzz_target->getArg(0));
    for (size_t i = 0; i < data.size(); i++) {
      assertion_list.insert(Assertion(ICmpOp::CreateICmpEQ(
          context.heaps[ptr.heap()][ptr.alloc()].read(
              ptr.offset(),
              Type(llvm::dyn_cast<llvm::PointerType>(first_arg_ty)
                       ->getElementType()),
              module->getDataLayout()),
          data.data()[i])));
    }
  }

  auto policy =
      caffeine::GuidedExecutionPolicy(data, "__caffeine_mut", this, cases);
  auto store = caffeine::QueueingContextStore(options.num_threads);
  auto logger = caffeine::PrintingFailureLogger(std::cout);
  auto exec = caffeine::Executor(&policy, &store, &logger, options);

  frame.insert(fuzz_target->getArg(0), LLVMValue(ptr));
  frame.insert(fuzz_target->getArg(1), size);

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

} // namespace caffeine
