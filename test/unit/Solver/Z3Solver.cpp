
#include "src/Solver/Z3Solver.h"

#include <gtest/gtest.h>

using caffeine::z3_to_apfloat;

class Z3ConversionTests : public ::testing::Test {
public:
  z3::context ctx;
};

TEST_F(Z3ConversionTests, pos_inf_to_apfloat) {
  auto pos_z = z3::expr(ctx, Z3_mk_fpa_inf(ctx, ctx.fpa_sort(11, 53), false));
  auto pos_v = z3_to_apfloat(pos_z);

  EXPECT_TRUE(pos_v.isInfinity());

  ASSERT_EQ(pos_v.convertToDouble(), INFINITY);
}

TEST_F(Z3ConversionTests, neg_inf_to_apfloat) {
  auto neg_z = z3::expr(ctx, Z3_mk_fpa_inf(ctx, ctx.fpa_sort(11, 53), true));
  auto neg_v = z3_to_apfloat(neg_z);

  EXPECT_TRUE(neg_v.isInfinity());
  ASSERT_EQ(neg_v.convertToDouble(), -INFINITY);
}

TEST_F(Z3ConversionTests, nan_to_apfloat) {
  auto nan = z3::expr(ctx, Z3_mk_fpa_nan(ctx, ctx.fpa_sort(11, 53)));
  auto val = z3_to_apfloat(nan);

  ASSERT_TRUE(val.isNaN());
}

TEST_F(Z3ConversionTests, zero_to_apfloat) {
  auto zero = z3::expr(ctx, Z3_mk_fpa_zero(ctx, ctx.fpa_sort(11, 53), false));
  auto val = z3_to_apfloat(zero);

  ASSERT_TRUE(val.isZero());
}

TEST_F(Z3ConversionTests, five_to_apfloat) {
  auto fpa =
      z3::expr(ctx, Z3_mk_fpa_numeral_double(ctx, 5.0, ctx.fpa_sort(11, 53)));
  auto val = z3_to_apfloat(fpa);

  ASSERT_TRUE(val.isFiniteNonZero());
  ASSERT_EQ(val.convertToDouble(), 5.0);
}

TEST_F(Z3ConversionTests, neg1_to_apfloat) {
  auto fpa =
      z3::expr(ctx, Z3_mk_fpa_numeral_double(ctx, -1.0, ctx.fpa_sort(11, 53)));
  auto val = z3_to_apfloat(fpa);

  ASSERT_TRUE(val.isFiniteNonZero());
  ASSERT_EQ(val.convertToDouble(), -1.0);
}

TEST_F(Z3ConversionTests, dbl_max_to_apfloat) {
  auto fpa = z3::expr(
      ctx, Z3_mk_fpa_numeral_double(ctx, DBL_MAX, ctx.fpa_sort(11, 53)));
  auto val = z3_to_apfloat(fpa);

  ASSERT_TRUE(val.isFiniteNonZero());
  ASSERT_EQ(val.convertToDouble(), DBL_MAX);
}
