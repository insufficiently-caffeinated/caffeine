#include "caffeine/IR/OperationSimplifier.h"
#include "caffeine/Config.h"
#include "caffeine/IR/Matching.h"
#include "caffeine/IR/OperationCache.h"
#include "caffeine/IR/Value.h"

namespace caffeine {
namespace {
  bool is_constant_int(const Operation& op, uint64_t value) {
    if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op))
      return constant->value() == value;
    return false;
  }
  bool is_constant_int(const OpRef& op, uint64_t value) {
    return is_constant_int(*op, value);
  }

  bool is_constant_ones(const Operation& op) {
    if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op))
      return constant->value().isAllOnesValue();
    return false;
  }
  bool is_constant_ones(const OpRef& op) {
    return is_constant_ones(*op);
  }

  bool constant_int_compare(ICmpOpcode cmp, const llvm::APInt& lhs,
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

  bool constant_float_compare(FCmpOpcode cmp, const llvm::APFloat& lhs,
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
      return res == llvm::APFloat::cmpLessThan ||
             res == llvm::APFloat::cmpEqual;
    case FCmpOpcode::LT:
      return lhs.compare(rhs) == llvm::APFloat::cmpLessThan;
    }
    CAFFEINE_UNREACHABLE("unknown ICmpOpcode");
  }
} // namespace

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

OpRef OperationSimplifier::visit(Operation& op) {
  CAFFEINE_ASSERT(op.valid());
#ifdef CAFFEINE_ENABLE_IMPLICIT_CONSTANT_FOLDING
  return BaseType::visit(op);
#else
  return visitOperation(op);
#endif
}

OpRef OperationSimplifier::visitOperation(Operation& op) {
  return OperationCache::default_cache()->cache(
      std::move(const_cast<Operation&>(op)));
}

OpRef OperationSimplifier::visitAdd(BinaryOp& op) {
  if (op.lhs()->is<Undef>() || op.rhs()->is<Undef>())
    return Undef::Create(op.type());

  if (is_constant_int(op.lhs(), 0))
    return op.rhs();
  if (is_constant_int(op.rhs(), 0))
    return op.lhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value() + rhs.value()));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitSub(BinaryOp& op) {
  if (op.lhs()->is<Undef>() || op.rhs()->is<Undef>())
    return Undef::Create(op.type());

  if (is_constant_int(op.rhs(), 0))
    return op.lhs();

  if (op.rhs().get() == op.lhs().get())
    return ConstantInt::Create(llvm::APInt(op.type().bitwidth(), 0));

  TRY_CONST_INT(ConstantInt::Create(lhs.value() - rhs.value()));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitMul(BinaryOp& op) {
  if (is_constant_int(op.lhs(), 0))
    return op.lhs();
  if (is_constant_int(op.rhs(), 0))
    return op.rhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value() * rhs.value()));

  return this->visitBinaryOp(op);
}

