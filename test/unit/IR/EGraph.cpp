#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationData.h"
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

TEST_F(EGraphTests, get_non_canonical) {
  size_t a = egraph.add(*Constant::Create(Type::int_ty(32), "a"));
  size_t b = egraph.add(*Constant::Create(Type::int_ty(32), "b"));

  egraph.merge(a, b);
  egraph.rebuild();

  ASSERT_NE(egraph.get(a), nullptr);
  ASSERT_NE(egraph.get(b), nullptr);
  ASSERT_EQ(egraph.get(a), egraph.get(b));
}

TEST_F(EGraphTests, add_merge) {
  size_t a = egraph.add(*Constant::Create(Type::int_ty(32), "a"));
  size_t b = egraph.add(*Constant::Create(Type::int_ty(32), "b"));
  size_t c = egraph.add_merge(a, ENode{std::make_shared<ConstantIntData>(
                                     llvm::APInt::getNullValue(32))});
  size_t d = egraph.merge(b, egraph.add(ENode{std::make_shared<ConstantIntData>(
                                 llvm::APInt::getAllOnesValue(32))}));

  ASSERT_EQ(egraph.find(a), egraph.find(c));
  ASSERT_EQ(egraph.find(b), egraph.find(d));

  size_t e = egraph.add_merge(d, ENode{std::make_shared<ConstantIntData>(
                                     llvm::APInt::getNullValue(32))});
  ASSERT_EQ(egraph.find(a), egraph.find(b));
  ASSERT_EQ(egraph.find(e), egraph.find(b));
}
