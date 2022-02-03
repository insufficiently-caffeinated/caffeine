#include "caffeine/Model/GraphAssertionList.h"
#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/Operation.h"

#include <gtest/gtest.h>

using namespace caffeine;

class GraphAssertionListTests : public ::testing::Test {
public:
  EGraph egraph;
  GraphAssertionList list;

  OpRef add(const OpRef& op) {
    return EGraphNode::Create(op->type(), egraph.add(*op));
  }
};

TEST_F(GraphAssertionListTests, deduplicate) {
  list.insert(1);
  list.insert(2);
  list.insert(1);

  ASSERT_EQ(list.size(), 2);
}

TEST_F(GraphAssertionListTests, canonicalize_dedup) {
  list.insert(
      egraph.add(*BinaryOp::CreateAnd(Constant::Create(Type::int_ty(1), 0),
                                      Constant::Create(Type::int_ty(1), 1))));
  list.insert(egraph.add(*Constant::Create(Type::int_ty(1), 0)));
  list.insert(egraph.add(*Constant::Create(Type::int_ty(1), 1)));

  ASSERT_EQ(list.size(), 3);

  list.canonicalize(egraph);

  ASSERT_EQ(list.size(), 2);
}

TEST_F(GraphAssertionListTests, canonicalize_decompose) {
  list.insert(
      egraph.add(*BinaryOp::CreateAnd(Constant::Create(Type::int_ty(1), 0),
                                      Constant::Create(Type::int_ty(1), 1))));

  ASSERT_EQ(list.size(), 1);

  list.canonicalize(egraph);

  ASSERT_EQ(list.size(), 2);
}
