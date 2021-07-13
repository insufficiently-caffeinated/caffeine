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
    : public ConstOpVisitor<OperationSimplifier<MoveOut>, OpRef> {
private:
  using BaseType = ConstOpVisitor<OperationSimplifier<MoveOut>, OpRef>;

  static constexpr bool move_input = MoveOut;

public:
  OpRef visit(const Operation& op);

  OpRef visitOperation(const Operation& op);

  OpRef visitAdd(const BinaryOp& op);
  OpRef visitSub(const BinaryOp& op);
  OpRef visitMul(const BinaryOp& op);

  OpRef visitUDiv(const BinaryOp& op);
  OpRef visitSDiv(const BinaryOp& op);
  OpRef visitURem(const BinaryOp& op);
  OpRef visitSRem(const BinaryOp& op);

  OpRef visitAnd(const BinaryOp& op);
  OpRef visitOr(const BinaryOp& op);
  OpRef visitXor(const BinaryOp& op);
  OpRef visitShl(const BinaryOp& op);
  OpRef visitLShr(const BinaryOp& op);
  OpRef visitAShr(const BinaryOp& op);

  OpRef visitFAdd(const BinaryOp& op);
  OpRef visitFSub(const BinaryOp& op);
  OpRef visitFMul(const BinaryOp& op);
  OpRef visitFDiv(const BinaryOp& op);
  OpRef visitFRem(const BinaryOp& op);

  OpRef visitFIsNaN(const UnaryOp& op);
  OpRef visitNot(const UnaryOp& op);
  OpRef visitTrunc(const UnaryOp& op);
  OpRef visitZExt(const UnaryOp& op);
  OpRef visitSExt(const UnaryOp& op);
  OpRef visitBitcast(const UnaryOp& op);

  OpRef visitSelectOp(const SelectOp& op);

  OpRef visitICmp(const ICmpOp& op);
  OpRef visitFCmp(const FCmpOp& op);

  OpRef visitAllocOp(const AllocOp& op);
  OpRef visitLoadOp(const LoadOp& op);
  OpRef visitStoreOp(const StoreOp& op);

  OpRef visitFixedArray(const FixedArray& op);

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
