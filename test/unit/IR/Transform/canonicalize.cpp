
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Transforms.h"

#include <gtest/gtest.h>

using namespace caffeine;
using namespace caffeine::transforms;

TEST(CanonicalizeTransformTests, canonicalFalseAssertions) {
  AssertionList assertions = {Assertion(ConstantInt::Create(false)),
                              Assertion(ConstantInt::Create(true)),
                              Assertion(Constant::Create(Type::int_ty(1), 0))};

  canonicalize(assertions);

  ASSERT_EQ(assertions.size(), 1);
  ASSERT_TRUE(assertions[0].is_constant_value(false));
}
