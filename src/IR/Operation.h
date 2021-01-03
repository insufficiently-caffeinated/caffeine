#pragma once

#include "caffeine/IR/Operation.h"

/**
 * This header has a bunch of utility methods for constant folding.
 */

namespace caffeine {

inline bool is_constant_int(const Operation& op, uint64_t value) {
  if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op))
    return constant->value() == value;
  return false;
}

} // namespace caffeine
