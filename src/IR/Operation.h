#pragma once

#include "caffeine/IR/Matching.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationCache.h"
#include "caffeine/IR/OperationSimplifier.h"
#include "caffeine/IR/Value.h"
#include "caffeine/IR/Visitor.h"
#include <llvm/Support/MathExtras.h>
#include <memory>
#include <mutex>
#include <unordered_map>

/**
 * This header has a bunch of utility methods for constant folding.
 */

namespace caffeine {

template <typename T>
OpRef constant_fold(T& value) {
  OperationSimplifier<false> fold;
  return fold(value);
}
template <typename T>
OpRef constant_fold(const T& value) {
  OperationSimplifier<false> fold;
  return fold(value);
}
template <typename T>
OpRef constant_fold(T&& value) {
  OperationSimplifier<true> fold;
  return fold(value);
}

OpRef extract_bit(const OpRef& op, uint32_t bit) {
  CAFFEINE_ASSERT(op->type().is_int());
  CAFFEINE_ASSERT(bit < op->type().bitwidth());

  return UnaryOp::CreateTrunc(Type::int_ty(1), BinaryOp::CreateLShr(op, bit));
}

} // namespace caffeine
