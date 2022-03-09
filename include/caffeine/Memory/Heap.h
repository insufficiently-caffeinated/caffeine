#pragma once

#include "caffeine/ADT/ClonePointer.h"
#include "caffeine/Memory/Allocation.h"
#include "caffeine/Memory/Pointer.h"
#include <functional>
#include <tsl/hopscotch_map.h>

namespace caffeine {

class InterpreterContext;

// Interface for a concrete allocator.
class ConcreteAllocator {
public:
  ConcreteAllocator() = default;
  virtual ~ConcreteAllocator() = default;

  virtual std::unique_ptr<ConcreteAllocator> clone() const = 0;

  virtual std::optional<llvm::APInt> allocate(const llvm::APInt& size,
                                              const llvm::APInt& value) = 0;
  virtual void deallocate(const llvm::APInt& addr) = 0;
};

/**
 * State for a heap within a single address space.
 */
class Heap {
private:
  clone_ptr<ConcreteAllocator> concrete_;
  slot_map<Allocation> allocs_;
  unsigned index_;

public:
  explicit Heap(unsigned index);
  explicit Heap(unsigned index, std::unique_ptr<ConcreteAllocator>&& allocator);

  unsigned index() const;

  Allocation& operator[](const AllocId& alloc);
  const Allocation& operator[](const AllocId& alloc) const;

  /**
   * Creates a new allocation that has a distinct address from all currently
   * live allocations.
   *
   * This will add the corresponding assertions to the context as well.
   */
  AllocId allocate(const OpRef& size, const OpRef& alignment, const OpRef& data,
                   AllocationKind kind, AllocationPermissions permissions,
                   InterpreterContext& ctx);

  // Deallocate an existing allocation.
  //
  // An assertion failure will result if the allocation is not a valid one.
  void deallocate(const AllocId& alloc);

  // Check whether the provided allocation is a live allocation on this heap.
  bool contains(const AllocId& alloc) const;

  OpRef ptr_value(const Pointer& ptr) const;

  // Assert that this pointer points to a memory location within a valid
  // allocation in the heap.
  Assertion ptr_is_valid(const Pointer& ptr, const OpRef& width) const;

  // Assert that this pointer points to the start of a live allocation in this
  // heap.
  Assertion ptr_starts_allocation(const Pointer& ptr) const;

  /**
   * Resolve all the allocations that a pointer could point to.
   *
   * This returns a resolved pointer for each allocation. Although it takes a
   * non-const reference to the context instance, it makes no changes beyond
   * those that a solver call would make.
   *
   * If the pointer is already resolved, then this is a no-op and it just
   * returns the pointer.
   *
   * # Cost
   * Unless the pointer has already been resolved to an allocation, this method
   * requires a solver call for every possible allocation. Furthermore, it is
   * likely to require that the interpreter fork for every returned allocation.
   * If at all possible, it is recommended to try and avoid needing to call this
   * method when an already known allocation can be preserved across multiple
   * uses.
   */
  llvm::SmallVector<Pointer, 1> resolve(const Pointer& value,
                                        InterpreterContext& ctx) const;

private:
  std::optional<OpRef> try_concrete_allocate(const OpRef& size,
                                             const OpRef& alignment);
};

// Class for storing the state of the heap across all address spaces.
class MultiHeap {
private:
  using AllocFactory =
      std::function<std::unique_ptr<ConcreteAllocator>(unsigned bitwidth)>;

  tsl::hopscotch_map<unsigned, Heap> heaps_;
  std::optional<AllocFactory> factory_;

public:
  static constexpr unsigned FUNCTION_INDEX = UINT_MAX - 2;

public:
  explicit MultiHeap();
  explicit MultiHeap(AllocFactory factory);

  // Create a new allocation that has a distinct address from all currently live
  // allocations. In addition, it will also add corresponding assertions to the
  // context as well.
  Pointer allocate(const OpRef& size, const OpRef& alignment, const OpRef& data,
                   AllocationKind kind, AllocationPermissions permissions,
                   unsigned heap, InterpreterContext& ctx);

  // Attempt to deallocate the allocation pointed-to by ptr. If the pointer does
  // not point to the start of the allocation then the context will be marked as
  // dead and a failure will be emitted.
  //
  // An assertion failure will result if ptr is not resolved.
  void deallocate(const Pointer& ptr, InterpreterContext& ctx);
  void deallocate(AllocId alloc, unsigned heap, InterpreterContext& ctx);

  // Get the allocation that this pointer corresponds to.
  //
  // This method will cause an asssertion failure if the pointer is not
  // resolved.
  Allocation& ptr_allocation(const Pointer& ptr);
  const Allocation& ptr_allocation(const Pointer& ptr) const;

  Assertion check_valid(const Pointer& value, uint32_t width) const;
  Assertion check_valid(const Pointer& value, const OpRef& width) const;
  Assertion check_starts_allocation(const Pointer& value) const;

  llvm::SmallVector<Pointer, 1> resolve(const Pointer& value,
                                        InterpreterContext& ctx) const;
};

} // namespace caffeine
