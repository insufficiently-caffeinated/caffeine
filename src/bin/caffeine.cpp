
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Solver/Z3Solver.h"

#include <llvm/IR/DiagnosticInfo.h>
#include <llvm/IR/DiagnosticPrinter.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/WithColor.h>

#include <iostream>
#include <memory>

using namespace llvm;

using caffeine::Context;
using caffeine::Executor;
using caffeine::Interpreter;

class CountingFailureLogger : public caffeine::PrintingFailureLogger {
public:
  uint64_t num_failures = 0;

  using caffeine::PrintingFailureLogger::PrintingFailureLogger;

  void log_failure(const caffeine::Model* model,
                   const caffeine::Context& ctx) override {
    num_failures += 1;
    caffeine::PrintingFailureLogger::log_failure(model, ctx);
  }
};

cl::opt<std::string> input_filename{cl::Positional};
cl::opt<std::string> target_method{cl::Positional};

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

  LLVMContext context;
  context.setDiagnosticHandler(std::make_unique<DecafDiagnosticHandler>(),
                               true);

  cl::ParseCommandLineOptions(argc, argv, "symbolic executor for LLVM IR");

  auto module = loadFile(argv[0], input_filename.getValue(), context);
  if (!module) {
    errs() << argv[0] << ": ";
    WithColor::error() << " loading file '" << input_filename.getValue()
                       << "'\n";
    return 1;
  }

  auto function = module->getFunction(target_method.getValue());
  if (!function) {
    errs() << argv[0] << ": ";
    WithColor::error() << " no method '" << target_method.getValue() << "'";
    return 1;
  }

  std::shared_ptr<caffeine::Solver> solver =
      std::make_shared<caffeine::Z3Solver>();
  auto logger = CountingFailureLogger{std::cout};

  Executor exec;
  exec.add_context(Context{function, solver});

  while (exec.has_next()) {
    auto ctx = exec.next_context();
    Interpreter interp{&exec, &ctx, &logger};

    interp.execute();
  }

  if (logger.num_failures == 0)
    return 0;
  return 1;
}
