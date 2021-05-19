#include "caffeine/ADT/WeakMap.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Solver/Solver.h"
#include <llvm/ADT/SmallVector.h>
#include <memory>
#include <unordered_set>

namespace caffeine {

class SlicingSolver : public Solver {
private:
  weak_map<const Operation, llvm::SmallVector<Symbol, 4>> mapping_cache;
  std::unique_ptr<Solver> inner;

public:
  SlicingSolver(std::unique_ptr<Solver>&& inner);

  SolverResult check(AssertionList& assertions, const Assertion& extra);
  SolverResult resolve(AssertionList& assertions, const Assertion& extra);

private:
  llvm::ArrayRef<Symbol> contained_constants(const OpRef& expr);

  void calc_contained_constants(const OpRef& expr,
                                std::unordered_set<Symbol>& out);
};

} // namespace caffeine
