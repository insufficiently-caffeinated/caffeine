#include "caffeine/Support/Assert.h"
#include <gtest/gtest-death-test.h>
#include <gtest/gtest.h>

bool function_that_returns_false() {
  return false;
}

#define TEST_MESSAGE "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa"

TEST(AssertDeathTest, abort_dies_and_shows_message) {
  ASSERT_DEATH(CAFFEINE_ABORT(TEST_MESSAGE), TEST_MESSAGE);
}

TEST(AssertDeathTest, assert_false_dies_with_message) {
  ASSERT_DEATH(CAFFEINE_ASSERT(false, TEST_MESSAGE), TEST_MESSAGE);
}

TEST(AssertDeathTest, assert_false_inclues_expression) {
  ASSERT_DEATH(CAFFEINE_ASSERT(function_that_returns_false(), TEST_MESSAGE),
               "function_that_returns_false()");
}

TEST(AssertDeathTest, assert_true_does_not_die) {
  CAFFEINE_ASSERT(true);
}

TEST(AssertDeathTest, unimplemented_message) {
  ASSERT_DEATH(CAFFEINE_UNIMPLEMENTED(), "not implemented|unimplemented");
}

TEST(AssertDeathTest, unreachable_message) {
  ASSERT_DEATH(CAFFEINE_UNREACHABLE(), "unreachable");
}
