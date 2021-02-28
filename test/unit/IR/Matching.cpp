#include "caffeine/IR/Matching.h"

#include <gtest/gtest.h>

using namespace caffeine;
using namespace caffeine::matching;

// Make sure the test namespace is correct
class MatchingTests : public ::testing::Test {};

TEST_F(MatchingTests, match_any) {
  auto expr = ConstantInt::Create(true);

  ASSERT_TRUE(matches(expr, Any()));
}

TEST_F(MatchingTests, match_binop) {
  auto add = BinaryOp::CreateAdd(Constant::Create(Type::int_ty(32), 0), 55);

  OpRef first, second;
  ASSERT_TRUE(matches(add, Add(first, second)));
}

TEST_F(MatchingTests, match_nested) {
  auto expr = BinaryOp::CreateAdd(
      BinaryOp::CreateSub(Constant::Create(Type::int_ty(32), 0), 77),
      Constant::Create(Type::int_ty(32), 1));

  OpRef first, second;
  ASSERT_TRUE(matches(expr, Add(Sub(&first, second), Any())));

  ASSERT_EQ(first->opcode(), Operation::ConstantNumbered);
  ASSERT_EQ(second->opcode(), Operation::ConstantInt);
}

TEST_F(MatchingTests, match_unop) {
  auto expr = UnaryOp::CreateNot(Constant::Create(Type::int_ty(32), 0));

  OpRef cnst;
  ASSERT_TRUE(matches(expr, Not(cnst)));
  ASSERT_EQ(cnst->opcode(), Operation::ConstantNumbered);
}

TEST_F(MatchingTests, replace_double_not) {
  using caffeine::Constant;

  auto expr = UnaryOp::CreateNot(
      UnaryOp::CreateNot(Constant::Create(Type::int_ty(18), 0)));

  OpRef child;
  while (auto parent = matches_anywhere(expr, Not(Not(child))))
    *parent = *child;

  ASSERT_TRUE(llvm::isa<Constant>(expr.get()));
}

TEST_F(MatchingTests, fixedarray) {
  auto expr = FixedArray::Create(Type::int_ty(32),
                                 UnaryOp::CreateNot(UnaryOp::CreateNot(
                                     Constant::Create(Type::int_ty(1), 0))),
                                 64);

  ASSERT_TRUE(matches_anywhere(expr, Not(Not(Any()))));
}
