#include "caffeine/Support/Signal.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <initializer_list>
#include <iostream>
#include <llvm/Support/Signals.h>
#include <llvm/Support/raw_os_ostream.h>
#include <sstream>

#ifdef __unix__
#include <signal.h>
#endif

namespace caffeine {
namespace {
  void dump_symbolic_backtrace(void*) {
    std::cout.flush();

    try {
      if (const auto* context =
              caffeine::UnsupportedOperation::CurrentContextUnsafe()) {
        std::stringstream output;
        output << "\nSymbolic Backtrace\n";
        context->print_backtrace(output);
        llvm::errs() << output.str();
      } else {
        llvm::errs() << "\nNo symbolic backtrace available\n";
      }
    } catch (...) {
      llvm::errs() << "ERROR: Exception was thrown while attempting to print "
                      "backtraces\n";
    }
    llvm::errs().flush();
  }

#ifdef __unix__
  // clang-format off
  static constexpr const int sys_signals[] = {
    SIGHUP, SIGINT, SIGTERM, SIGUSR2,
    SIGILL, SIGTRAP, SIGABRT, SIGFPE, SIGBUS, SIGSEGV, SIGQUIT
#ifdef SIGSYS
    , SIGSYS
#endif
#ifdef SIGXCPU
    , SIGXCPU
#endif
#ifdef SIGXFSZ
    , SIGXFSZ
#endif
#ifdef SIGEMT
    , SIGEMT
#endif
  };
  // clang-format on

  static constexpr int max_signal =
      *std::max_element(std::begin(sys_signals), std::end(sys_signals));
  struct sigaction sigactions[max_signal + 1] = {};

  void signal_handler(int sig) {
    alarm(30);

    if (sigactions[sig].sa_handler)
      sigactions[sig].sa_handler(sig);

    if (sig == SIGINT) {
      // Don't want to raise SIGINT because we exit gracefully
      return;
    }

    if (sigactions[sig].sa_flags & SA_RESETHAND)
      raise(sig);
  }
#endif
} // namespace

namespace signals {
  caffeine::Executor* executor = nullptr;
  void stop_context() {
    std::cout.flush();

    if (executor) {
      executor->interrupt();
    }
  }
} // namespace signals

void RegisterSignalHandlers() {
  llvm::sys::AddSignalHandler(&dump_symbolic_backtrace, nullptr);

#if __unix__
  // Wrap all existing signal handlers with one that reraises the signal with
  // the default handler at the end if it is a fatal signal.
  std::memset(sigactions, 0, sizeof(sigactions));
  for (int sig : sys_signals) {
    sigaction(sig, nullptr, &sigactions[sig]);

    struct sigaction new_handler;
    new_handler.sa_handler = signal_handler;
    new_handler.sa_flags = sigactions[sig].sa_flags;
    sigaction(sig, &new_handler, nullptr);
  }
#endif
}

} // namespace caffeine
