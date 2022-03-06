#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/Operation.h"

namespace caffeine::ematching::reductions {

void zext_trunc_elimination(EMatcherBuilder& builder) {
  size_t trunc = builder.add_capture(Operation::Trunc);
  size_t zext = builder.add_capture(Operation::ZExt, {trunc});

  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t) {
    const ENode* tnode = egraph.capture(trunc);
    const ENode* znode = egraph.capture(zext);

    auto op = BinaryOp::CreateAnd(
        UnaryOp::CreateTruncOrZExt(znode->type(),
                                   egraph.get_op(tnode->operands[0])),
        ConstantInt::Create(llvm::APInt::getLowBitsSet(
            znode->type().bitwidth(), tnode->type().bitwidth())));
    egraph.add_merge(eclass_id, op);
  };

  builder.add_matcher(zext, std::move(matcher));
}

void trunc_zext_elimination(EMatcherBuilder& builder) {
  size_t zext = builder.add_capture(Operation::ZExt);
  size_t trunc = builder.add_capture(Operation::Trunc, {zext});

  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t) {
    const ENode* znode = egraph.capture(zext);
    const ENode* tnode = egraph.capture(trunc);

    auto op = UnaryOp::CreateTruncOrZExt(tnode->type(),
                                         egraph.get_op(znode->operands[0]));
    egraph.add_merge(eclass_id, op);
  };

  builder.add_matcher(trunc, std::move(matcher));
}

} // namespace caffeine::ematching::reductions