OpRef OperationSimplifier::visitUDiv(BinaryOp& op) {
  if (is_constant_int(op.lhs(), 0) || is_constant_int(*op.rhs(), 1))
    return op.lhs();

  if (auto args = as_const_int(op.lhs(), op.rhs())) {
    auto [lhs, rhs] = args.value();
    return ConstantInt::Create(Value::bvudiv(lhs->as_value(), rhs->as_value()));
  }

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitSDiv(BinaryOp& op) {
  if (is_constant_int(op.lhs(), 0))
    return op.lhs();
  if (is_constant_int(op.rhs(), 1) && op.type().bitwidth() > 1)
    return op.lhs();

  if (auto args = as_const_int(op.lhs(), op.rhs())) {
    auto [lhs, rhs] = args.value();
    return ConstantInt::Create(Value::bvsdiv(lhs->as_value(), rhs->as_value()));
  }

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitURem(BinaryOp& op) {
  if (is_constant_int(op.lhs(), 0))
    return op.lhs();
  if (is_constant_int(op.rhs(), 1))
    return ConstantInt::Create(llvm::APInt(op.type().bitwidth(), 0));

  if (auto args = as_const_int(op.lhs(), op.rhs())) {
    auto [lhs, rhs] = args.value();
    return ConstantInt::Create(Value::bvurem(lhs->as_value(), rhs->as_value()));
  }

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitSRem(BinaryOp& op) {
  if (is_constant_int(op.lhs(), 0))
    return op.lhs();
  if (is_constant_int(op.rhs(), 1) && op.type().bitwidth() > 1)
    return ConstantInt::Create(llvm::APInt(op.type().bitwidth(), 0));

  if (auto args = as_const_int(op.lhs(), op.rhs())) {
    auto [lhs, rhs] = args.value();
    return ConstantInt::Create(Value::bvsrem(lhs->as_value(), rhs->as_value()));
  }

  return this->visitBinaryOp(op);
}

OpRef OperationSimplifier::visitAnd(BinaryOp& op) {
  namespace m = matching;

  if (is_constant_int(op.lhs(), 0))
    return op.lhs();
  if (is_constant_int(op.rhs(), 0))
    return op.rhs();

  if (is_constant_ones(op.lhs()))
    return op.rhs();
  if (is_constant_ones(op.rhs()))
    return op.lhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value() & rhs.value()));

  {
    OpRef mask, value, shift;
    // (and (lshr x s) m) -> (lshr (and x (shl m s)) s)
    // ... but only if m and s are constants
    if ((matches(op.lhs(), m::ConstantInt(mask)) &&
         matches(op.rhs(), m::LShr(value, m::ConstantInt(shift)))) ||
        (matches(op.rhs(), m::ConstantInt(mask)) &&
         matches(op.lhs(), m::LShr(value, m::ConstantInt(shift))))) {
      return BinaryOp::CreateLShr(
          BinaryOp::CreateAnd(value, BinaryOp::CreateShl(mask, shift)), shift);
    }
  }

  {
    OpRef mask1, mask2, value;
    // (and (and x m1) m2) -> (and x (and m1 m2))
    // .. where m1 and m2 are constants
    if (matches(op.lhs(), m::ConstantInt(mask1))) {
      if (matches(op.rhs(), m::And(m::ConstantInt(mask2), value)) ||
          matches(op.rhs(), m::And(value, m::ConstantInt(mask2)))) {
        return BinaryOp::CreateAnd(value, BinaryOp::CreateAnd(mask1, mask2));
      }
    } else if (matches(op.rhs(), m::ConstantInt(mask1))) {
      if (matches(op.lhs(), m::And(m::ConstantInt(mask2), value)) ||
          matches(op.lhs(), m::And(value, m::ConstantInt(mask2)))) {
        return BinaryOp::CreateAnd(value, BinaryOp::CreateAnd(mask1, mask2));
      }
    }
  }

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitOr(BinaryOp& op) {
  namespace m = matching;

  if (is_constant_int(op.lhs(), 0))
    return op.rhs();
  if (is_constant_int(op.rhs(), 0))
    return op.lhs();

  if (is_constant_ones(op.lhs()))
    return op.lhs();
  if (is_constant_ones(op.rhs()))
    return op.rhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value() | rhs.value()));

  {
    OpRef value1, value2, mask1, mask2;
    if (matches(op.lhs(), m::And(value1, m::ConstantInt(mask1))) &&
        matches(op.rhs(), m::And(value2, m::ConstantInt(mask2))) &&
        value1 == value2) {
      return BinaryOp::CreateAnd(value1, BinaryOp::CreateOr(mask1, mask2));
    }
  }

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitXor(BinaryOp& op) {
  if (op.lhs()->is<Undef>() || op.rhs()->is<Undef>())
    return Undef::Create(op.type());

  if (is_constant_int(op.lhs(), 0))
    return op.rhs();
  if (is_constant_int(op.rhs(), 0))
    return op.lhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value() ^ rhs.value()));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitShl(BinaryOp& op) {
  namespace m = matching;

  if (is_constant_int(op.lhs(), 0) || is_constant_int(op.rhs(), 0))
    return op.lhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value() << rhs.value()));

  OpRef lshift, rshift, value;
  if (matches(op.lhs(), m::LShr(value, m::ConstantInt(rshift))) &&
      matches(op.rhs(), m::ConstantInt(lshift))) {
    auto lv = llvm::cast<ConstantInt>(*lshift).value();
    auto rv = llvm::cast<ConstantInt>(*rshift).value();
    uint64_t shift = llvm::cast<ConstantInt>(*lshift).value().getLimitedValue(
        op.type().bitwidth());

    if (lv == rv && shift != op.type().bitwidth()) {
      auto mask = ConstantInt::Create(
          llvm::APInt::getBitsSetFrom(op.type().bitwidth(), shift));

      return BinaryOp::CreateAnd(value, mask);
    }
  }

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitLShr(BinaryOp& op) {
  if (is_constant_int(op.lhs(), 0) || is_constant_int(op.rhs(), 0))
    return op.lhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value().lshr(rhs.value())));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitAShr(BinaryOp& op) {
  if (is_constant_int(op.lhs(), 0) || is_constant_int(op.rhs(), 0))
    return op.lhs();

  TRY_CONST_INT(ConstantInt::Create(lhs.value().ashr(rhs.value())));

  return this->visitBinaryOp(op);
}

OpRef OperationSimplifier::visitFAdd(BinaryOp& op) {
  TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() + rhs.value()));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitFSub(BinaryOp& op) {
  TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() - rhs.value()));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitFMul(BinaryOp& op) {
  TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() * rhs.value()));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitFDiv(BinaryOp& op) {
  TRY_CONST_FLOAT(ConstantFloat::Create(lhs.value() / rhs.value()));

  return this->visitBinaryOp(op);
}
OpRef OperationSimplifier::visitFRem(BinaryOp& op) {
  TRY_CONST_FLOAT(
      ConstantFloat::Create(llvm::APFloat(lhs.value()).remainder(rhs.value())));

  return this->visitBinaryOp(op);
}

