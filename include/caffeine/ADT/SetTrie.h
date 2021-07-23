#pragma once

#include "caffeine/ADT/SparseVector.h"
#include "caffeine/Support/Assert.h"
#include <initializer_list>
#include <llvm/ADT/ArrayRef.h>
#include <tsl/hopscotch_map.h>

namespace caffeine {

/**
 * Efficient container for performing superset checks against a large number of
 * possible sets.
 *
 * This container has two main operations:
 * - insert: Insert a set into the data structure.
 * - contains_subset: Returns whether the query set is a superset of the
 *           passed-in range.
 *
 * In all cases, the range must be consistently sorted for this data structure
 * to work. If it is not, then valid supersets will not be found.
 *
 * This data structure is (rather) loosely based off the one described in "Index
 * Data Structure for Fast Subset and Superset Queries" by Iztok Savnik.
 */
template <typename T>
class SetTrie {
private:
  struct Node {
    tsl::hopscotch_map<T, size_t> next;
  };

  static constexpr size_t endpoint = SIZE_MAX;

  SparseVector<Node> nodes;

public:
  SetTrie() = default;

  bool empty() const noexcept {
    return nodes.empty() || nodes[0].next.empty();
  }

  void clear() {
    nodes.clear();
  }

  // Efficiently check whether this trie contains a subset of the values in
  // query.
  //
  // The passed-in range must be consistently sorted with all the ranges
  // inserted into this set-trie.
  template <typename It>
  bool contains_subset(It begin, It end) const {
    if (empty())
      return false;

    return follow_subset(0, begin, end);
  }
  template <typename C>
  bool contains_subset(const C& set) const {
    using std::begin;
    using std::end;

    return contains_subset(begin(set), end(set));
  }
  bool contains_subset(std::initializer_list<T> set) {
    return contains_subset(set.begin(), set.end());
  }

  // Insert a new subset into this set-trie.
  //
  // The passed-in range must be consistently sorted with all the ranges
  // inserted into this set-trie.
  template <typename It>
  void insert(It begin, It end) {
    if (contains_subset(begin, end))
      return;

    if (nodes.empty()) {
      nodes.clear();
      nodes.emplace_back();
    }

    insert_at(0, begin, end);
  }
  template <typename C>
  void insert(const C& set) {
    using std::begin;
    using std::end;

    insert(begin(set), end(set));
  }
  void insert(std::initializer_list<T> set) {
    insert(set.begin(), set.end());
  }

private:
  template <typename It>
  bool follow_subset(std::size_t index, It begin, It end) const {
    if (index == endpoint)
      return true;

    const Node& node = nodes[index];

    for (It qit = begin; qit != end; ++qit) {
      auto it = node.next.find(*qit);
      if (it == node.next.end())
        continue;

      if (follow_subset(it->second, std::next(qit), end))
        return true;
    }

    return false;
  }

  template <typename It>
  size_t insert_new(It begin, It end) {
    if (begin == end)
      return endpoint;

    size_t index = nodes.emplace();
    size_t inserted = insert_new(std::next(begin), end);
    nodes[index].next.emplace(*begin, inserted);

    return index;
  }

  template <typename It>
  void insert_at(size_t index, It begin, It end) {
    CAFFEINE_ASSERT(begin != end);

    It next = std::next(begin);

    Node& node = nodes[index];
    auto it = node.next.find(*begin);
    if (it == node.next.end()) {
      size_t inserted = insert_new(next, end);
      nodes[index].next.emplace(*begin, inserted);
      return;
    }

    // This set is a subset of another set already contained within this trie.
    // Delete the remaining nodes as any other query that matches the larger set
    // will also match the smaller one.
    if (next == end) {
      remove_node(it->second);
      it.value() = endpoint;
      return;
    }

    CAFFEINE_ASSERT(it->second != endpoint);
    insert_at(it->second, next, end);
  }

  void remove_node(size_t index) {
    if (index == endpoint)
      return;

    for (auto& [value, nodeidx] : nodes[index].next) {
      if (nodeidx != endpoint)
        remove_node(nodeidx);
    }
  }
};

} // namespace caffeine
