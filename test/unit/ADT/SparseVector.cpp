#include "caffeine/ADT/SparseVector.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(SparseVectorTests, eraseExcludedFromIterationOrder) {
  SparseVector<uint32_t> vector{0, 1, 2, 3, 4};
  ASSERT_EQ(vector.size(), 5);
  ASSERT_EQ(vector.backing_size(), 5);

  vector.erase(1);

  ASSERT_EQ(vector.size(), 4);
  ASSERT_EQ(vector.backing_size(), 5);

  auto it = vector.begin();
  ASSERT_EQ(*it++, 0);
  ASSERT_EQ(*it++, 2);
  ASSERT_EQ(*it++, 3);
  ASSERT_EQ(*it++, 4);
}

TEST(SparseVectorTests, iteratorWithMissingFirstSlot) {
  SparseVector<uint32_t> vector{0, 1, 2, 3};
  vector.erase(0);

  auto it = vector.begin();
  ASSERT_EQ(it.index(), 1);
  ASSERT_EQ(*it, 1);
  ASSERT_EQ(vector.size(), 3);
  ASSERT_EQ(vector.backing_size(), 4);
}

TEST(SparseVectorTests, insertIntoSlot) {
  SparseVector<uint32_t> vector{0, 1, 2};
  vector.erase(1);

  ASSERT_EQ(vector.size(), 2);
  ASSERT_EQ(vector.backing_size(), 3);

  vector.insert(3);

  ASSERT_EQ(vector.size(), 3);
  ASSERT_EQ(vector.backing_size(), 3);
  ASSERT_EQ(vector[1], 3);
}

TEST(SparseVectorTests, compressWithHoles) {
  SparseVector<uint32_t> vector{0, 1, 2, 3, 4, 5};
  vector.erase(1);
  vector.erase(2);
  vector.erase(4);

  ASSERT_EQ(vector.size(), 3);
  ASSERT_EQ(vector.backing_size(), 6);

  vector.compress();

  ASSERT_EQ(vector.size(), 3);
  ASSERT_EQ(vector.backing_size(), 3);

  ASSERT_EQ(vector[0], 0);
  ASSERT_EQ(vector[1], 3);
  ASSERT_EQ(vector[2], 5);
}

TEST(SparseVectorTests, indexAtEnd) {
  SparseVector<uint32_t> vector{0, 1};
  vector.erase(0);

  ASSERT_EQ(vector[1], 1);
}

TEST(SparseVectorTests, iteratorAtEnd) {
  SparseVector<uint32_t> vector{0, 1, 2};
  vector.erase(0);
  vector.erase(1);

  ASSERT_EQ(vector.iterator_at(2).index(), 2);
}
