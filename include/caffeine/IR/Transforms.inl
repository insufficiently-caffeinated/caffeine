#pragma once

#include "caffeine/IR/Transforms.h"
#include <llvm/ADT/SmallVector.h>

namespace caffeine::transforms {

template <typename Visitor>
ref<Operation> rebuild(const ref<Operation>& expression, Visitor&& visitor) {
  size_t nops = expression->num_operands();
  llvm::SmallVector<ref<Operation>, 3> ops;
  ops.reserve(nops);

  for (size_t i = 0; i < nops; ++i) {
    ops.push_back(rebuild(expression->operand_at(i), std::move(visitor)));
  }

  return visitor(expression->with_new_operands(ops));
}

} // namespace caffeine::transforms
