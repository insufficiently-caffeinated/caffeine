#include "caffeine/IR/Value.h"

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
