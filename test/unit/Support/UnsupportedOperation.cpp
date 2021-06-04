#include "caffeine/Support/UnsupportedOperation.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(UnsupportedOperationTests, throws_correct_exception) {
  ASSERT_THROW(CAFFEINE_UNSUPPORTED("Test Throw"),
               caffeine::UnsupportedOperationException);
}

TEST(UnsupportedOperationTests, throws_with_message) {
  try {
    CAFFEINE_UNSUPPORTED("Test Throw");
    FAIL();
  } catch (caffeine::UnsupportedOperationException& e) {
    std::string message = e.what();
    ASSERT_TRUE(message.find("Test Throw") != std::string::npos) << message;
  }
}
