#include "caffeine/Solver/SimplifyingSolver.h"

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Transforms.h"

#include <llvm/ADT/SmallVector.h>

#include <unordered_set>

namespace caffeine {

SolverResult SimplifyingSolver::resolve(AssertionList& assertions,
                                        const Assertion&) {
  transforms::simplify(assertions);
  return SolverResult::Unknown;
}

} // namespace caffeine
