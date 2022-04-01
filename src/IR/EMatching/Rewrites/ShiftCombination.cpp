#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine::ematching::reductions {

namespace {
  void shift_combo(EMatcherBuilder& builder, Operation::Opcode opcode) {
    size_t any = builder.add_any();
    size_t iconst = builder.add_capture(Operation::ConstantInt);
    size_t sh1 = builder.add_capture(opcode, {any, iconst});
    size_t sh2 = builder.add_clause(opcode, {sh1, iconst});

    auto matcher = [=](GraphAccessor& egraph, size_t eclass_id, size_t) {
      auto consts = egraph.captures(iconst);

      const llvm::APInt& shift1 =
          llvm::cast<ConstantIntData>(consts[0]->data.get())->value();
      const llvm::APInt& shift2 =
          llvm::cast<ConstantIntData>(consts[1]->data.get())->value();

      const ENode* shiftop = egraph.capture(sh1);

      OpRef op;
      bool ovflw;
      auto total = shift1.uadd_ov(shift2, ovflw);

      if (ovflw) {
        if (opcode == Operation::AShr) {
          op = ConstantInt::Create(
              llvm::APInt::getAllOnesValue(shiftop->type().bitwidth()));
        } else {
          op = ConstantInt::CreateZero(shiftop->type().bitwidth());
        }
      } else {
        op = BinaryOp::CreateLShr(egraph.get_op(shiftop->operands[0]),
                                  ConstantInt::Create(total));
      }
      egraph.add_merge(eclass_id, op);
    };

    builder.add_matcher(sh2, std::move(matcher));
  }
} // namespace

void shift_combination(EMatcherBuilder& builder) {
  shift_combo(builder, Operation::LShr);
  shift_combo(builder, Operation::AShr);
  shift_combo(builder, Operation::Shl);
}

} // namespace caffeine::ematching::reductions
