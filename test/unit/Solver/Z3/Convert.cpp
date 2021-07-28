#include "caffeine/Solver/Z3/Convert.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(Z3TestONE, a) {
  z3::context ctx;

  auto val = ctx.bv_const("test", 33);
  
  ASSERT_EQ(val.kind(), Z3_APP_AST);
  ASSERT_EQ(val.decl().decl_kind(), Z3_OP_UNINTERPRETED);
}
