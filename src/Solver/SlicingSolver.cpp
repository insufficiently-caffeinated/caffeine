#include "caffeine/Solver/SlicingSolver.h"
#include <unordered_map>

namespace caffeine {

SlicingSolver::SlicingSolver(std::unique_ptr<Solver>&& inner)
    : inner(std::move(inner)) {}

SolverResult SlicingSolver::resolve(AssertionList& assertions,
                                    const Assertion& extra) {
  return inner->resolve(assertions, extra);
}

SolverResult SlicingSolver::check(AssertionList& assertions,
                                  const Assertion& extra) {
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

  return inner->check(list, extra);
}

llvm::ArrayRef<Symbol>
SlicingSolver::contained_constants(const OpRef& expr) {  
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

void SlicingSolver::calc_contained_constants(const OpRef& expr,
                                             std::unordered_set<Symbol>& out) {
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