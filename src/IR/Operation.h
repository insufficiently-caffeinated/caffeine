#pragma once

#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationSimplifier.h"
#include <llvm/Support/MathExtras.h>

namespace caffeine {

inline uint64_t ilog2(uint64_t x) {
  bool ispow2 = (x & (x - 1)) == 0;
  return sizeof(x) * CHAR_BIT - llvm::countLeadingZeros(x) - (ispow2 ? 1 : 0);
}

template <typename T>
OpRef constant_fold(T&& value) {
  return OperationSimplifier()(value);
}

OpRef extract_bit(const OpRef& op, uint32_t bit) {
  CAFFEINE_ASSERT(op->type().is_int());
  CAFFEINE_ASSERT(bit < op->type().bitwidth());

  return UnaryOp::CreateTrunc(Type::int_ty(1), BinaryOp::CreateLShr(op, bit));
}

} // namespace caffeine
