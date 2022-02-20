#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/Operation.h"
#include <atomic>
#include <chrono>
#include <exception>
#include <gtest/gtest-death-test.h>
#include <gtest/gtest.h>
#include <mutex>
#include <optional>
#include <thread>

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

#define ASSERT_NO_TIMEOUT(secs, stmt)                                          \
  ASSERT_EXIT(                                                                 \
      {                                                                        \
        alarm(secs);                                                           \
        stmt;                                                                  \
        exit(0);                                                               \
      },                                                                       \
      ::testing::ExitedWithCode(0), "")

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

TEST_F(EMatchingTests, many_ors) {
  ASSERT_NO_TIMEOUT(5, {
    r::associativity(builder, Operation::Or);
    r::commutativity(builder, Operation::Or);
    auto matcher = builder.build();

    auto x = add(Constant::Create(Type::int_ty(32), 0));
    for (uint64_t i = 1; i <= 128; ++i) {
      x = add(BinaryOp::CreateOr(x, Constant::Create(Type::int_ty(32), i)));
    }

    egraph.simplify(matcher);
  });
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

TEST_F(EMatchingTests, sub_elimination) {
  r::sub_elimination(builder, Operation::Add);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(Constant::Create(Type::int_ty(32), "b"));
  auto c = add(BinaryOp::CreateSub(a, b));
  auto d = add(ConstantInt::CreateZero(32));

  size_t aid = egraph.add(*a);
  size_t bid = egraph.add(*b);
  size_t cid = egraph.add(*c);
  size_t did = egraph.add(*d);

  egraph.merge(aid, bid);
  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(did));
}

TEST_F(EMatchingTests, icmp_elimination) {
  r::icmp_eliminations(builder);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(Constant::Create(Type::int_ty(32), "b"));
  auto c = add(ICmpOp::CreateICmpEQ(a, b));
  auto d = add(ConstantInt::Create(true));

  auto aid = egraph.add(*a);
  auto bid = egraph.add(*b);
  auto cid = egraph.add(*c);
  auto did = egraph.add(*d);

  egraph.merge(aid, bid);
  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(did));
}
