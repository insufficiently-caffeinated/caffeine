
#include <gtest/gtest.h>

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <boost/core/demangle.hpp>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/Signals.h>
#include <llvm/Support/raw_os_ostream.h>
#include <z3++.h>

static void signal_handler(void*) {
  try {
    if (const auto* context =
            caffeine::UnsupportedOperation::CurrentContextUnsafe()) {
      std::stringstream output;
      output << "\nSymbolic Backtrace\n";
      context->print_backtrace(output);
      llvm::errs() << output.rdbuf();
    }
  } catch (...) {
    llvm::errs()
        << "ERROR: Exception was thrown while attempting to print backtraces\n";
  }
  llvm::errs().flush();
}

int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  llvm::InitLLVM X(argc, argv);

  llvm::sys::AddSignalHandler(signal_handler, nullptr);

  return RUN_ALL_TESTS();
}
