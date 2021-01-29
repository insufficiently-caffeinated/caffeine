
#include "caffeine/Solver/DecompSolver.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Matching.h"
#include "caffeine/Solver/SequenceSolver.h"

#include <algorithm>

namespace caffeine {

void DecompSolver::transform(std::vector<Assertion>& assertions) {
  using std::swap;
  using namespace matching;

  auto it = std::remove_if(
      assertions.begin(), assertions.end(),
      [](const auto& assertion) { return assertion.is_constant(true); });
  assertions.erase(it, assertions.end());

  for (size_t i = 0; i < assertions.size(); ++i) {
    // Keep performing the transformations until they stop working
    while (true) {
      ref<Operation> lhs, rhs, value;

      if (matches(assertions[i], And(lhs, rhs))) {
        *assertions[i].value() = *lhs;
        assertions.emplace_back(std::move(rhs));
        continue;
      }

      if (matches(assertions[i], Not(Or(lhs, rhs)))) {
        *assertions[i].value() = *UnaryOp::CreateNot(lhs);
        assertions.emplace_back(UnaryOp::CreateNot(rhs));
        continue;
      }

      if (matches(assertions[i], Not(Not(value)))) {
        *assertions[i].value() = *value;
        continue;
      }

      break;
    }
  }
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
