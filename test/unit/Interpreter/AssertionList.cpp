
#include "caffeine/Interpreter/AssertionList.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(AssertionListTests, breaks_down_top_level_and) {
  AssertionList list;
  list.insert(Assertion(BinaryOp::CreateAnd(
      BinaryOp::CreateAnd(Constant::Create(Type::int_ty(1), 0),
                          Constant::Create(Type::int_ty(1), 1)),
      Constant::Create(Type::int_ty(1), 2))));

  ASSERT_EQ(list.size(), 3);
  auto assertions = std::vector<Assertion>(list.begin(), list.end());

  std::sort(assertions.begin(), assertions.end(),
            [](const auto& a, const auto& b) {
              const auto* lhs = llvm::cast<Constant>(a.value().get());
              const auto* rhs = llvm::cast<Constant>(b.value().get());
              return lhs->number() < rhs->number();
            });

  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[1].value()).number(), 1);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[2].value()).number(), 2);
}

TEST(AssertionListTests, breaks_down_top_level_not_or) {
  AssertionList list;
  list.insert(Assertion(UnaryOp::CreateNot(BinaryOp::CreateOr(
      UnaryOp::CreateNot(
          BinaryOp::CreateAnd(Constant::Create(Type::int_ty(1), 0),
                              Constant::Create(Type::int_ty(1), 1))),
      UnaryOp::CreateNot(Constant::Create(Type::int_ty(1), 2))))));

  ASSERT_EQ(list.size(), 3);
  auto assertions = std::vector<Assertion>(list.begin(), list.end());

  std::sort(assertions.begin(), assertions.end(),
            [](const auto& a, const auto& b) {
              const auto* lhs = llvm::cast<Constant>(a.value().get());
              const auto* rhs = llvm::cast<Constant>(b.value().get());
              return lhs->number() < rhs->number();
            });

  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[1].value()).number(), 1);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[2].value()).number(), 2);
}