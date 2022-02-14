#include "caffeine/IR/EMatching/Filters.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/OperationData.h"
#include <algorithm>

namespace caffeine::ematching {

char IdenticalOperandsFilter::ID = 0;

IdenticalOperandsFilter::IdenticalOperandsFilter() : SubClauseFilter(&ID) {}

bool IdenticalOperandsFilter::matches(const ENode& node) const {
  if (node.operands.empty())
    return true;

  return std::all_of(
      node.operands.begin(), node.operands.end(),
      [&](size_t operand) { return operand == node.operands.front(); });
}

char ConstantOperandFilter::ID = 0;

ConstantOperandFilter::ConstantOperandFilter(const llvm::APInt& value)
    : SubClauseFilter(&ID), value(value) {}

bool ConstantOperandFilter::matches(const ENode& node) const {
  auto data = llvm::dyn_cast<ConstantIntData>(node.data.get());
  if (!data)
    return false;

  return data->value() == value.sextOrTrunc(data->type().bitwidth());
}

bool ConstantOperandFilter::is_equal(const SubClauseFilter& filter) const {
  auto other = static_cast<decltype(this)>(&filter);

  return value == other->value;
}
size_t ConstantOperandFilter::hash() const {
  return llvm::hash_value(value);
}

} // namespace caffeine::ematching
