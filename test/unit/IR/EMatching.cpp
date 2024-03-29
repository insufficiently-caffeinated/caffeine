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
  r::sub_elimination(builder);
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

TEST_F(EMatchingTests, load_store_elimination_elim_array) {
  r::load_store_elimination(builder);
  r::icmp_eliminations(builder);
  r::select_constprop(builder);
  auto matcher = builder.build();

  // clang-format off
  auto value  = add(Constant::Create(Type::int_ty(8), "value"));
  auto size   = add(Constant::Create(Type::int_ty(32), "size"));
  auto offset = add(Constant::Create(Type::int_ty(32), "offset"));
  auto array  = add(ConstantArray::Create("array", size));
  auto store  = add(StoreOp::Create(array, offset, value));
  auto load   = add(LoadOp::Create(store, offset));
  
  auto value_id = egraph.add(*value);
  auto load_id  = egraph.add(*load);
  // clang-format on

  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(value_id), egraph.find(load_id));
}

TEST_F(EMatchingTests, load_store_elimination_elim_store) {
  r::load_store_elimination(builder);
  r::icmp_eliminations(builder);
  r::select_constprop(builder);
  auto matcher = builder.build();

  // clang-format off
  auto value  = add(Constant::Create(Type::int_ty(8), "value"));
  auto size   = add(Constant::Create(Type::int_ty(32), "size"));
  auto offset = add(ConstantInt::Create(llvm::APInt(32, 5)));
  auto array  = add(ConstantArray::Create("array", size));
  auto store  = add(StoreOp::Create(array, offset, value));
  auto load   = add(LoadOp::Create(store, ConstantInt::CreateZero(32)));
  auto direct = add(LoadOp::Create(array, ConstantInt::CreateZero(32)));

  auto load_id   = egraph.add(*load);
  auto direct_id = egraph.add(*direct);
  // clang-format on

  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(direct_id), egraph.find(load_id));
}

TEST_F(EMatchingTests, zext_trunc_elimination) {
  r::zext_trunc_elimination(builder);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(UnaryOp::CreateTrunc(Type::int_ty(16), a));
  auto c = add(UnaryOp::CreateZExt(Type::int_ty(24), b));
  auto d = add(ConstantInt::Create(llvm::APInt(24, 0xFFFF)));
  auto e = add(UnaryOp::CreateTrunc(Type::int_ty(24), a));
  auto f = add(BinaryOp::CreateAnd(e, d));

  auto cid = egraph.add(*c);
  auto fid = egraph.add(*f);

  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(fid));
}

// This test case creates two possible matches for the rewrite rule and, since
// all relevant nodes are captured, we expect to see both canonical rewritten
// expressions show up in the final representation of the top-level e-class.
TEST_F(EMatchingTests, zext_trunc_elimination_multi) {
  r::zext_trunc_elimination(builder);
  auto matcher = builder.build();

  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(UnaryOp::CreateTrunc(Type::int_ty(16), a));
  auto c = add(UnaryOp::CreateZExt(Type::int_ty(24), b));
  auto d = add(ConstantInt::Create(llvm::APInt(24, 0xFFFF)));
  auto e = add(UnaryOp::CreateTrunc(Type::int_ty(24), a));
  auto f = add(BinaryOp::CreateAnd(e, d));
  auto g = add(Constant::Create(Type::int_ty(32), "g"));
  auto h = add(UnaryOp::CreateTrunc(Type::int_ty(16), g));
  auto i = add(UnaryOp::CreateTrunc(Type::int_ty(24), g));
  auto j = add(BinaryOp::CreateAnd(i, d));

  auto bid = egraph.add(*b);
  auto cid = egraph.add(*c);
  auto fid = egraph.add(*f);
  auto hid = egraph.add(*h);
  auto jid = egraph.add(*j);

  egraph.merge(bid, hid);
  egraph.simplify(matcher);

  ASSERT_EQ(egraph.find(cid), egraph.find(fid));
  ASSERT_EQ(egraph.find(fid), egraph.find(jid));
}

TEST_F(EMatchingTests, shl_lshr_elimination_equal) {
  r::shift_elimination(builder);
  r::commutativity(builder, Operation::And);
  auto matcher = builder.build();

  auto shift = add(ConstantInt::Create(llvm::APInt(32, 8)));
  auto a = add(Constant::Create(Type::int_ty(32), "a"));
  auto b = add(BinaryOp::CreateLShr(a, shift));
  auto c = add(BinaryOp::CreateShl(b, shift));
  auto d = add(ConstantInt::Create(llvm::APInt(32, 0xFFFFFF00)));
  auto e = add(BinaryOp::CreateAnd(a, d));

  auto cid = egraph.add(*c);
  auto eid = egraph.add(*e);

  egraph.DebugPrint();
  egraph.simplify(matcher);
  egraph.DebugPrint();

  ASSERT_EQ(egraph.find(cid), egraph.find(eid));
}
