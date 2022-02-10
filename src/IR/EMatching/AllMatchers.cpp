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

  { // (#binop ?x ?y) -> (#binop ?y ?x) for commutative operations
    Operation::Opcode valid[] = {
        Operation::Add,    Operation::Mul,    Operation::And,
        Operation::Or,     Operation::Xor,    Operation::FAdd,
        Operation::FSub,   Operation::FMul,   Operation::ICmpEq,
        Operation::ICmpNe, Operation::FCmpEq, Operation::FCmpNe};

    for (auto opcode : valid) {
      size_t clause = add_clause(opcode);
      add_matcher(clause, [](const MatchData&, EGraph& egraph, size_t eclass_id,
                             size_t node_id) {
        const EClass* eclass = egraph.get(eclass_id);
        const ENode& node = eclass->nodes[node_id];

        egraph.add_merge(
            eclass_id, ENode{node.data, {node.operands[1], node.operands[0]}});
      });
    }
  }
}

} // namespace caffeine::ematching
