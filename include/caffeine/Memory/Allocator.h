#pragma once

#include "caffeine/ADT/SparseVector.h"
#include <immer/box.hpp>
#include <immer/flex_vector.hpp>
#include <immer/map.hpp>
#include <llvm/ADT/APInt.h>
#include <memory>
#include <optional>
#include <variant>

namespace caffeine {

class BuddyAllocator {
private:
  enum { Inner, Leaf };
  static const unsigned MIN_SIZE_LOG2 = 4;

  struct hasher {
    size_t operator()(const llvm::APInt& v) const {
      return (size_t)llvm::hash_value(v);
    }
  };

  struct SplitNode {
    size_t left;
    size_t right;
  };

  struct LeafNode {
    llvm::APInt offset;
    unsigned size;

    std::pair<LeafNode, LeafNode> split() const;
  };

  struct NodeRef {
    unsigned size;
    size_t index;
  };

  struct Node {
    size_t parent;
    std::variant<SplitNode, LeafNode> data;

    Node(size_t parent, SplitNode split)
        : parent(parent), data(std::in_place_index<Inner>, std::move(split)) {}
    Node(size_t parent, LeafNode leaf)
        : parent(parent), data(std::in_place_index<Leaf>, std::move(leaf)) {}

    const LeafNode& leaf() const {
      return std::get<Leaf>(data);
    }
  };

  immer::flex_vector<NodeRef> freelist;
  immer::map<llvm::APInt, size_t, hasher> allocated;
  immer::box<SparseVector<Node>> nodes;

  llvm::APInt base;
  llvm::APInt size;

public:
  BuddyAllocator(llvm::APInt base, llvm::APInt size);

  std::optional<llvm::APInt> allocate(const llvm::APInt& size,
                                      const llvm::APInt& align);
  void deallocate(const llvm::APInt& addr);

private:
  bool is_mergeable(const Node& index);
};

} // namespace caffeine
