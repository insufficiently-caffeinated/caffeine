#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EMatching/Filters.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine::ematching::reductions {

static void eliminate_to_bool(EMatcherBuilder& builder,
                              Operation::Opcode opcode, bool value) {
  size_t clause = builder.add_clause(
      opcode, {}, std::make_unique<IdenticalOperandsFilter>());
  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t) {
    egraph.add_merge(eclass_id, ENode{std::make_unique<ConstantIntData>(
                                    value ? llvm::APInt::getAllOnesValue(1)
                                          : llvm::APInt::getNullValue(1))});
  };

  builder.add_matcher(clause, std::move(matcher));
}

void icmp_eliminations(EMatcherBuilder& builder) {
  eliminate_to_bool(builder, Operation::ICmpEq, true);
  eliminate_to_bool(builder, Operation::ICmpNe, false);
  eliminate_to_bool(builder, Operation::ICmpUgt, false);
  eliminate_to_bool(builder, Operation::ICmpUge, true);
  eliminate_to_bool(builder, Operation::ICmpUlt, false);
  eliminate_to_bool(builder, Operation::ICmpUle, true);
  eliminate_to_bool(builder, Operation::ICmpSgt, false);
  eliminate_to_bool(builder, Operation::ICmpSge, true);
  eliminate_to_bool(builder, Operation::ICmpSlt, false);
  eliminate_to_bool(builder, Operation::ICmpSle, true);
}

} // namespace caffeine::ematching::reductions
