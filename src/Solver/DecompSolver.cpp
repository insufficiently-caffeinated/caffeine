
#include "caffeine/Solver/DecompSolver.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Transforms.h"

#include <algorithm>

namespace caffeine {

void DecompSolver::transform(std::vector<Assertion>& assertions) {
  transforms::decompose(assertions);

  auto it = std::remove_if(
      assertions.begin(), assertions.end(),
      [](const auto& assertion) { return assertion.is_constant_value(true); });
  assertions.erase(it, assertions.end());
}

SolverResult DecompSolver::check(std::vector<Assertion>& assertions,
                                 const Assertion&) {
  transform(assertions);
  return SolverResult::Unknown;
}
std::unique_ptr<Model> DecompSolver::resolve(std::vector<Assertion>& assertions,
                                             const Assertion&) {
  transform(assertions);
  return std::make_unique<EmptyModel>(SolverResult::Unknown);
}

} // namespace caffeine
