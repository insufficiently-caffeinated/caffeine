#include "caffeine/ADT/SlotMap.h"

#include <gtest/gtest.h>

using namespace caffeine;

TEST(slotmap, initialized_empty) {
  slot_map<unsigned> map;

  ASSERT_EQ(map.begin(), map.end());
}

TEST(slotmap, linear_insert) {
  slot_map<unsigned> map;

  map.insert(1);
  map.insert(2);
  map.insert(3);

  auto it = map.begin();
  ASSERT_EQ(*it++, 1);
  ASSERT_EQ(*it++, 2);
  ASSERT_EQ(*it++, 3);
}

TEST(slotmap, insert_remove) {
  slot_map<unsigned> map;

  auto key1 = map.insert(1);
  auto key2 = map.insert(2);
  auto key3 = map.insert(3);

  ASSERT_NE(map.find(key1), map.end());
  ASSERT_NE(map.find(key2), map.end());
  ASSERT_NE(map.find(key3), map.end());

  map.remove(key1);

  ASSERT_EQ(map.find(key1), map.end());

  auto key4 = map.insert(4);
  ASSERT_EQ(map.find(key1), map.end());
  ASSERT_NE(map.find(key4), map.end());
}

TEST(slotmap, invalid_access) {
  slot_map<unsigned> map;

  auto key1 = map.insert(1);

  ASSERT_EQ(map.at(key1), 1);

  map.remove(key1);

  ASSERT_THROW(map.at(key1), std::out_of_range);

  auto key2 = map.insert(2);
  ASSERT_EQ(map.at(key2), 2);
  ASSERT_THROW(map.at(key1), std::out_of_range);
}

TEST(slotmap, removed_key) {
  slot_map<unsigned> map;

  auto key1 = map.insert(1);
  auto value = map.remove(key1);

  ASSERT_TRUE(value.has_value());
  ASSERT_EQ(*value, 1);
}

TEST(slotmap, iterate) {
  slot_map<unsigned> map;

  map.insert(1);

  bool success = false;
  for (auto val : map) {
    success = true;
    ASSERT_EQ(val, 1);
  }

  ASSERT_TRUE(success);
}

TEST(slotmap, const_iterate) {
  slot_map<unsigned> _map;
  _map.insert(1);

  const auto& map = _map;

  bool success = false;
  for (auto val : map) {
    success = true;
    ASSERT_EQ(val, 1);
  }

  ASSERT_TRUE(success);
}
