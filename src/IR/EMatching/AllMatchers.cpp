#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EMatching/Filters.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine::ematching::reductions {

static void eliminate_to_zero(EMatcherBuilder& builder,
                              Operation::Opcode opcode) {
  size_t clause = builder.add_clause(
      opcode, {}, std::make_unique<IdenticalOperandsFilter>());
  builder.add_matcher(clause, [](GraphAccessor& egraph, size_t eclass, size_t) {
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
  builder.add_matcher(
      clause, [](GraphAccessor& egraph, size_t eclass_id, size_t enode_id) {
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

void and_zero_elimination(EMatcherBuilder& builder) {
  size_t lhs = builder.add_any();
  size_t rhs = builder.add_clause(
      Operation::ConstantInt, {},
      std::make_unique<ConstantOperandFilter>(llvm::APInt::getNullValue(1)));

  size_t clause = builder.add_clause(Operation::And, {lhs, rhs});

  builder.add_matcher(
      clause, [](GraphAccessor& egraph, size_t eclass_id, size_t enode_id) {
        const EClass* eclass = egraph.get(eclass_id);
        const ENode& enode = eclass->nodes.at(enode_id);

        egraph.merge(eclass_id, enode.operands[1]);
      });
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
  reductions::icmp_eliminations(*this);

  reductions::and_zero_elimination(*this);
  reductions::zext_trunc_elimination(*this);
}

} // namespace caffeine::ematching
