#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EMatching/Filters.h"
#include "caffeine/IR/Operation.h"
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

// (icmp.eq (select ?a ?x ?y) ?x/?y) -> ?a/(not ?a)
// where ?x and ?y are constant integers
static void icmpeq_select_elimination(EMatcherBuilder& builder) {
  size_t any = builder.add_any();
  size_t iconst = builder.add_clause(Operation::ConstantInt);
  size_t select = builder.add_capture(Operation::Select, {any, iconst, iconst});
  size_t icmpeq = builder.add_capture(Operation::ICmpEq, {select, iconst});

  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t) {
    const ENode* inode = egraph.capture(icmpeq);
    const ENode* snode = egraph.capture(select);

    if (snode->operands[1] == snode->operands[2]) {
      // Do nothing, this case will be handled by eliminating the select
      // entirely.
    } else if (snode->operands[1] == inode->operands[1]) {
      egraph.merge(eclass_id, snode->operands[0]);
    } else if (snode->operands[2] == inode->operands[1]) {
      auto op = UnaryOp::CreateNot(egraph.get_op(snode->operands[0]));
      egraph.add_merge(eclass_id, op);
    }
  };

  builder.add_matcher(icmpeq, std::move(matcher));
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

  icmpeq_select_elimination(builder);
}

} // namespace caffeine::ematching::reductions
