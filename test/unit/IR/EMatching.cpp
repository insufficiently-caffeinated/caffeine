#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/Operation.h"
#include <gtest/gtest.h>

using namespace caffeine;
namespace r = caffeine::ematching::reductions;

using caffeine::ematching::EMatcherBuilder;

class EMatchingTests : public ::testing::Test {
public:
  EGraph egraph;
  EMatcherBuilder builder = EMatcher::builder();

  OpRef add(const OpRef& op) {
    return EGraphNode::Create(op->type(), egraph.add(*op));
  }
};

TEST_F(EMatchingTests, concurrent_changes) {
  r::and_zero_elimination(builder);
  r::commutativity(builder, Operation::And);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(ConstantInt::CreateZero(32));
  auto c = add(BinaryOp::CreateAnd(a, b));

  auto aid = egraph.add(*a);
  auto bid = egraph.add(*b);
  auto cid = egraph.add(*c);

  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(bid));
  ASSERT_NE(egraph.find(aid), egraph.find(bid));
}

// In this case, both
//   (1) (and ?x ?x) -> ?x, and
//   (2) (add ?x ?y) -> (add ?y ?x)
// apply to different e-classes. However (1) gets applied first and merges the
// e-class that (2) matched against into the one that (1) did, meaning that the
// e-class and e-node references are no longer valid.
TEST_F(EMatchingTests, sequential_changes) {
  r::and_elimination(builder);
  r::commutativity(builder, Operation::Add);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(Constant::Create(Type::int_ty(32), "b"));
  auto c = add(BinaryOp::CreateAdd(a, b));
  auto d = add(BinaryOp::CreateAnd(c, c));

  auto cid = egraph.add(*c);
  auto did = egraph.add(*d);

  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(did));
}

TEST_F(EMatchingTests, commutativity) {
  r::commutativity(builder, Operation::Add);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(Constant::Create(Type::int_ty(32), "b"));
  auto c = add(BinaryOp::CreateAdd(a, b));
  auto d = add(BinaryOp::CreateAdd(b, a));

  size_t aid = egraph.add(*a);
  size_t bid = egraph.add(*b);
  size_t cid = egraph.add(*c);
  size_t did = egraph.add(*d);

  egraph.merge(aid, bid);
  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(did));
}

TEST_F(EMatchingTests, and_elimination) {
  r::and_elimination(builder);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(Constant::Create(Type::int_ty(32), "b"));
  auto c = add(BinaryOp::CreateAnd(a, b));

  size_t aid = egraph.add(*a);
  size_t bid = egraph.add(*b);
  size_t cid = egraph.add(*c);

  egraph.merge(aid, bid);
  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(aid));
}

TEST_F(EMatchingTests, and_zero_elimination) {
  r::and_zero_elimination(builder);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(ConstantInt::CreateZero(32));
  auto c = add(BinaryOp::CreateAnd(a, b));

  size_t aid = egraph.add(*a);
  size_t bid = egraph.add(*b);
  size_t cid = egraph.add(*c);

  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(bid));
  ASSERT_NE(egraph.find(aid), egraph.find(cid));
}
