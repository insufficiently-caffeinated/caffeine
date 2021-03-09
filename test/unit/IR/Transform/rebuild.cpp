#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Transforms.h"

#include <gtest/gtest.h>

namespace caffeine {

TEST(RebuildTransformTest, unchanged_reuses_expressions) {
  auto expression = BinaryOp::CreateAdd(
      BinaryOp::CreateSub(Constant::Create(Type::type_of<uint32_t>(), "a"),
                          Constant::Create(Type::type_of<uint32_t>(), "b")),
      Constant::Create(Type::type_of<uint32_t>(), 1));

  auto changed =
      transforms::rebuild(expression, [](const auto& e) { return e; });

  ASSERT_EQ(expression.get(), changed.get());
}

} // namespace caffeine
