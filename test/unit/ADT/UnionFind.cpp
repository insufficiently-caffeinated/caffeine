#include "caffeine/ADT/UnionFind.h"
#include <gtest/gtest.h>

using namespace caffeine;

TEST(UnionFindTest, union_find) {
  UnionFind<> uf;
  std::vector<size_t> linear;

  for (size_t i = 0; i < 10; ++i) {
    linear.push_back(uf.make_set());
  }

  ASSERT_EQ(uf.parents, linear);

  // build up one set
  uf.do_union(0, 1);
  uf.do_union(0, 2);
  uf.do_union(0, 3);

  // build up another set
  uf.do_union(6, 7);
  uf.do_union(6, 8);
  uf.do_union(6, 9);

  // this should compress all paths
  for (size_t i = 0; i < 10; ++i) {
    uf.find(i);
  }
  
  std::vector<size_t> expected = {0, 0, 0, 0, 4, 5, 6, 6, 6, 6};
  ASSERT_EQ(uf.parents, expected);
}
