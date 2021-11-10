#include "caffeine/Support/UnsupportedOperation.h"
#include "Util/CaptureOutput.h"
#include <gtest/gtest.h>

using namespace caffeine;

class UnsupportedOperationTests : public ::testing::Test {
private:
  CaptureStderr capture;

public:
  void TearDown() override {
    if (HasFailure())
      capture.emit();
  }
};

TEST_F(UnsupportedOperationTests, throws_correct_exception) {
  ASSERT_THROW(CAFFEINE_UNSUPPORTED("Test Throw"),
               caffeine::UnsupportedOperationException);
}

TEST_F(UnsupportedOperationTests, throws_with_message) {
  try {
    CAFFEINE_UNSUPPORTED("Test Throw");
    FAIL();
  } catch (caffeine::UnsupportedOperationException& e) {
    std::string message = e.what();
    ASSERT_TRUE(message.find("Test Throw") != std::string::npos) << message;
  }
}
