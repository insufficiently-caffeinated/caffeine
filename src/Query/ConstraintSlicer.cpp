#include "caffeine/Query/ConstraintSlicer.h"
#include "caffeine/Model/AssertionList.h"

namespace caffeine {

AssertionList ConstraintSlicer::slice(const AssertionList& assertions,
                                      const Assertion& extra) {
  /**
   * The algorithm used here is quite simple, we just add all the assertions
   * that share variables with the unproven set, and any assertions that share
   * variables with those ones, and so on.
   *
   * More formally, we could form a graph with the assertions as the vertices
   * and edges between those that share a constant. Then, we need to find all
   * vertices that are connected to the set of unproven assertions.
   *
   * Either way, the algorithm is the same: we just perform a DFS to find all
   * the assertions.
   */

  std::unordered_map<Symbol, llvm::SmallVector<Assertion, 4>> known;
  for (const Assertion& assertion : assertions.proven()) {
    for (const Symbol& symbol : contained_constants(assertion.value())) {
      known[symbol].push_back(assertion);
    }
  }

  AssertionList list;
  for (const Assertion& assertion : assertions.unproven()) {
    list.insert(assertion);
    for (const Symbol& symbol : contained_constants(assertion.value())) {
      auto it = known.find(symbol);
      if (it != known.end())
        list.insert(it->second);
    }
  }

  for (const Symbol& symbol : contained_constants(extra.value())) {
    auto it = known.find(symbol);
    if (it != known.end())
      list.insert(it->second);
  }

  for (const Assertion& assertion : assertions.unproven()) {
    list.insert(assertion);
  }

  return list;
}

llvm::ArrayRef<Symbol>
ConstraintSlicer::contained_constants(const OpRef& expr) {
  auto it = mapping_cache.find(expr);
  if (it != mapping_cache.end()) {
    return it->second;
  }

  std::unordered_set<Symbol> seen;
  calc_contained_constants(expr, seen);

  llvm::SmallVector<Symbol, 4> symbols(std::make_move_iterator(seen.begin()),
                                       std::make_move_iterator(seen.end()));
  return mapping_cache.emplace(expr, std::move(symbols)).first->second;
}

void ConstraintSlicer::calc_contained_constants(
    const OpRef& expr, std::unordered_set<Symbol>& out) {
  auto it = mapping_cache.find(expr);
  if (it != mapping_cache.end()) {
    out.insert(it->second.begin(), it->second.end());
    return;
  }

  if (auto c = llvm::dyn_cast<Constant>(expr.get())) {
    out.insert(c->symbol());
    return;
  }

  if (auto c = llvm::dyn_cast<ConstantArray>(expr.get())) {
    out.insert(c->symbol());
  }

  size_t size = expr->num_operands();
  for (size_t i = 0; i < size; ++i) {
    calc_contained_constants(expr->operand_at(i), out);
  }
}

} // namespace caffeine
