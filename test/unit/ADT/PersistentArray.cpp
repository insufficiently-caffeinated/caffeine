#include "caffeine/ADT/PersistentArray.h"

#include <gtest/gtest.h>

using caffeine::PersistentArray;

TEST(PersistentArray, sets_do_not_affect_original) {
  PersistentArray<uint32_t> array1 = {0, 1, 2, 3, 4, 5};
  PersistentArray<uint32_t> array2 = array1;

  array2[2] = 6;

  ASSERT_NE(array1, array2);
  ASSERT_EQ(array1[2], 2);
  ASSERT_EQ(array2[2], 6);
}

TEST(PersistentArray, reroot_on_set) {
  PersistentArray<uint32_t> array1 = {0, 1, 2, 3, 4, 5, 6, 7, 8};
  PersistentArray<uint32_t> array2 = array1;

  array2[3] = 4;

  ASSERT_TRUE(array1.is_diff());
  ASSERT_TRUE(array2.is_base());
}

TEST(PersistentArray, copy_equality) {
  PersistentArray<uint32_t> array1 = {1, 2, 3, 4};
  PersistentArray<uint32_t> array2 = array1;

  ASSERT_EQ(array1, array2);
}

TEST(PersistentArray, out_of_bounds_access) {
  PersistentArray<uint32_t> no_elems;
  PersistentArray<uint32_t> some_elems = {1, 2};

  ASSERT_THROW(no_elems[0], std::out_of_range);
  ASSERT_THROW(some_elems[2], std::out_of_range);
  ASSERT_NO_THROW(some_elems[1]);
}

TEST(PersistentArray, default_is_empty) {
  PersistentArray<uint32_t> no_elems;

  ASSERT_TRUE(no_elems.empty());
}

TEST(PersistentArray, vec_roundtrip) {
  std::vector<uint32_t> original = {0, 1, 2, 3, 4, 5};
  PersistentArray<uint32_t> array = original;

  ASSERT_EQ(array.vec(), original);

  auto vec = array.take_vec();
  ASSERT_TRUE(array.empty());
  ASSERT_EQ(vec, original);
}
