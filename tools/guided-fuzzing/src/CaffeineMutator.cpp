#include "include/CaffeineMutator.h"

#include <cstdlib>
#include <iostream>

#include <llvm/ADT/iterator.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>

#include "caffeine/ADT/Guard.h"
#include "caffeine/ADT/Span.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Support/DiagnosticHandler.h"
#include "caffeine/Support/Tracing.h"

#include "GuidedExecutionPolicy.h"

#define CAFFEINE_FUZZ_TARGET "LLVMFuzzerTestOneInput"
#define CAFFEINE_FUZZ_START "caffeine.entry_point"
#define CAFFEINE_MAKE_SYMBOLIC "caffeine_builtin_symbolic_alloca"

namespace caffeine {
class NullFailureLogger : public caffeine::FailureLogger {
  NullFailureLogger(){};
  void log_failure(const caffeine::Model*, const caffeine::Context&,
                   const caffeine::Failure&) override {}
};

llvm::Function*
getTargetFunction(std::unique_ptr<llvm::Module>& module,
                  std::unique_ptr<llvm::LLVMContext>& llvm_context) {
  llvm::Function* fuzz_target = module->getFunction(CAFFEINE_FUZZ_START);
  auto bitwidth = module->getDataLayout().getPointerSizeInBits();
  if (!fuzz_target) {
    fuzz_target = llvm::Function::Create(
        llvm::FunctionType::get(llvm::Type::getVoidTy(*llvm_context),
                                llvm::Type::getIntNTy(*llvm_context, bitwidth),
                                false),
        llvm::Function::InternalLinkage, CAFFEINE_FUZZ_START, *module);

    auto llvm_fuzz_target = module->getFunction(CAFFEINE_FUZZ_TARGET);
    if (llvm_fuzz_target == nullptr) {
      llvm::WithColor::error()
          << "No method '" << CAFFEINE_FUZZ_TARGET << "'\n";
      CAFFEINE_ABORT();
    }

    auto caffeine_make_symbolic = module->getFunction(CAFFEINE_MAKE_SYMBOLIC);
    if (caffeine_make_symbolic == nullptr) {
      llvm::WithColor::error()
          << "No method '" << CAFFEINE_MAKE_SYMBOLIC << "'\n";
      CAFFEINE_ABORT();
    }

    auto bb = llvm::IRBuilder{
        llvm::BasicBlock::Create(*llvm_context, "body", fuzz_target)};

    auto alloca = bb.CreateCall(
        llvm::FunctionType::get(
            llvm::Type::getIntNPtrTy(*llvm_context, bitwidth),
            {llvm::Type::getIntNTy(*llvm_context, bitwidth),
             llvm::Type::getInt8PtrTy(*llvm_context)},
            false),
        caffeine_make_symbolic,
        {fuzz_target->getArg(0), bb.CreateGlobalStringPtr("__caffeine_mut")});

    bb.CreateCall(llvm::FunctionType::get(
                      llvm::Type::getIntNTy(*llvm_context, bitwidth),
                      {llvm::Type::getInt8PtrTy(*llvm_context),
                       llvm::Type::getIntNTy(*llvm_context, bitwidth)},
                      false),
                  llvm_fuzz_target, {alloca, fuzz_target->getArg(0)});

    bb.CreateRetVoid();
  }

  return fuzz_target;
}

CaffeineMutator::CaffeineMutator(std::string binary_path, afl_state_t* afl) {
  static tracing::TraceContext tracectx{"caffeine.trace"};

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

  // Create CAFFEINE_FUZZ_START automatically
  fuzz_target = getTargetFunction(module, llvm_context);

  solver = SolverBuilder::with_default().build();
}

size_t CaffeineMutator::mutate(caffeine::Span<char> data) {
  const std::lock_guard<std::mutex> lock(termination_mutex);
  if (terminated) {
    return 0;
  }

  caffeine::ExecutorOptions options;
  options.num_threads = 1;

  auto bitwidth = this->module->getDataLayout().getPointerSizeInBits();

  // Create a context and pass the size in as an argument
  auto context =
      Context(this->fuzz_target,
              {ConstantInt::Create(llvm::APInt(bitwidth, data.size()))});

  auto policy =
      caffeine::GuidedExecutionPolicy(data, "__caffeine_mut", this, cases);
  auto store = caffeine::QueueingContextStore(options.num_threads);
  auto logger = caffeine::PrintingFailureLogger(std::cout);
  auto builder = caffeine::SolverBuilder::with_default();
  auto exec = caffeine::Executor(&policy, &store, &logger, &builder, options);

  store.add_context(std::move(context));

  exec.run();
  return cases->size();
}

size_t CaffeineMutator::get_testcase(unsigned char** out_buf, size_t max_size) {
  while (!cases->empty()) {
    last_case = std::move(cases->back());
    cases->pop_back();

    if (last_case.size() > max_size)
      break;

    *out_buf = (unsigned char*)last_case.data();
    return last_case.size();
  }

  *out_buf = nullptr;
  return 0;
}

std::optional<caffeine::SharedArray>
CaffeineMutator::model_to_testcase(const Model* model, const Context& ctx,
                                   std::string symbol_name) {
  CAFFEINE_ASSERT(model, "Model must be non null");

  auto val = ctx.constants.find(symbol_name);
  if (val == nullptr) {
    return std::nullopt;
  }
  auto res = std::move(model->evaluate(**val).array());

  return res;
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
