
#include "caffeine/IR/Assertion.h"

#include <gtest/gtest.h>

using namespace caffeine;

TEST(ir_assertion, check_constant) {
  auto constant = ConstantInt::Create(llvm::APInt(1, 1));
  Assertion assertion(constant);

  ASSERT_TRUE(assertion.is_constant());
}
