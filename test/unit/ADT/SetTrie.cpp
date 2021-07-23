
#include "caffeine/ADT/SetTrie.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(SetTrie, default_is_empty) {
  SetTrie<int> trie;
  ASSERT_TRUE(trie.empty());
}

TEST(SetTrie, cleared_is_empty) {
  SetTrie<int> trie;

  trie.insert({1, 2, 3});
  trie.insert({2, 3, 4});

  ASSERT_FALSE(trie.empty());
  trie.clear();
  ASSERT_TRUE(trie.empty());
}

TEST(SetTrie, basic_superset) {
  SetTrie<int> trie;

  trie.insert({1, 2, 3});

  ASSERT_TRUE(trie.contains_subset({1, 2, 3, 4}));
  ASSERT_TRUE(trie.contains_subset({1, 2, 3, 5}));
  ASSERT_TRUE(trie.contains_subset({0, 1, 2, 3}));
  ASSERT_TRUE(trie.contains_subset({1, 1, 1, 2, 2, 2, 3, 4}));

  ASSERT_FALSE(trie.contains_subset({1, 2}));
  ASSERT_FALSE(trie.contains_subset({0, 1, 2}));
  ASSERT_FALSE(trie.contains_subset({1, 2, 2, 2, 4}));
  ASSERT_FALSE(trie.contains_subset({0, 1, 3}));
  ASSERT_FALSE(trie.contains_subset({1, 2, 4}));
}

TEST(SetTrie, insert_subset) {
  SetTrie<int> trie;

  trie.insert({1, 2, 3});
  trie.insert({1, 2});

  ASSERT_TRUE(trie.contains_subset({1, 2, 4}));
  ASSERT_TRUE(trie.contains_subset({0, 1, 2}));
  ASSERT_TRUE(trie.contains_subset({1, 2, 3}));
}

TEST(SetTrie, insert_superset) {
  SetTrie<int> trie;

  trie.insert({1, 2});
  trie.insert({1, 2, 3});

  ASSERT_TRUE(trie.contains_subset({1, 2, 4}));
  ASSERT_TRUE(trie.contains_subset({0, 1, 2}));
  ASSERT_TRUE(trie.contains_subset({1, 2, 3}));
}

TEST(SetTrie, long_prefix) {
  SetTrie<int> trie;

  trie.insert({1, 2, 3, 4, 5, 6, 7, 8});
  trie.insert({1});

  ASSERT_TRUE(trie.contains_subset({1}));
}
