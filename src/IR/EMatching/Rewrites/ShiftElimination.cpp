#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine::ematching::reductions {

namespace {
  void lshr_elim(EMatcherBuilder& builder) {
    size_t any = builder.add_any();
    size_t iconst = builder.add_capture(Operation::ConstantInt);
    size_t lshr = builder.add_capture(Operation::LShr, {any, iconst});
    size_t shl = builder.add_clause(Operation::Shl, {lshr, iconst});

    auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t) {
      auto consts = egraph.captures(iconst);

      const llvm::APInt& rshift =
          llvm::cast<ConstantIntData>(consts[0]->data.get())->value();
      const llvm::APInt& lshift =
          llvm::cast<ConstantIntData>(consts[1]->data.get())->value();
      const ENode* shiftop = egraph.capture(lshr);

      auto mask = llvm::APInt::getAllOnesValue(shiftop->type().bitwidth())
                      .lshr(rshift)
                      .shl(lshift);

      if (rshift == lshift) {
        auto value = BinaryOp::CreateAnd(egraph.get_op(shiftop->operands[0]),
                                         ConstantInt::Create(mask));
        egraph.add_merge(eclass_id, value);
      } else if (rshift.ult(lshift)) {
        auto shift = lshift - rshift;
        auto value = BinaryOp::CreateAnd(
            BinaryOp::CreateShl(egraph.get_op(shiftop->operands[0]),
                                ConstantInt::Create(shift)),
            ConstantInt::Create(mask));

        egraph.add_merge(eclass_id, value);
      } else {
        auto shift = rshift - lshift;
        auto value = BinaryOp::CreateAnd(
            BinaryOp::CreateLShr(egraph.get_op(shiftop->operands[0]),
                                 ConstantInt::Create(shift)),
            ConstantInt::Create(mask));

        egraph.add_merge(eclass_id, value);
      }
    };

    builder.add_matcher(shl, std::move(matcher));
  }
} // namespace

void shift_elimination(EMatcherBuilder& builder) {
  lshr_elim(builder);
}

} // namespace caffeine::ematching::reductions
