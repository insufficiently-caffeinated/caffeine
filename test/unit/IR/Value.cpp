#include "caffeine/IR/Value.h"
#include "caffeine/IR/Type.h"

#include <gtest/gtest.h>

using namespace caffeine;

#define BITWIDTH 32
#define DECL_TEST(op, vop, lhs_, rhs_)                                         \
  TEST(ir_value, op) {                                                         \
    llvm::APInt lhs{BITWIDTH, lhs_};                                           \
    llvm::APInt rhs{BITWIDTH, rhs_};                                           \
    ASSERT_EQ(Value::op(lhs, rhs), lhs vop rhs);                               \
  }                                                                            \
  static_assert(true)

// These are mostly just tests to prevent implementation typos
DECL_TEST(bvadd, +, 0xFF0, 0x00F);
DECL_TEST(bvsub, -, 0xFF0, 0x00F);
DECL_TEST(bvmul, *, 0xFF0, 0x00F);

DECL_TEST(bvand, &, 0xFF0, 0x0FF);
DECL_TEST(bvor, |, 0xFF0, 0x0FF);
DECL_TEST(bvxor, ^, 0xFF0, 0x0FF);
DECL_TEST(bvshl, <<, 0xFF, 3);

// This should really be a property-based test
// Ideally we'd use caffeine itself to perform these tests
TEST(ir_value, bitcast_roundtrip) {
  Value a{llvm::APInt(64, ~UINT64_C(0))};
  Value b =
      Value::bitcast(Value::bitcast(a, Type::type_of<double>()), a.type());

  ASSERT_EQ(a, b);
}
