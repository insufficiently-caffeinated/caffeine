#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"

namespace caffeine::ematching::reductions {

// (load (store ?a ?b ?c) ?d) -> (select (icmp.eq ?b ?d) ?c (load ?a ?d))
void load_store_elimination(EMatcherBuilder& builder) {
  size_t any = builder.add_any();
  size_t store = builder.add_clause(Operation::Store);
  size_t load = builder.add_clause(Operation::Load, {store, any});

  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t node_id) {
    const EClass* load_class = egraph.get(eclass_id);
    const ENode& load_enode = load_class->nodes.at(node_id);
    const EClass* store_class = egraph.get(load_enode.operands[0]);

    for (size_t id : egraph.matches(store, load_enode.operands[0])) {
      const ENode& store_node = store_class->nodes.at(id);

      size_t icmp = egraph.add(ENode{
          std::make_unique<OperationData>(Operation::ICmpEq, Type::bool_ty()),
          {store_node.operands[1], load_enode.operands[1]}});
      size_t load = egraph.add(ENode{
          load_enode.data, {store_node.operands[0], load_enode.operands[1]}});
      egraph.add_merge(eclass_id,
                       ENode{std::make_unique<OperationData>(Operation::Select,
                                                             load_enode.type()),
                             {icmp, store_node.operands[2], load}});
    }
  };

  builder.add_matcher(load, matcher);
}

} // namespace caffeine::ematching::reductions
