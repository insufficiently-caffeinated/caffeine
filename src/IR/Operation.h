#pragma once

#include "caffeine/IR/Matching.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Value.h"
#include "caffeine/IR/Visitor.h"
#include <llvm/Support/MathExtras.h>
#include <memory>
#include <mutex>
#include <unordered_map>

/**
 * This header has a bunch of utility methods for constant folding.
 */

// TODO: We should put this in a config file
#define CAFFEINE_IMPLICIT_CONSTANT_FOLDING 1

namespace caffeine {

inline bool is_constant_int(const Operation& op, uint64_t value) {
  if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op))
    return constant->value() == value;
  return false;
}
inline bool is_constant_int(const OpRef& op, uint64_t value) {
  return is_constant_int(*op, value);
}

inline bool is_constant_ones(const Operation& op) {
  if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op))
    return constant->value().isAllOnesValue();
  return false;
}
inline bool is_constant_ones(const OpRef& op) {
  return is_constant_ones(*op);
}

inline bool constant_int_compare(ICmpOpcode cmp, const llvm::APInt& lhs,
                                 const llvm::APInt& rhs) {
  switch (cmp) {
  case ICmpOpcode::EQ:
    return lhs == rhs;
  case ICmpOpcode::NE:
    return lhs != rhs;
  case ICmpOpcode::SGE:
    return lhs.sge(rhs);
  case ICmpOpcode::SGT:
    return lhs.sgt(rhs);
  case ICmpOpcode::SLE:
    return lhs.sle(rhs);
  case ICmpOpcode::SLT:
    return lhs.slt(rhs);
  case ICmpOpcode::UGE:
    return lhs.uge(rhs);
  case ICmpOpcode::UGT:
    return lhs.ugt(rhs);
  case ICmpOpcode::ULE:
    return lhs.ule(rhs);
  case ICmpOpcode::ULT:
    return lhs.ult(rhs);
  }
  CAFFEINE_UNREACHABLE("unknown ICmpOpcode");
}

inline bool constant_float_compare(FCmpOpcode cmp, const llvm::APFloat& lhs,
                                   const llvm::APFloat& rhs) {

  llvm::APFloat::cmpResult res;

  switch (cmp) {
  case FCmpOpcode::EQ:
    return lhs.compare(rhs) == llvm::APFloat::cmpEqual;
  case FCmpOpcode::NE:
    return lhs.compare(rhs) != llvm::APFloat::cmpEqual;
  case FCmpOpcode::GE:
    res = lhs.compare(rhs);
    return res == llvm::APFloat::cmpGreaterThan ||
           res == llvm::APFloat::cmpEqual;
  case FCmpOpcode::GT:
    return lhs.compare(rhs) == llvm::APFloat::cmpGreaterThan;
  case FCmpOpcode::LE:
    res = lhs.compare(rhs);
    return res == llvm::APFloat::cmpLessThan || res == llvm::APFloat::cmpEqual;
  case FCmpOpcode::LT:
    return lhs.compare(rhs) == llvm::APFloat::cmpLessThan;
  }
  CAFFEINE_UNREACHABLE("unknown ICmpOpcode");
}

inline uint64_t ilog2(uint64_t x) {
  bool ispow2 = (x & (x - 1)) == 0;
  return sizeof(x) * CHAR_BIT - llvm::countLeadingZeros(x) - (ispow2 ? 1 : 0);
}

class OperationCache {
private:
  std::mutex mutex;
  std::unordered_multimap<size_t, std::weak_ptr<const Operation>> map;

  OpRef find(size_t key, const Operation& op);

public:
  OperationCache() = default;

  OpRef intern(Operation&& op);
  OpRef intern(const Operation& op);

  void erase(const Operation& op);

  static OperationCache cache;
};

template <bool move_out = false>
class ConstantFolder : public ConstOpVisitor<ConstantFolder<move_out>, OpRef> {
public:
#define TRY_CONST_INT(expr)                                                    \
  do {                                                                         \
    auto func = [&](const auto& lhs, const auto& rhs) { return (expr); };      \
    if (auto constval = this->try_const_int(op.lhs(), op.rhs(), func))         \
      return constval;                                                         \
  } while (false)
#define TRY_CONST_FLOAT(expr)                                                  \
  do {                                                                         \
    auto func = [&](const auto& lhs, const auto& rhs) { return (expr); };      \
    if (auto constval = this->try_const_float(op.lhs(), op.rhs(), func))       \
      return constval;                                                         \
  } while (false)

  OpRef visit(const Operation& op) {
#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
    return ConstOpVisitor<ConstantFolder<move_out>, OpRef>::visit(op);
#else
    return visitOperation(op);
#endif
  }

