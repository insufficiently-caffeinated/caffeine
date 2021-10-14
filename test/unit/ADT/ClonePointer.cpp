
#include "caffeine/ADT/ClonePointer.h"
#include <gtest/gtest.h>

#include <vector>

using namespace caffeine;

class Basic {
public:
  int a = 0;
  Basic(int b) : a{b} {};
  virtual std::unique_ptr<Basic> clone() {
    return std::make_unique<Basic>(a);
  }

  virtual int get_i() {
    return a;
  }

  virtual ~Basic() = default;
};

TEST(clone_ptr, can_construct) {
  clone_ptr<Basic> basic = make_clone<Basic>(5);
  ASSERT_EQ(basic->a, 5);
}

TEST(clone_ptr, copy_does_copy) {
  clone_ptr<Basic> basic = make_clone<Basic>(5);
  ASSERT_EQ(basic->a, 5);
  auto basic_2 = basic;
  ASSERT_EQ(basic_2->a, 5);
  ASSERT_EQ(basic->a, 5);
  basic->a = 6;
  ASSERT_EQ(basic_2->a, 5);
  ASSERT_EQ(basic->a, 6);
}

class Basic5 : public Basic {
public:
  Basic5() : Basic(0){};
  int get_i() override {
    return 5;
  }

  std::unique_ptr<Basic> clone() override {
    return std::make_unique<Basic5>();
  }
};

class Basic8 : public Basic {
public:
  Basic8() : Basic(0){};
  int get_i() override {
    return 8;
  }

  std::unique_ptr<Basic> clone() override {
    return std::make_unique<Basic8>();
  }
};

TEST(clone_ptr, virtual_things_in_a_class) {
  clone_ptr<Basic> a = static_cast<clone_ptr<Basic>>(make_clone<Basic5>());
  clone_ptr<Basic> b = static_cast<clone_ptr<Basic>>(make_clone<Basic8>());
  std::vector<clone_ptr<Basic>> vec = {a, b};

  ASSERT_EQ(vec[0]->get_i(), 5);
  ASSERT_EQ(vec[1]->get_i(), 8);
}

TEST(clone_ptr, virtual_things_in_a_class_actually_copy) {
  clone_ptr<Basic> a = static_cast<clone_ptr<Basic>>(make_clone<Basic5>());
  clone_ptr<Basic> b = static_cast<clone_ptr<Basic>>(make_clone<Basic8>());
  std::vector<clone_ptr<Basic>> vec = {a, b};

  ASSERT_EQ(vec[0]->get_i(), 5);
  ASSERT_EQ(vec[1]->get_i(), 8);

  auto vec2 = vec;
  vec[0] = make_clone<Basic>(-2);

  ASSERT_EQ(vec[0]->get_i(), -2);
  ASSERT_EQ(vec[1]->get_i(), 8);

  ASSERT_EQ(vec2[0]->get_i(), 5);
  ASSERT_EQ(vec2[1]->get_i(), 8);
}
