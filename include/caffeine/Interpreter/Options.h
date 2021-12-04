#ifndef CAFFEINE_INTERPRETER_OPTIONS_H
#define CAFFEINE_INTERPRETER_OPTIONS_H

#include <cstdint>

namespace caffeine {

struct InterpreterOptions {
  /**
   * Determines whether it's possible for malloc to ever return nullptr when
   * being called.
   *
   * Most programs don't want this so it defaults to false.
   */
  bool malloc_can_return_null = false;

  uint64_t malloc_alignment = 16;

  bool run_line_coverage_debugger = true;

  /**
   * This wont be implemented for a while but is nice to have it so for now
   * its false.
   */
  bool run_branch_coverage_debugger = false;

  InterpreterOptions() = default;
};

} // namespace caffeine

#endif
