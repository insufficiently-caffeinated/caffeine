#include "caffeine/Solver/LoggingSolver.h"
#include "caffeine/Support/LLVMFmt.h"
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <iostream>
#include <magic_enum.hpp>

namespace caffeine {

LoggingSolver::LoggingSolver(const std::shared_ptr<Solver>& solver)
    : solver(solver) {}

bool LoggingSolver::should_filter(const AssertionList& assertions,
                                  const Assertion& extra) {
  if (extra.is_constant_value(false))
    return true;
  if (assertions.empty() && extra.is_constant_value(true))
    return true;
  return false;
}

void LoggingSolver::log_arguments(const AssertionList& assertions,
                                  const Assertion& extra) {
  fmt::print(std::cout, "Call to solver with arguments:\n");

  for (const auto& assertion : assertions)
    fmt::print(std::cout, FMT_STRING(" - {}\n"), assertion);
  if (!extra.is_constant_value(true))
    fmt::print(std::cout, FMT_STRING(" - {}\n"), extra);
  std::cout << std::flush;
}

void LoggingSolver::log_result(const SolverResult& result) {
  fmt::print(std::cout, FMT_STRING("Solver call exited with result {}\n"),
             magic_enum::enum_name(result.kind()));
}

SolverResult LoggingSolver::check(AssertionList& assertions,
                                  const Assertion& extra) {
  bool filter = should_filter(assertions, extra);
  if (!filter)
    log_arguments(assertions, extra);

  auto result = solver->check(assertions, extra);

  if (!filter)
    log_result(result);
  return result;
}

SolverResult LoggingSolver::resolve(AssertionList& assertions,
                                    const Assertion& extra) {
  bool filter = should_filter(assertions, extra);
  if (!filter)
    log_arguments(assertions, extra);

  auto result = solver->resolve(assertions, extra);

  if (!filter)
    log_result(result);
  return result;
}

} // namespace caffeine
