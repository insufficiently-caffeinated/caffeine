#include "caffeine/Solver/CanonicalizingSolver.h"

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Transforms.h"

#include <llvm/ADT/SmallVector.h>

#include <unordered_set>

namespace caffeine {

SolverResult CanonicalizingSolver::check(AssertionList& assertions,
                                         const Assertion&) {
  transforms::canonicalize(assertions);
  return SolverResult::Unknown;
}
std::unique_ptr<Model> CanonicalizingSolver::resolve(AssertionList& assertions,
                                                     const Assertion&) {
  transforms::canonicalize(assertions);
  return std::make_unique<EmptyModel>(SolverResult::Unknown);
}

} // namespace caffeine
