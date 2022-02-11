#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EMatching/Filters.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine::ematching::reductions {


void associativity(EMatcherBuilder& builder) {
  Operation::Opcode valid[] = {Operation::Add,  Operation::Mul, Operation::And,
                               Operation::Or,   Operation::Xor, Operation::FAdd,
                               Operation::FSub, Operation::FMul};

  for (auto opcode : valid)
    associativity(builder, opcode);
}
void associativity(EMatcherBuilder& builder, Operation::Opcode opcode) {
  size_t any = builder.add_clause(Operation::Invalid);
  size_t subclause = builder.add_clause(opcode);
  size_t parent = builder.add_clause(opcode, {any, subclause});

  builder.add_matcher(parent, [=](const MatchData& data, EGraph& egraph,
                                  size_t eclass_id, size_t node_id) {
    const EClass* parent = egraph.get(eclass_id);
    const ENode& pnode = parent->nodes[node_id];

    const EClass* child = egraph.get(pnode.operands[1]);
    for (size_t cnode_id : data.matches(subclause, pnode.operands[1])) {
      const ENode& cnode = child->nodes[cnode_id];

      size_t child =
          egraph.add(ENode{cnode.data, {pnode.operands[0], cnode.operands[0]}});

      egraph.add_merge(eclass_id,
                       ENode{pnode.data, {child, cnode.operands[1]}});
    }
  });
}

static void eliminate_to_zero(EMatcherBuilder& builder,
                              Operation::Opcode opcode) {
  size_t clause = builder.add_clause(
      opcode, {}, std::make_unique<IdenticalOperandsFilter>());
  builder.add_matcher(clause, [](const MatchData&, EGraph& egraph,
                                 size_t eclass, size_t) {
    egraph.add_merge(
        eclass,
        ENode{std::make_unique<ConstantIntData>(
            llvm::APInt::getNullValue(egraph.get(eclass)->type().bitwidth()))});
  });
}
static void eliminate_to_operand(EMatcherBuilder& builder,
                                 Operation::Opcode opcode) {
  size_t clause = builder.add_clause(
      opcode, {}, std::make_unique<IdenticalOperandsFilter>());
  builder.add_matcher(clause, [](const MatchData&, EGraph& egraph,
                                 size_t eclass_id, size_t enode_id) {
    const EClass* eclass = egraph.get(eclass_id);
    const ENode& enode = eclass->nodes[enode_id];

    egraph.merge(eclass_id, enode.operands[0]);
  });
}

void sub_elimination(EMatcherBuilder& builder) {
  eliminate_to_zero(builder, Operation::Sub);
}
void xor_elimination(EMatcherBuilder& builder) {
  eliminate_to_zero(builder, Operation::Xor);
}

void and_elimination(EMatcherBuilder& builder) {
  eliminate_to_operand(builder, Operation::And);
}
void or_elimination(EMatcherBuilder& builder) {
  eliminate_to_operand(builder, Operation::Or);
}

} // namespace caffeine::ematching::reductions

namespace caffeine::ematching {

void EMatcherBuilder::add_defaults() {
  reductions::commutativity(*this);
  reductions::associativity(*this);

  reductions::sub_elimination(*this);
  reductions::and_elimination(*this);
  reductions::xor_elimination(*this);
  reductions::or_elimination(*this);
}

} // namespace caffeine::ematching
