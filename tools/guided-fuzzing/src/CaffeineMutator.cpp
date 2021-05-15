#include "include/CaffeineMutator.h"

#include <cstdlib>

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

#include "include/GuidedExecutionPolicy.h"
#include "include/TestCaseFailureLogger.h"

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
  CAFFEINE_ASSERT(intTy,
                  "First parameter must be a pointer to an integer array");
  CAFFEINE_ASSERT(firstArgTy->getIntegerBitWidth() == 8,
                  "First parameter must be a pointer to a byte integer array");
  CAFFEINE_ASSERT(fuzz_target->args().begin()->onlyReadsMemory(),
                  "We have a pointer to a const value");

  auto secondArgTy =
      llvm::dyn_cast<llvm::IntegerType>(fuzz_target->getArg(1)->getType());
  CAFFEINE_ASSERT(secondArgTy, "Second parameter must be an integer");

  solver = caffeine::make_sequence_solver(caffeine::SimplifyingSolver(),
                                          caffeine::CanonicalizingSolver(),
                                          caffeine::Z3Solver());
}

size_t CaffeineMutator::mutate(caffeine::Span<uint8_t> data,
                               unsigned char** out_buf, size_t max_size) {
  caffeine::ExecutorOptions options;
  options.num_threads = 1;

  TestCaseStoragePtr cases = std::make_shared<TestCaseStorage>();

  auto addr_space = fuzz_target->getArg(0)->getType()->getPointerAddressSpace();
  auto ptr_width = module->getDataLayout().getPointerSizeInBits(addr_space);
  auto size = ConstantInt::Create(llvm::APInt(ptr_width, data.size()));

  auto context = Context(this->fuzz_target);
  auto frame = context.stack_top();

  // The first heap will be symbolic
  context.heaps.set_concrete(false);
  auto alloc_id = context.heaps[addr_space].allocate(
      size, ConstantInt::Create(llvm::APInt(ptr_width, 1)),
      ConstantArray::Create(Symbol("__cafmut_testcase_arr"), size),
      AllocationKind::Malloc, AllocationPermissions::Read, context);
  auto ptr = Pointer(alloc_id, ConstantInt::CreateZero(ptr_width), addr_space);

  context.heaps.set_concrete(true);

  // Assert that the size and contents of the test case are the same. These assertions are used
  // to guide the symbolic execution through the program.
  auto assertion_list = AssertionList{
    Assertion(ICmpOp::CreateICmpEQ(context.lookup(fuzz_target->getArg(1)).scalar().expr(), (int64_t) data.size()))
  };

  {
    auto arr = context.lookup(fuzz_target->getArg(0));
    for (size_t i = 0; i < data.size(); i++) {
      assertion_list.insert(
        Assertion(
          ICmpOp::CreateICmpEQ(
            context.heaps[ptr.heap()][ptr.alloc()].read(
              ptr.offset(),
              Type(llvm::dyn_cast<llvm::PointerType>(fuzz_target->getArg(0)->getType())->getElementType()),
              module->getDataLayout()
            ),
            data.data()[i]
          )
        )
      );
    }
  }

  auto policy = caffeine::GuidedExecutionPolicy(assertion_list, this, cases);
  auto store = caffeine::QueueingContextStore(options.num_threads);
  auto logger = caffeine::TestCaseFailureLogger(cases, this);
  auto exec = caffeine::Executor(&policy, &store, &logger, options);

  frame.insert(fuzz_target->getArg(0), LLVMValue(ptr));
  frame.insert(fuzz_target->getArg(1), size);

  store.add_context(std::move(context));

  exec.run();

  // Use the first case as the mutated output
  bool got_first = false;
  size_t bytes_written = 0;
  for (auto & test_case : *cases) {
    if (test_case.size() <= max_size) {
      if (!got_first) {
        *out_buf = (unsigned char *) malloc(test_case.size());
        memcpy(*out_buf, test_case.data(), test_case.size());
        bytes_written = test_case.size();
        got_first = true;
      } else {
        write_to_testcase(afl, test_case.data(), test_case.size());
      }
    }
  }

  return bytes_written;
}

caffeine::SharedArray CaffeineMutator::model_to_testcase(const Model* model,
                                        const Context& ctx) {
  CAFFEINE_ASSERT(model, "Model must be non null");

  auto val = ctx.lookup_const(fuzz_target->getArg(0));
  CAFFEINE_ASSERT(val, "First arg must have a value");
  CAFFEINE_ASSERT(val->is_scalar(), "First arg must have a scalar");
  CAFFEINE_ASSERT(val->scalar().is_pointer(),
                  "First args Value must be a pointer");
  auto ptr = val->scalar().pointer();

  // If this is not true, we need to resolve it manually
  CAFFEINE_ASSERT(ptr.is_resolved(), "Pointer must be resolved");

  // Get the testcase
  auto alloc = ctx.heaps[ptr.heap()][ptr.alloc()];
  return std::move(model->evaluate(*alloc.data()).array());
}

} // namespace caffeine
