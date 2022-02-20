#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EMatching/Filters.h"

namespace caffeine::ematching::reductions {

void commutativity(EMatcherBuilder& builder) {
  Operation::Opcode valid[] = {
      Operation::Add,    Operation::Mul,    Operation::And,
      Operation::Or,     Operation::Xor,    Operation::FAdd,
      Operation::FSub,   Operation::FMul,   Operation::ICmpEq,
      Operation::ICmpNe, Operation::FCmpEq, Operation::FCmpNe};

  for (auto opcode : valid)
    commutativity(builder, opcode);
}

void commutativity(EMatcherBuilder& builder, Operation::Opcode opcode) {
  size_t clause = builder.add_clause(opcode);
  builder.add_matcher(clause, [](GraphAccessor& egraph, size_t eclass_id,
                                 size_t node_id) {
    const EClass* eclass = egraph.get(eclass_id);
    const ENode& node = eclass->nodes[node_id];

    egraph.add_merge(eclass_id,
                     ENode{node.data, {node.operands[1], node.operands[0]}});
  });
}

} // namespace caffeine::ematching::reductions
