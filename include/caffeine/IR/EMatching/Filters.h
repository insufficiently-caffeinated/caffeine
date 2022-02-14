#pragma once

#include "caffeine/IR/EGraphMatching.h"

namespace caffeine::ematching {

// A filter that checks whether all the operands refer to the same e-class.
class IdenticalOperandsFilter final : public SubClauseFilter {
public:
  IdenticalOperandsFilter();

  bool matches(const ENode& node) const override;

private:
  bool is_equal(const SubClauseFilter&) const override {
    return true;
  }
  size_t hash() const override {
    return 0;
  }

  static char ID;
};

// A filter that checks whether the integer value of the operand (when it is a
// ConstantInt) is equivalent to the provided value.
//
// The provided value will either be sign-extended or truncated to match the
// bitwidth of the integer in the operation.
class ConstantOperandFilter final : public SubClauseFilter {
public:
  ConstantOperandFilter(const llvm::APInt& value);

  bool matches(const ENode& node) const override;

private:
  bool is_equal(const SubClauseFilter& filter) const override;
  size_t hash() const override;

  llvm::APInt value;

  static char ID;
};

} // namespace caffeine::ematching
