
#include "builtins.h"
#include "caffeine/Support/Assert.h"
#include <fmt/format.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/WithColor.h>

using namespace llvm;

cl::opt<std::string> InputFilename(cl::Positional, cl::Required,
                                   cl::desc("<input file>"));
cl::opt<std::string> OutputFilename("o", cl::desc("output filename"),
                                    cl::value_desc("filename"), cl::init("-"));

int main(int argc, char** argv) {
  llvm::InitLLVM X{argc, argv};
  CAFFEINE_ASSERT(argc != 0,
                  "gen-builtins called with 0 command line arguments");

  llvm::cl::ParseCommandLineOptions(argc, argv,
                                    "\n  Replace all calls to certain LLVM "
                                    "builtins with implementations that"
                                    "\n  caffeine can execute.");

  llvm::LLVMContext context;
  llvm::SMDiagnostic error;

  std::unique_ptr<llvm::Module> module =
      llvm::parseIRFile(InputFilename, error, context);
  if (!module) {
    errs() << argv[0] << ": ";
    WithColor::error() << " loading file '" << InputFilename << "'\n";
    return EXIT_FAILURE;
  }

  for (llvm::Function& function : module->functions()) {
    if (!function.isDeclaration())
      continue;

    auto name = function.getName();
    if (name.startswith("llvm.memset.")) {
      caffeine::generateMemset(module.get(), &function);
      continue;
    }

    if (name.startswith("llvm.memcpy.")) {
      caffeine::generateMemcpy(module.get(), &function);
      continue;
    }
  }

  // NOTE: WriteBitcodeToFile seems to produce something that llvm-dis can't
  // parse for LLVM 10.0.0. To work around that I'm printing using textual IR.
  if (OutputFilename == "-") {
    module->print(llvm::outs(), nullptr);
  } else {
    std::error_code EC;
    llvm::raw_fd_ostream os(OutputFilename, EC);

    if (EC) {
      errs() << argv[0] << ": ";
      WithColor::error() << " unable to write to output file '"
                         << OutputFilename << "': " << EC.message() << "\n";
      return 1;
    }

    module->print(os, nullptr);
  }
}
