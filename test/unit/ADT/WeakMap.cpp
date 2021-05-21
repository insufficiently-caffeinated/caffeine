#include "caffeine/ADT/WeakMap.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(WeakMapTests, dead_and_forgotten) {
  weak_map<int, int> map;

  std::shared_ptr<int> key = std::make_shared<int>(1);
  int* ptr = key.get();

  map.insert(key, 10);

  {
    auto it = map.find(ptr);
    ASSERT_NE(it, map.end());
    ASSERT_EQ(it->second, 10);
    ASSERT_EQ(it->first.lock(), key);
  }

  key.reset();

  ASSERT_EQ(map.find(ptr), map.end());
}

TEST(WeakMapTests, insert_erases_dead_element) {
  weak_map<int, int> map;

  int v = 4;

  // Two shared pointers that have the same address but don't delete the
  // allocation when destroyed.
  auto key1 = std::shared_ptr<int>(&v, [](int*) {});
  auto key2 = std::shared_ptr<int>(&v, [](int*) {});

  ASSERT_TRUE(map.insert(key1, 5).second);
  ASSERT_FALSE(map.insert(key1, 6).second);

  ASSERT_EQ(map.at(key1), 5);

  key1.reset();

  ASSERT_TRUE(map.insert(key2, 8).second);
  ASSERT_EQ(map.at(key2), 8);
}

TEST(WeakMapTests, cannot_insert_null) {
  weak_map<int, int> map;

  ASSERT_FALSE(map.insert(std::shared_ptr<int>(), 3).second);
}

TEST(WeakMapTests, find_not_in_map) {
  weak_map<int, int> map;

  auto it = map.find(nullptr);
  ASSERT_EQ(it, map.end());
}
