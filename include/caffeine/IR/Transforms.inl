#pragma once

#include "caffeine/IR/Transforms.h"
#include <llvm/ADT/SmallVector.h>

namespace caffeine::transforms {

template <typename Visitor>
ref<Operation> rebuild(const ref<Operation>& expression, Visitor& visitor) {
  size_t nops = expression->num_operands();
  llvm::SmallVector<ref<Operation>, 3> ops;
  ops.reserve(nops);

  size_t same_count = 0;

  for (size_t i = 0; i < nops; ++i) {
    const ref<Operation>& operand = expression->operand_at(i);
    ref<Operation> newexpr = rebuild(operand, visitor);

    if (newexpr == operand) {
      same_count += 1;
    }

    ops.push_back(std::move(newexpr));
  }

  if (same_count == ops.size()) {
    return visitor(expression);
  } else {
    return visitor(expression->with_new_operands(ops));
  }
}
template <typename Visitor>
ref<Operation> rebuild(const ref<Operation>& expression, Visitor&& visitor) {
  return rebuild(expression, visitor);
}

} // namespace caffeine::transforms
