
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Support/UnsupportedOperation.h"

#include <boost/core/demangle.hpp>
#include <llvm/IR/DiagnosticInfo.h>
#include <llvm/IR/DiagnosticPrinter.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/Signals.h>
#include <llvm/Support/WithColor.h>
#include <llvm/Support/raw_os_ostream.h>
#include <z3++.h>

#include <atomic>
#include <exception>
#include <iostream>
#include <memory>
#include <signal.h>
#include <thread>

using namespace llvm;

using caffeine::Context;
using caffeine::Executor;
using caffeine::Interpreter;

class CountingFailureLogger : public caffeine::PrintingFailureLogger {
public:
  std::atomic<uint64_t> num_failures = 0;
  llvm::Function* func;

  CountingFailureLogger(std::ostream& os, llvm::Function* func)
      : PrintingFailureLogger(os), func{func} {}

  void log_failure(const caffeine::Model& model, const caffeine::Context& ctx,
                   const caffeine::Failure& failure) override {
    num_failures += 1;
    caffeine::PrintingFailureLogger::log_failure(model, ctx, failure);
  }
};

cl::opt<std::string> input_filename{cl::Positional};
cl::opt<std::string> target_method{cl::Positional};
cl::opt<bool> invert_exitcode{
    "invert-exitcode",
    cl::desc("invert the exit code. 0 if the program returns a failure, 1 "
             "otherwise. All other exit codes remain the same.")};
cl::opt<size_t> threads{
    "t", cl::desc("the number of threads to use. 0 means num_cpus")};

static ExitOnError exit_on_err;

namespace {
struct DecafDiagnosticHandler : public DiagnosticHandler {
  bool handleDiagnostics(const DiagnosticInfo& di) override {
    unsigned severity = di.getSeverity();
    switch (severity) {
    case DS_Error:
      WithColor::error();
      break;
    case DS_Warning:
      WithColor::warning();
      break;
    case DS_Remark:
      WithColor::remark();
      break;
    case DS_Note:
      WithColor::note();
      break;
    default:
      llvm_unreachable("DiagnosticInfo had unknown severity level");
    }

    DiagnosticPrinterRawOStream dp(errs());
    di.print(dp);
    errs() << '\n';

    return true;
  }
};

// Handler to print a symbolic backtrace if available
static void signal_handler(void*) {
  try {
    if (const auto* context =
            caffeine::UnsupportedOperation::CurrentContextUnsafe()) {
      std::stringstream output;
      output << "\nSymbolic Backtrace:\n";
      context->print_backtrace(output);
      llvm::errs() << output.str();
    }

  } catch (...) {
    llvm::errs()
        << "ERROR: Exception was thrown while attempting to print backtraces\n";
  }
  llvm::errs().flush();
}

} // namespace

static std::unique_ptr<Module>
loadFile(const char* argv0, const std::string& filename, LLVMContext& context) {
  llvm::SMDiagnostic error;
  auto module = llvm::parseIRFile(filename, error, context);

  if (!module) {
    error.print(argv0, llvm::errs());
    return nullptr;
  }

  return module;
}

int main(int argc, char** argv) {
  InitLLVM X(argc, argv);
  exit_on_err.setBanner(std::string(argv[0]) + ":");

  llvm::sys::AddSignalHandler(signal_handler, nullptr);

  LLVMContext context;
  context.setDiagnosticHandler(std::make_unique<DecafDiagnosticHandler>(),
                               true);

  cl::ParseCommandLineOptions(argc, argv, "symbolic executor for LLVM IR");

  auto module = loadFile(argv[0], input_filename.getValue(), context);
  if (!module) {
    errs() << argv[0] << ": ";
    WithColor::error() << " loading file '" << input_filename.getValue()
                       << "'\n";
    return 2;
  }

  auto function = module->getFunction(target_method.getValue());
  if (!function) {
    errs() << argv[0] << ": ";
    WithColor::error() << " no method '" << target_method.getValue() << "'\n";
    return 2;
  }

  auto logger = CountingFailureLogger{std::cout, function};

  caffeine::ExecutorOptions options;
  options.num_threads =
      threads != 0 ? threads : std::thread::hardware_concurrency();

  auto policy = caffeine::AlwaysAllowExecutionPolicy();
  auto store = caffeine::QueueingContextStore(options.num_threads);
  auto exec = caffeine::Executor(&policy, &store, &logger, options);

  store.add_context(Context(function));

  exec.run();

  int exitcode = logger.num_failures == 0 ? 0 : 1;

  if (invert_exitcode)
    exitcode = !exitcode;

  return exitcode;
}
