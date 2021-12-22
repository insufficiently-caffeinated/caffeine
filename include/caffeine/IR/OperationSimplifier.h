#pragma once

#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Visitor.h"

namespace caffeine {

/**
 * Visitor to simplify operation expressions.
 *
 * This is called internally by the various derived construction functions so
 * you should never have to use it directly.
 */
template <bool MoveOut = false>
class OperationSimplifier
    : public OpVisitor<OperationSimplifier<MoveOut>, OpRef> {
private:
  using BaseType = OpVisitor<OperationSimplifier<MoveOut>, OpRef>;

  static constexpr bool move_input = MoveOut;

public:
  OpRef visit(Operation& op);

  OpRef visitOperation(Operation& op);

  OpRef visitAdd(BinaryOp& op);
  OpRef visitSub(BinaryOp& op);
  OpRef visitMul(BinaryOp& op);

  OpRef visitUDiv(BinaryOp& op);
  OpRef visitSDiv(BinaryOp& op);
  OpRef visitURem(BinaryOp& op);
  OpRef visitSRem(BinaryOp& op);

  OpRef visitAnd(BinaryOp& op);
  OpRef visitOr(BinaryOp& op);
  OpRef visitXor(BinaryOp& op);
  OpRef visitShl(BinaryOp& op);
  OpRef visitLShr(BinaryOp& op);
  OpRef visitAShr(BinaryOp& op);

  OpRef visitFAdd(BinaryOp& op);
  OpRef visitFSub(BinaryOp& op);
  OpRef visitFMul(BinaryOp& op);
  OpRef visitFDiv(BinaryOp& op);
  OpRef visitFRem(BinaryOp& op);

  OpRef visitFIsNaN(UnaryOp& op);
  OpRef visitNot(UnaryOp& op);
  OpRef visitTrunc(UnaryOp& op);
  OpRef visitZExt(UnaryOp& op);
  OpRef visitSExt(UnaryOp& op);
  OpRef visitBitcast(UnaryOp& op);

  OpRef visitSelectOp(SelectOp& op);

  OpRef visitICmp(ICmpOp& op);
  OpRef visitFCmp(FCmpOp& op);

  OpRef visitAllocOp(AllocOp& op);
  OpRef visitLoadOp(LoadOp& op);
  OpRef visitStoreOp(StoreOp& op);

  OpRef visitFixedArray(FixedArray& op);

private:
  template <typename... Ts>
  std::optional<std::array<const ConstantInt*, sizeof...(Ts)>>
  as_const_int(const Ts&... args) {
    static_assert((... && std::is_same_v<Ts, OpRef>));

    std::array<const ConstantInt*, sizeof...(Ts)> result = {
        llvm::dyn_cast<ConstantInt>(args.get())...};

    for (const ConstantInt* arg : result) {
      if (!arg)
        return std::nullopt;
    }

    return result;
  }

  template <typename F>
  OpRef try_const_int(const OpRef& lhs, const OpRef& rhs, F&& func) {
    const auto* lhs_int = llvm::dyn_cast<ConstantInt>(lhs.get());
    const auto* rhs_int = llvm::dyn_cast<ConstantInt>(rhs.get());

    if (lhs_int && rhs_int) {
      return func(*lhs_int, *rhs_int);
    }

    return nullptr;
  }

  template <typename F>
  OpRef try_const_float(const OpRef& lhs, const OpRef& rhs, F&& func) {
    const auto* lhs_flt = llvm::dyn_cast<ConstantFloat>(lhs.get());
    const auto* rhs_flt = llvm::dyn_cast<ConstantFloat>(rhs.get());

    if (lhs_flt && rhs_flt) {
      return func(*lhs_flt, *rhs_flt);
    }

    return nullptr;
  }
};

extern template class OperationSimplifier<true>;
extern template class OperationSimplifier<false>;

} // namespace caffeine
