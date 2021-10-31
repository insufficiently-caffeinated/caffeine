#pragma once

#include "caffeine/Solver/Solver.h"

namespace caffeine {

// Solver that logs it's incoming arguments when queried.
class LoggingSolver : public Solver {
private:
  std::shared_ptr<Solver> solver;

  bool should_filter(const AssertionList& assertions, const Assertion& extra);

  void log_arguments(const AssertionList& assertions, const Assertion& extra);
  void log_result(const SolverResult& result);

public:
  SolverResult check(AssertionList& assertions, const Assertion& extra);
  SolverResult resolve(AssertionList& assertions, const Assertion& extra);

  LoggingSolver(const std::shared_ptr<Solver>& solver);
};

} // namespace caffeine
