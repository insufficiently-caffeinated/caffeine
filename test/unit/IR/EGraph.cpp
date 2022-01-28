#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/Operation.h"
#include <gtest/gtest.h>

using namespace caffeine;

class EGraphTests : public ::testing::Test {
public:
  EGraph egraph;

  OpRef add(const OpRef& op) {
    return EGraphNode::Create(op->type(), egraph.add(*op));
  }
};

TEST_F(EGraphTests, constprop_add) {
  auto a = add(ConstantInt::Create(llvm::APInt(32, 15)));
  auto b = add(ConstantInt::Create(llvm::APInt(32, 11)));
  auto c = add(BinaryOp::CreateAdd(a, b));
  auto d = add(ConstantInt::Create(llvm::APInt(32, 15 + 11)));

  size_t id_a = egraph.add(*a);
  size_t id_b = egraph.add(*b);
  size_t id_c = egraph.add(*c);
  size_t id_d = egraph.add(*d);

  ASSERT_NE(id_a, id_b);
  ASSERT_NE(id_a, id_c);
  ASSERT_NE(id_a, id_d);
  ASSERT_NE(id_b, id_c);
  ASSERT_NE(id_b, id_d);
  ASSERT_NE(id_c, id_d);

  egraph.constprop();
  egraph.rebuild();

  ASSERT_EQ(egraph.find(id_c), egraph.find(id_d));
}

TEST_F(EGraphTests, constprop_not) {
  auto a = add(ConstantInt::Create(false));
  auto b = add(UnaryOp::CreateNot(a));

  size_t id_a = egraph.add(*a);
  size_t id_b = egraph.add(*b);

  egraph.constprop();
  egraph.rebuild();

  size_t id_c = egraph.add(*ConstantInt::Create(true));

  ASSERT_NE(id_a, id_b);
  ASSERT_NE(id_a, id_c);
  ASSERT_EQ(egraph.find(id_b), egraph.find(id_c));
}
