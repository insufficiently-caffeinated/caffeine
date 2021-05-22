#include "caffeine/Solver/SlicingSolver.h"
#include <unordered_map>

namespace caffeine {

SlicingSolver::SlicingSolver(std::unique_ptr<Solver>&& inner)
    : inner(std::move(inner)) {}

SolverResult SlicingSolver::check(AssertionList& assertions,
                                  const Assertion& extra) {
  auto list = slicer.slice(assertions, extra);
  return inner->check(list, extra);
}

SolverResult SlicingSolver::resolve(AssertionList& assertions,
                                    const Assertion& extra) {
  return inner->resolve(assertions, extra);
}

} // namespace caffeine
