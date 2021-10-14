
#include "caffeine/ADT/CopyPointer.h"
#include <gtest/gtest.h>

using namespace caffeine;

class Basic {
public:
  int a = 0;
  Basic(int b) : a{b} {};
  std::unique_ptr<Basic> clone() {
    return std::make_unique<Basic>(a);
  }
};

TEST(CopyPointer, can_construct) {
  CopyPointer<Basic> basic = make_copy<Basic>(5);
  ASSERT_EQ(basic->a, 5);
}

TEST(CopyPointer, copy_does_copy) {
  CopyPointer<Basic> basic = make_copy<Basic>(5);
  ASSERT_EQ(basic->a, 5);
  auto basic_2 = basic;
  ASSERT_EQ(basic_2->a, 5);
  ASSERT_EQ(basic->a, 5);
  basic->a = 6;
  ASSERT_EQ(basic_2->a, 5);
  ASSERT_EQ(basic->a, 6);
}
