#pragma once

#include <atomic>

#include "caffeine/Interpreter/Executor.h"

namespace caffeine {

namespace signals {
  extern caffeine::Executor* executor;
  void stop_context();
} // namespace signals

// Register a global signal handler that augments the existing one registered by
// LLVM to also print out the symbolic call stack.
//
// On linux systems this will also ensure that the signal handler aborts
// appropriately (the LLVM one will not exit in cases such as SIGQUIT.)
void RegisterSignalHandlers();

} // namespace caffeine
