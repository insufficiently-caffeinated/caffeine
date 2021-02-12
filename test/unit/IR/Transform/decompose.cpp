#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Transforms.h"
#include <gtest/gtest.h>

using namespace caffeine;
using namespace caffeine::transforms;

TEST(DecomposeTransformTests, breaks_down_top_level_and) {
  std::vector<Assertion> assertions = {Assertion(BinaryOp::CreateAnd(
      BinaryOp::CreateAnd(Constant::Create(Type::int_ty(1), 0),
                          Constant::Create(Type::int_ty(1), 1)),
      Constant::Create(Type::int_ty(1), 2)))};

  decompose(assertions);

  ASSERT_EQ(assertions.size(), 3);

  std::sort(assertions.begin(), assertions.end(),
            [](const auto& a, const auto& b) {
              const auto* lhs = llvm::cast<Constant>(a.value().get());
              const auto* rhs = llvm::cast<Constant>(b.value().get());
              return lhs->number() < rhs->number();
            });

  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
}

TEST(DecomposeTransformTests, breaks_down_top_level_not_or) {
  std::vector<Assertion> assertions = {
      Assertion(UnaryOp::CreateNot(BinaryOp::CreateOr(
          UnaryOp::CreateNot(
              BinaryOp::CreateAnd(Constant::Create(Type::int_ty(1), 0),
                                  Constant::Create(Type::int_ty(1), 1))),
          UnaryOp::CreateNot(Constant::Create(Type::int_ty(1), 2)))))};

  decompose(assertions);

  ASSERT_EQ(assertions.size(), 3);

  std::sort(assertions.begin(), assertions.end(),
            [](const auto& a, const auto& b) {
              const auto* lhs = llvm::cast<Constant>(a.value().get());
              const auto* rhs = llvm::cast<Constant>(b.value().get());
              return lhs->number() < rhs->number();
            });

  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
  ASSERT_EQ(llvm::cast<Constant>(*assertions[0].value()).number(), 0);
}
