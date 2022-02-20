#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine::ematching::reductions {

void select_constprop(EMatcherBuilder& builder) {
  size_t any = builder.add_any();
  size_t constant = builder.add_clause(Operation::ConstantInt);
  size_t select = builder.add_clause(Operation::Select, {constant, any, any});

  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t enode_id) {
    const EClass* eclass = egraph.get(eclass_id);
    const ENode& enode = eclass->nodes[enode_id];

    const EClass* cclass = egraph.get(enode.operands[0]);
    const ENode* cnode = cclass->constant();
    const auto* data = llvm::cast<ConstantIntData>(cnode->data.get());

    if (data->value().getBoolValue()) {
      egraph.merge(eclass_id, enode.operands[1]);
    } else {
      egraph.merge(eclass_id, enode.operands[2]);
    }
  };

  builder.add_matcher(select, std::move(matcher));
}

} // namespace caffeine::ematching::reductions