OpRef OperationSimplifier::visitFIsNaN(UnaryOp& op) {
  if (const auto* val = llvm::dyn_cast<ConstantFloat>(op.operand().get())) {
    const llvm::APFloat& apf = val->value();
    return ConstantInt::Create(apf.isNaN());
  }

  return this->visitUnaryOp(op);
}
OpRef OperationSimplifier::visitNot(UnaryOp& op) {
  if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
    return ConstantInt::Create(~val->value());

  OpRef value;
  if (matches(op.operand(), matching::Not(value)))
    return value;

  return this->visitUnaryOp(op);
}
OpRef OperationSimplifier::visitTrunc(UnaryOp& op) {
  if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
    return ConstantInt::Create(val->value().trunc(op.type().bitwidth()));

  if (op.type() == op.operand()->type())
    return op.operand();

  return this->visitUnaryOp(op);
}
OpRef OperationSimplifier::visitZExt(UnaryOp& op) {
  namespace m = matching;

  if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
    return ConstantInt::Create(val->value().zext(op.type().bitwidth()));

  if (op.type() == op.operand()->type())
    return op.operand();

  OpRef inner;
  // (zext.ixx (trunc.iyy v)) -> (and v (ixx (2^yy - 1)))
  if (matches(op.operand(), m::Trunc(inner))) {
    auto bw1 = op.type().bitwidth();
    auto bw2 = inner->type().bitwidth();

    auto tbw = op.operand()->type().bitwidth();

    if (bw1 == bw2) {
      auto mask = ConstantInt::Create(llvm::APInt::getLowBitsSet(bw1, tbw));
      return BinaryOp::CreateAnd(inner, mask);
    }
  }

  return this->visitUnaryOp(op);
}
OpRef OperationSimplifier::visitSExt(UnaryOp& op) {
  if (const auto* val = llvm::dyn_cast<ConstantInt>(op.operand().get()))
    return ConstantInt::Create(val->value().sext(op.type().bitwidth()));

  if (op.type() == op.operand()->type())
    return op.operand();

  return this->visitUnaryOp(op);
}
OpRef OperationSimplifier::visitBitcast(UnaryOp& op) {
  {
    OpRef value;
    if (matches(op.operand(), matching::Bitcast(value)) &&
        value->type() == op.type()) {
      return value;
    }
  }

  return BaseType::visitBitcast(op);
}

OpRef OperationSimplifier::visitSelectOp(SelectOp& op) {
  if (const auto* vcond = llvm::dyn_cast<ConstantInt>(op.condition().get()))
    return vcond->value() == 1 ? op.true_value() : op.false_value();
  if (op.true_value() == op.false_value())
    return op.true_value();

  return this->visitOperation(op);
}

OpRef OperationSimplifier::visitICmp(ICmpOp& op) {
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
OpRef OperationSimplifier::visitFCmp(FCmpOp& op) {
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

OpRef OperationSimplifier::visitAllocOp(AllocOp& op) {
  if (const auto* cnst = llvm::dyn_cast<ConstantInt>(op.size().get())) {
    if (cnst->value().getLimitedValue(SIZE_MAX) < SIZE_MAX) {
      return FixedArray::Create(cnst->type(), op.default_value(),
                                cnst->value().getLimitedValue());
    }
  }

  return this->visitArrayBase(op);
}
OpRef OperationSimplifier::visitLoadOp(LoadOp& op) {
  const auto* fixedarray = llvm::dyn_cast<FixedArray>(op.data().get());
  const auto* offset_int = llvm::dyn_cast<ConstantInt>(op.offset().get());

  if (fixedarray) {
    if (offset_int) {
      return fixedarray->data()[offset_int->value().getLimitedValue()];
    }

    if (fixedarray->data().size() < 1024) {
      OpRef output = Undef::Create(Type::int_ty(8));
      size_t i = 0;
      for (const OpRef& value : fixedarray->data()) {
        output = SelectOp::Create(
            ICmpOp::CreateICmp(ICmpOpcode::EQ, op.offset(), i), value, output);
        i += 1;
      }
      return output;
    }

    auto cached = OperationCache::default_cache()->intern(op.data());
    if (cached != op.data())
      return LoadOp::Create(cached, op.offset());
  }

  return this->visitOperation(op);
}
OpRef OperationSimplifier::visitStoreOp(StoreOp& op) {
  const auto* offset_cnst = llvm::dyn_cast<ConstantInt>(op.offset().get());
  const auto* fixedarray = llvm::dyn_cast<FixedArray>(op.data().get());

  if (offset_cnst && fixedarray) {
    auto data = fixedarray->data().vec();
    data[offset_cnst->value().getLimitedValue()] = op.value();
    return FixedArray::Create(op.offset()->type(), data);
  } else if (fixedarray) {
    auto cached = OperationCache::default_cache()->intern(op.data());
    if (cached != op.data())
      return StoreOp::Create(cached, op.offset(), op.value());
  }

  return this->visitArrayBase(op);
}

OpRef OperationSimplifier::visitFixedArray(FixedArray& op) {
  // Note: We don't cache FixedArray instances since the cost of hashing the
  //       whole array after every change causes quadratic blowups on just about
  //       every program that interacts with memory.
  return std::make_shared<FixedArray>(std::move(op));
}

} // namespace caffeine
