#include "caffeine/Support/UnsupportedOperation.h"
#include "caffeine/Interpreter/Context.h"
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/Support/Signals.h>
#include <llvm/Support/raw_ostream.h>
#include <sstream>

namespace caffeine {

thread_local const Context* UnsupportedOperation::CurrentContext;
std::atomic<bool> UnsupportedOperation::RecoverFailures{true};

void UnsupportedOperation::Abort(const char* condition, const char* function,
                                 unsigned int line, const char* file,
                                 std::string_view message) {
  std::stringstream output;
  fmt::print(output,
             "Unsupported operation: {}\n"
             "  location: {}:{}\n"
             "  function: {}\n",
             message, file, line, function);

  if (condition)
    fmt::print(output, "  condition: {}\n", condition);

  if (CurrentContext) {
    fmt::print(output, "\nSymbolic Backtrace:\n");
    CurrentContext->print_backtrace(output);
  }

  fmt::print(output, "\nCaffeine Backtrace:\n");
  llvm::errs() << output.str();
  llvm::errs().flush();
  // PrintStackTrace may just end up printing straight to stderr in some cases
  // (even if we pass in a different ostream) so just always print it out to
  // stderr.
  llvm::sys::PrintStackTrace(llvm::errs());

  if (RecoverFailures.load())
    throw UnsupportedOperationException(output.str());
  std::exit(127);
}

} // namespace caffeine
