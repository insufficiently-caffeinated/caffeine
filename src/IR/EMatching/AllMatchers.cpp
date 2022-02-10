#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EMatching/Filters.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine::ematching {

void EMatcherBuilder::add_defaults() {

  { // (sub ?x ?x) -> (ixx 0)
    size_t clause = add_clause(Operation::Sub, {},
                               std::make_unique<IdenticalOperandsFilter>());
    add_matcher(
        clause, [](const MatchData&, EGraph& egraph, size_t eclass, size_t) {
          egraph.add_merge(
              eclass,
              ENode{std::make_unique<ConstantIntData>(llvm::APInt::getNullValue(
                  egraph.get(eclass)->type().bitwidth()))});
        });
  }
}

} // namespace caffeine::ematching