  OpRef visitOperation(const Operation& op) {
    if constexpr (move_out) {
      return OperationCache::cache.intern(
          std::move(const_cast<Operation&>(op)));
    } else {
      return OperationCache::cache.intern(op);
    }
  }

  OpRef visitAdd(const BinaryOp& op) {
    if (op.lhs()->is<Undef>() || op.rhs()->is<Undef>())
      return Undef::Create(op.type());

    if (is_constant_int(op.lhs(), 0))
      return op.rhs();
    if (is_constant_int(op.rhs(), 0))
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value() + rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitSub(const BinaryOp& op) {
    if (op.lhs()->is<Undef>() || op.rhs()->is<Undef>())
      return Undef::Create(op.type());

    if (is_constant_int(op.rhs(), 0))
      return op.lhs();

    if (op.rhs().get() == op.lhs().get())
      return ConstantInt::Create(llvm::APInt(op.type().bitwidth(), 0));

    TRY_CONST_INT(ConstantInt::Create(lhs.value() - rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitMul(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0))
      return op.lhs();
    if (is_constant_int(op.rhs(), 0))
      return op.rhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value() * rhs.value()));

    return this->visitBinaryOp(op);
  }

  OpRef visitUDiv(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0) || is_constant_int(*op.rhs(), 1))
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value().udiv(rhs.value())));

    return this->visitBinaryOp(op);
  }
  OpRef visitSDiv(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0))
      return op.lhs();
    if (is_constant_int(op.rhs(), 1) && op.type().bitwidth() > 1)
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value().sdiv(rhs.value())));

    return this->visitBinaryOp(op);
  }
  OpRef visitURem(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0))
      return op.lhs();
    if (is_constant_int(op.rhs(), 1))
      return ConstantInt::Create(llvm::APInt(op.type().bitwidth(), 0));

    TRY_CONST_INT(ConstantInt::Create(lhs.value().urem(rhs.value())));

    return this->visitBinaryOp(op);
  }
  OpRef visitSRem(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0))
      return op.lhs();
    if (is_constant_int(op.rhs(), 1) && op.type().bitwidth() > 1)
      return ConstantInt::Create(llvm::APInt(op.type().bitwidth(), 0));

    TRY_CONST_INT(ConstantInt::Create(lhs.value().srem(rhs.value())));

    return this->visitBinaryOp(op);
  }

  OpRef visitAnd(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0))
      return op.lhs();
    if (is_constant_int(op.rhs(), 0))
      return op.rhs();

    if (is_constant_ones(op.lhs()))
      return op.rhs();
    if (is_constant_ones(op.rhs()))
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value() & rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitOr(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0))
      return op.rhs();
    if (is_constant_int(op.rhs(), 0))
      return op.lhs();

    if (is_constant_ones(op.lhs()))
      return op.lhs();
    if (is_constant_ones(op.rhs()))
      return op.rhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value() | rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitXor(const BinaryOp& op) {
    if (op.lhs()->is<Undef>() || op.rhs()->is<Undef>())
      return Undef::Create(op.type());

    if (is_constant_int(op.lhs(), 0))
      return op.rhs();
    if (is_constant_int(op.rhs(), 0))
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value() ^ rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitShl(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0) || is_constant_int(op.rhs(), 0))
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value() << rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitLShr(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0) || is_constant_int(op.rhs(), 0))
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value().lshr(rhs.value())));

    return this->visitBinaryOp(op);
  }
  OpRef visitAShr(const BinaryOp& op) {
    if (is_constant_int(op.lhs(), 0) || is_constant_int(op.rhs(), 0))
      return op.lhs();

    TRY_CONST_INT(ConstantInt::Create(lhs.value().ashr(rhs.value())));

    return this->visitBinaryOp(op);
  }

  OpRef visitFAdd(const BinaryOp& op) {
    TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() + rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitFSub(const BinaryOp& op) {
    TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() - rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitFMul(const BinaryOp& op) {
    TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() * rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitFDiv(const BinaryOp& op) {
    TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() / rhs.value()));

    return this->visitBinaryOp(op);
  }
  OpRef visitFRem(const BinaryOp& op) {
    TRY_CONST_FLOAT(ConstantFloat::Create(
        llvm::APFloat(lhs.value()).remainder(rhs.value())));

    return this->visitBinaryOp(op);
  }
  OpRef visitFIsNaN(const UnaryOp& op) {
    if (const auto* val = llvm::dyn_cast<ConstantFloat>(op.operand().get())) {
      const llvm::APFloat& apf = val->value();
      return ConstantInt::Create(apf.isNaN());
    }

    return this->visitUnaryOp(op);
  }

  OpRef visitNot(const UnaryOp& op) {
    if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
      return ConstantInt::Create(~val->value());

    OpRef value;
    if (matches(op.operand(), matching::Not(value)))
      return value;

    return this->visitUnaryOp(op);
  }
  OpRef visitTrunc(const UnaryOp& op) {
    if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
      return ConstantInt::Create(val->value().trunc(op.type().bitwidth()));

    return this->visitUnaryOp(op);
  }
  OpRef visitZExt(const UnaryOp& op) {
    if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
      return ConstantInt::Create(val->value().zext(op.type().bitwidth()));

    return this->visitUnaryOp(op);
  }
  OpRef visitSExt(const UnaryOp& op) {
    if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
      return ConstantInt::Create(val->value().sext(op.type().bitwidth()));

    return this->visitUnaryOp(op);
  }

  OpRef visitSelectOp(const SelectOp& op) {
    if (const auto* vcond = llvm::dyn_cast<ConstantInt>(op.condition().get()))
      return vcond->value() == 1 ? op.true_value() : op.false_value();

    return this->visitOperation(op);
  }

  OpRef visitICmp(const ICmpOp& op) {
    TRY_CONST_INT(ConstantInt::Create(
        constant_int_compare(op.comparison(), lhs.value(), rhs.value())));

    if (op.lhs() == op.rhs()) {
      if (op.lhs()->is<Undef>())
        return Undef::Create(Type::int_ty(1));

      switch (op.comparison()) {
      case ICmpOpcode::EQ:
      case ICmpOpcode::ULE:
      case ICmpOpcode::SLE:
      case ICmpOpcode::UGE:
      case ICmpOpcode::SGE:
        return ConstantInt::Create(true);
      case ICmpOpcode::NE:
      case ICmpOpcode::ULT:
      case ICmpOpcode::SLT:
      case ICmpOpcode::UGT:
      case ICmpOpcode::SGT:
        return ConstantInt::Create(false);
      }
    }

    return this->visitBinaryOp(op);
  }
  OpRef visitFCmp(const FCmpOp& op) {
    TRY_CONST_FLOAT(ConstantInt::Create(
        constant_float_compare(op.comparison(), lhs.value(), rhs.value())));

    if (op.lhs() == op.rhs()) {
      switch (op.comparison()) {
      case FCmpOpcode::EQ:
      case FCmpOpcode::LE:
      case FCmpOpcode::GE:
        return ConstantInt::Create(true);
      case FCmpOpcode::NE:
      case FCmpOpcode::LT:
      case FCmpOpcode::GT:
        return ConstantInt::Create(false);
      }
    }

    return this->visitBinaryOp(op);
  }

  OpRef visitAllocOp(const AllocOp& op) {
    if (const auto* cnst = llvm::dyn_cast<ConstantInt>(op.size().get())) {
      if (cnst->value().getLimitedValue(SIZE_MAX) < SIZE_MAX) {
        return FixedArray::Create(cnst->type(), op.default_value(),
                                  cnst->value().getLimitedValue());
      }
    }

    return this->visitArrayBase(op);
  }
  OpRef visitLoadOp(const LoadOp& op) {
    const auto* fixedarray = llvm::dyn_cast<FixedArray>(op.data().get());
    const auto* offset_int = llvm::dyn_cast<ConstantInt>(op.offset().get());

    if (fixedarray && offset_int) {
      return fixedarray->data()[offset_int->value().getLimitedValue()];
    }

    return this->visitOperation(op);
  }
  OpRef visitStoreOp(const StoreOp& op) {
    const auto* offset_cnst = llvm::dyn_cast<ConstantInt>(op.offset().get());
    const auto* fixedarray = llvm::dyn_cast<FixedArray>(op.data().get());

    if (offset_cnst && fixedarray) {
      auto data = fixedarray->data();
      data.set(offset_cnst->value().getLimitedValue(), op.value());
      return FixedArray::Create(op.offset()->type(), data);
    }

    return this->visitArrayBase(op);
  }

  OpRef visitFixedArray(const FixedArray& op) {
    return make_ref<Operation>(op);
  }

private:
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

template <typename T>
OpRef constant_fold(T& value) {
  ConstantFolder<false> fold;
  return fold(value);
}
template <typename T>
OpRef constant_fold(const T& value) {
  ConstantFolder<false> fold;
  return fold(value);
}
template <typename T>
OpRef constant_fold(T&& value) {
  ConstantFolder<true> fold;
  return fold(value);
}

} // namespace caffeine
