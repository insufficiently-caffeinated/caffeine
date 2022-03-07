#ifndef CAFFEINE_MEMORY_MEMHEAP_H
#define CAFFEINE_MEMORY_MEMHEAP_H

#include "caffeine/ADT/SlotMap.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Memory/Allocator.h"
#include "caffeine/Memory/BumpAllocator.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <climits>
#include <llvm/ADT/APInt.h>
#include <llvm/ADT/DenseMap.h>
#include <llvm/IR/DataLayout.h>
#include <vector>

#include "caffeine/Memory/Allocation.h"
#include "caffeine/Memory/Pointer.h"

namespace caffeine {

class Context;
class Assertion;
class MemHeap;
class MemHeapMgr;
class LLVMScalar;
class LLVMValue;
class Solver;

class MemHeap {
private:
  enum { Symbolic, Init, Uninit };

  slot_map<Allocation> allocs_;
  unsigned index_;
  std::variant<std::monostate, BumpAllocator, std::monostate> allocator_;

public:
  MemHeap(unsigned index, bool concrete = true);

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
                   Context& ctx);

  /**
   * Deallocate an existing allocation.
   *
   * An assertion failure will result if the allocation is not a valid one for
   * the current heap.
   */
  void deallocate(const AllocId& alloc);

  /**
   * Check whether the provided allocation is a live allocation on this heap.
   */
  bool check_live(const AllocId& alloc) const;

  /**
   * Get an assertion that checks whether the provided pointer could be a part
   * of any allocation.
   *
   * If the pointer has already been resolved to an allocation then this simply
   * checks that the offset is not greater than the size. Otherwise, it compares
   * the absolute value with those of all existant allocations and returns an
   * assertion that the pointer points within one of them.
   */
  Assertion check_valid(const Pointer& value, uint32_t width);
  Assertion check_valid(const Pointer& value, const OpRef& width);

  /**
   * Get an assertion that checks whether the provided pointer points to the
   * start of any existing allocation.
   *
   * If the pointer has already been resolved then this just checks that the
   * offset is equal to 0. Otherwise, it compares the absolute value with those
   * of all extant allocations.
   */
  Assertion check_starts_allocation(const Pointer& value);

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
  llvm::SmallVector<Pointer, 1> resolve(std::shared_ptr<Solver> solver,
                                        const Pointer& value,
                                        Context& ctx) const;

  void DebugPrint() const;

private:
  BuddyAllocator* allocator();

  OpRef alloc_addr(const OpRef& size, const OpRef& align, Context& ctx);
};

class MemHeapMgr {
private:
  llvm::SmallDenseMap<unsigned, MemHeap> heaps_;
  bool heaps_are_concrete_;

public:
  // DenseMap uses MAX and MAX - 1 internally (so they can't be inserted). Use
  // MAX - 2 here instead.
  static constexpr unsigned int FUNCTION_INDEX = UINT_MAX - 2;

public:
  MemHeapMgr(bool concrete_heap = true);

  /**
   * Configure whether future heaps will first attempt to allocate concrete
   * addresses before falling back to general symbolic allocation.
   */
  void set_concrete(bool concrete);

  /**
   * Access a heap by index. The non-const variant will automatically create new
   * heaps if they don't already exist, the const overload will cause a
   * recoverable assertion failure.
   */
  MemHeap& operator[](unsigned index);
  const MemHeap& operator[](unsigned index) const;

  /**
   * Shortcut function for accessing the function heap. This is equivalent to
   * heaps[MemHeapMgr::FUNCTION_INDEX].
   */
  MemHeap& function_heap();
  const MemHeap& function_heap() const;

  /**
   * Get the allocation that this pointer corresponds to.
   *
   * If the pointer is not resolved then this will cause an assertion failure.
   */
  Allocation& ptr_allocation(const Pointer& ptr);
  const Allocation& ptr_allocation(const Pointer& ptr) const;

  Assertion check_valid(const Pointer& value, uint32_t width);
  Assertion check_valid(const Pointer& value, const OpRef& width);
  Assertion check_starts_allocation(const Pointer& value);

  llvm::SmallVector<Pointer, 1> resolve(std::shared_ptr<Solver> solver,
                                        const Pointer& value,
                                        Context& ctx) const;
};

} // namespace caffeine

#include "MemHeap.inl"

#endif
