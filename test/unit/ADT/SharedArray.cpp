#include <gtest/gtest.h>

#define CAFFEINE_SHAREDARRAY_TEST_EXPOSE_INTERNALS
#include "caffeine/ADT/SharedArray.h"

using caffeine::SharedArray;

static_assert(0.0 <= SharedArray::flatten_threshold &&
                  SharedArray::flatten_threshold <= 1.0,
              "flatten_threshold out of range");

class SharedArrayTest : public ::testing::Test {
protected:
  std::vector<char> zeros;
  std::vector<char> large;

  void SetUp() override {
    zeros = std::vector<char>(2 * SharedArray::min_copy_size, 0);

    large.clear();
    large.reserve(16000);
    for (size_t i = 0; i < 16000; ++i)
      large.push_back(i % 128);
  }
};

TEST_F(SharedArrayTest, copy_test) {
  SharedArray array = large;

  for (size_t i = 0; i < array.size(); ++i)
    ASSERT_EQ(array[i], large[i]);
}

TEST_F(SharedArrayTest, no_change_when_copied_array_changed) {
  SharedArray array1 = large;
  SharedArray array2 = array1;

  for (size_t i = 0; i < 2 * SharedArray::min_copy_size; ++i) {
    array2[i] = 0;
  }

  for (size_t i = 0; i < 2 * SharedArray::min_copy_size; ++i)
    ASSERT_EQ(array2[i], 0);

  for (size_t i = 0; i < 2 * SharedArray::min_copy_size; ++i)
    ASSERT_EQ(array1[i], large[i]);
}

TEST_F(SharedArrayTest, flattens_when_sufficiently_modified) {
  SharedArray array = zeros;
  SharedArray copy = array;

  ASSERT_TRUE(array.is_shared());
  ASSERT_TRUE(copy.is_shared());

  for (size_t i = 0; i < zeros.size(); ++i)
    copy.store(i, 5);

  for (size_t i = 0; i < copy.size(); ++i)
    ASSERT_EQ(copy[i], 5);

  ASSERT_TRUE(copy.is_flat());
}
