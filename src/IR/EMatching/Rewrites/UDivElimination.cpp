#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationData.h"
#include "caffeine/Support/LLVMFmt.h"

namespace caffeine::ematching::reductions {

void udiv_elimination(EMatcherBuilder& builder) {
  size_t any = builder.add_any();
  size_t iconst = builder.add_capture(Operation::ConstantInt);
  size_t udiv1 = builder.add_capture(Operation::UDiv, {any, iconst});
  size_t udiv2 = builder.add_clause(Operation::UDiv, {udiv1, iconst});

  auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t) {
    auto consts = egraph.captures(iconst);
    const llvm::APInt& div1 =
        llvm::cast<ConstantIntData>(consts[0]->data.get())->value();
    const llvm::APInt& div2 =
        llvm::cast<ConstantIntData>(consts[1]->data.get())->value();

    const ENode* udiv = egraph.capture(udiv1);

    bool ovfl;
    auto mult = div1.umul_ov(div2, ovfl);

    if (ovfl) {
      // fmt::print("{} * {} overflows\n", div1, div2);
      egraph.add_merge(eclass_id, ConstantInt::CreateZero(div1.getBitWidth()));
    } else {
      auto newdiv = BinaryOp::CreateUDiv(egraph.get_op(udiv->operands[0]),
                                         ConstantInt::Create(mult));
      egraph.add_merge(eclass_id, newdiv);
    }
  };

  builder.add_matcher(udiv2, std::move(matcher));
}

} // namespace caffeine::ematching::reductions
