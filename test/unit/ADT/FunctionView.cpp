#include "caffeine/ADT/FunctionView.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(FunctionViewTests, function_pointer) {
  static bool func_ran = false;

  void (*func)() = []() { func_ran = true; };
  function_view<void()> view = func;
  view();

  ASSERT_TRUE(func_ran);
}

TEST(FunctionViewTests, const_local) {
  bool func_ran = false;

  auto func = [&] { func_ran = true; };
  function_view<void()> view = func;
  view();

  ASSERT_TRUE(func_ran);
}

TEST(FunctionViewTests, temporary) {
  bool func_ran = false;
  function_view<void()>([&] { func_ran = true; })();

  ASSERT_TRUE(func_ran);
}
