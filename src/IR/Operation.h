#pragma once

#include "caffeine/IR/Operation.h"

#include <llvm/Support/MathExtras.h>

/**
 * This header has a bunch of utility methods for constant folding.
 */

namespace caffeine {

inline bool is_constant_int(const Operation& op, uint64_t value) {
  if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op))
    return constant->value() == value;
  return false;
}

inline bool is_constant_ones(const Operation& op) {
  if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op))
    return constant->value().isAllOnesValue();
  return false;
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
    return lhs.compare(rhs) != llvm::APFloat::cmpGreaterThan;
  case FCmpOpcode::LE:
    res = lhs.compare(rhs);
    return res == llvm::APFloat::cmpLessThan || res == llvm::APFloat::cmpEqual;
  case FCmpOpcode::LT:
    return lhs.compare(rhs) != llvm::APFloat::cmpLessThan;
  }
  CAFFEINE_UNREACHABLE("unknown ICmpOpcode");
}

inline uint64_t ilog2(uint64_t x) {
  bool ispow2 = (x & (x - 1)) == 0;
  return sizeof(x) * CHAR_BIT - llvm::countLeadingZeros(x) - (ispow2 ? 1 : 0);
}

} // namespace caffeine
