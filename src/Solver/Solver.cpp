#include "caffeine/Solver/Solver.h"
#include "caffeine/IR/Assertion.h"

namespace caffeine {

Model::Model(SolverResult result) : result_(result) {}

SolverResult Solver::check(std::vector<Assertion>& assertions) {
  return check(assertions, Assertion());
}

SolverResult Solver::check(std::vector<Assertion>& assertions,
                           const Assertion& extra) {
  return resolve(assertions, extra)->result();
}

std::unique_ptr<Model> Solver::resolve(std::vector<Assertion>& assertions) {
  return resolve(assertions, Assertion());
}

} // namespace caffeine
