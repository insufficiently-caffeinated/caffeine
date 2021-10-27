#include "caffeine/IR/Value.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"

#include <gtest/gtest.h>

using namespace caffeine;

#define BITWIDTH 32
#define DECL_TEST(op, vop, lhs_, rhs_)                                         \
  TEST(ir_value, op) {                                                         \
    llvm::APInt lhs{BITWIDTH, lhs_};                                           \
    llvm::APInt rhs{BITWIDTH, rhs_};                                           \
    ASSERT_TRUE(Value::op(lhs, rhs) == (lhs vop rhs));                         \
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

  ASSERT_TRUE(a == b);
}

TEST(ir_value, div_by_0_does_not_fault) {
  Value a{llvm::APInt(64, 1)};
  Value b{llvm::APInt(64, 0)};

  Value::bvudiv(a, b);
}

TEST(ir_value, sdiv_invalid_does_not_fault) {
  Value a{llvm::APInt::getSignedMinValue(32)};
  Value b{llvm::APInt::getAllOnesValue(32)};

  Value::bvsdiv(a, b);
}

TEST(ir_value, print_int) {
  auto ci = ConstantInt::Create(llvm::APInt(32, 1337));
  auto constant_int = llvm::dyn_cast<ConstantInt>(ci.get());
  ASSERT_TRUE(constant_int);

  std::stringstream output;
  output << Value(*constant_int);
  ASSERT_EQ(output.str(), "1337");
}

TEST(ir_value, print_float) {
  auto cf = ConstantFloat::Create(llvm::APFloat(0.5));
  auto constant_float = llvm::dyn_cast<ConstantFloat>(cf.get());
  ASSERT_TRUE(constant_float);

  std::stringstream output;
  output << Value(*constant_float);

  // Choose a floating point number which can be stored
  // accurately to avoid anything like 0.5100000000000000089
  ASSERT_EQ(output.str(), "0.5");
}

TEST(ir_value, print_array) {
  std::stringstream output;
  output << Value(SharedArray({0, 0, 0}), Type::int_ty(32));
  // This is temporary, but if anyone implements that
  // it will help them update the testcase
  ASSERT_EQ(output.str(), "<array>");
}

TEST(ir_value, print_vector) {
  std::stringstream output;
  std::vector<Value> data;
  output << Value(data);
  // This is temporary, but if anyone implements that
  // it will help them update the testcase
  ASSERT_EQ(output.str(), "<vector>");
}
