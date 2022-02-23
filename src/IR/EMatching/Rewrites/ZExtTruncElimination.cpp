#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/Operation.h"

namespace caffeine::ematching::reductions {

void zext_trunc_elimination(EMatcherBuilder& builder) {
  size_t trunc = builder.add_clause(Operation::Trunc);
  size_t zext = builder.add_clause(Operation::ZExt);

  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t enode_id) {
    const EClass* eclass = egraph.get(eclass_id);
    const ENode& enode = eclass->nodes[enode_id];
    const EClass* tclass = egraph.get(enode.operands[0]);

    for (size_t tnode_id : egraph.matches(trunc, enode.operands[0])) {
      const ENode& tnode = tclass->nodes[tnode_id];

      auto op = BinaryOp::CreateAnd(
          UnaryOp::CreateTruncOrZExt(eclass->type(),
                                     egraph.get_op(tnode.operands[0])),
          ConstantInt::Create(llvm::APInt::getLowBitsSet(
              eclass->type().bitwidth(), tclass->type().bitwidth())));
      egraph.add_merge(eclass_id, op);
    }
  };

  builder.add_matcher(zext, std::move(matcher));
}

} // namespace caffeine::ematching::reductions
