#pragma once

#include "caffeine/IR/Transforms.h"
#include <llvm/ADT/SmallVector.h>

namespace caffeine::transforms {

template <typename Visitor>
ref<Operation> rebuild(const ref<Operation>& expression, Visitor& visitor) {
  llvm::SmallVector<ref<Operation>, 3> ops;
  ops.reserve(expression->num_operands());

  for (size_t i = 0; i < ops.capacity(); ++i) {
    ops.push_back(rebuild(expression->operand_at(i), visitor));
  }

  return visitor(expression->with_new_operands(ops));
}

} // namespace caffeine::transforms
