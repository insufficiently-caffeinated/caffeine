#include "caffeine/Memory/Allocator.h"
#include "caffeine/Support/Assert.h"
#include <algorithm>
#include <immer/flex_vector_transient.hpp>
#include <llvm/ADT/Hashing.h>

namespace caffeine {

BuddyAllocator::BuddyAllocator(llvm::APInt base, llvm::APInt size)
    : base(std::move(base)), size(std::move(size)) {
  int32_t log = size.exactLogBase2();
  CAFFEINE_ASSERT(log != -1, "Heap size was not a power of 2");

  SparseVector<Node> nodes;
  size_t idx = nodes.emplace(SIZE_MAX, LeafNode{this->base, (unsigned)log});
  this->nodes = immer::box<SparseVector<Node>>(std::move(nodes));

  freelist = std::move(freelist).push_back({(unsigned)log, idx});
}

std::pair<BuddyAllocator::LeafNode, BuddyAllocator::LeafNode>
BuddyAllocator::LeafNode::split() const {
  LeafNode left = {offset, size - 1};
  LeafNode right = left;
  right.offset.setBit(left.size - 1);

  return {std::move(left), std::move(right)};
}

std::optional<llvm::APInt> BuddyAllocator::allocate(const llvm::APInt& size_,
                                                    const llvm::APInt& align) {
  CAFFEINE_ASSERT(align.isNullValue() || align.isPowerOf2(),
                  "cannot allocate with a non-power-of-2 alignment");

  // Round size up to a multiple of align
  unsigned size = std::max({size_.ceilLogBase2(), MIN_SIZE_LOG2,
                            align.isNullValue() ? 0 : align.logBase2()});

  auto it = std::lower_bound(
      freelist.begin(), freelist.end(), size,
      [](const NodeRef& a, unsigned size) { return a.size < size; });
  if (it == freelist.end())
    return std::nullopt;

  llvm::APInt address;

  nodes = std::move(nodes).update([&](SparseVector<Node> nodes) {
    Node& node = nodes[it->index];
    size_t current = it->index;
    CAFFEINE_ASSERT(node.data.index() == Leaf);

    freelist = std::move(freelist).erase(it.index());
    if (size == node.leaf().size) {
      address = node.leaf().offset;
      return nodes;
    }

    auto transient = std::move(freelist).transient();
    while (size < nodes[current].leaf().size) {
      const LeafNode& leaf = nodes[current].leaf();
      auto [left, right] = leaf.split();

      size_t right_idx = nodes.insert(Node(current, right));
      size_t left_idx = nodes.insert(Node(current, std::move(left)));

      transient.push_back({right.size, right_idx});
      nodes[current].data.emplace<Inner>(SplitNode{left_idx, right_idx});

      current = left_idx;
    }

    address = nodes[current].leaf().offset;
    freelist = std::move(transient).persistent();
    allocated = std::move(allocated).insert({address, current});

    return nodes;
  });

  return address;
}

void BuddyAllocator::deallocate(const llvm::APInt& addr) {
  auto it = allocated.find(addr);
  CAFFEINE_ASSERT(it, "attempted to deallocate an invalid address");

  size_t index = *it;
  const auto& nodes = this->nodes.get();

  // TODO: Merge buddy blocks
  allocated = std::move(allocated).erase(addr);
  freelist =
      std::move(freelist).push_back(NodeRef{nodes[index].leaf().size, index});
}

} // namespace caffeine
