#include "caffeine/ADT/WeakMap.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Query/ConstraintSlicer.h"
#include "caffeine/Solver/Solver.h"
#include <llvm/ADT/SmallVector.h>
#include <memory>
#include <unordered_set>

namespace caffeine {

class SlicingSolver : public Solver {
private:
  ConstraintSlicer slicer;
  std::unique_ptr<Solver> inner;

public:
  SlicingSolver(std::unique_ptr<Solver>&& inner);

  SolverResult check(AssertionList& assertions, const Assertion& extra);
  SolverResult resolve(AssertionList& assertions, const Assertion& extra);
};

} // namespace caffeine
