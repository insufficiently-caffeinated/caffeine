#ifndef CAFFEINE_MEMORY_MEMHEAP_H
#define CAFFEINE_MEMORY_MEMHEAP_H

#include "caffeine/ADT/SlotMap.h"
#include "caffeine/IR/Operation.h"

#include <llvm/ADT/APInt.h>
#include <llvm/IR/DataLayout.h>

#include <vector>

namespace caffeine {

class Context;
class ContextValue;
class Assertion;
class MemHeap;

/**
 * An allocation category.
 *
 * This is used to verify that, when a deallocation is being done, that the
 * allocation was allocated by a compatible function. As an example, free
 * cannot be used to deallocate an allocation created by alloca.
 */
enum class AllocationKind { Alloca, Malloc, Global };

/**
 * A memory allocation (either alive or dead).
 *
 * In general, an allocation is a tuple (address, size, data, dead) where
 * - address is the pointer to the start of the allocation.
 * - size is the size in bytes of the allocation.
 * - data is an array containing the bytes of the allocation.
 * - dead indicates whether this allocation has been freed.
 *
 * Any of address, size, or data may be either concrete, symbolic, or, for data,
 * some combination of the two. With the current design, dead will never be
 * symbolic.
 *
 * See the docs for MemHeap for the invariants that are asserted for a new
 * allocation and the procedure that is used for resolving a pointer to an
 * allocation.
 */
class Allocation {
private:
  OpRef address_;
  OpRef size_;
  OpRef data_;

  AllocationKind kind_;

public:
  Allocation(const OpRef& address, const OpRef& size,
             const OpRef& data, AllocationKind kind);
  Allocation(const OpRef& address, const ConstantInt& size,
             const OpRef& data, AllocationKind kind);

  const OpRef& size() const;
  OpRef& size();

  AllocationKind kind() const;

  const OpRef& data() const;
  OpRef& data();

  const OpRef& address() const;
  OpRef& address();

  bool is_constant_size() const;

  /**
   * Update the internal data array of this allocation.
   */
  void overwrite(const OpRef& newdata);
  void overwrite(OpRef&& newdata);

  /**
   * Assert that a read from this allocation at the given offset and with the
   * given width would be a valid inbounds read.
   */
  Assertion check_inbounds(const OpRef& offset, uint32_t width) const;
  Assertion check_inbounds(const OpRef& offset,
                           const OpRef& width) const;

  /**
   * Read the specified type from the allocation at the given offset.
   *
   * Does not assert that the read is inbounds. Callers of this method should
   * check the assertion first.
   */
  OpRef read(const OpRef& offset, const Type& t,
                      const llvm::DataLayout& layout) const;
  ContextValue read(const OpRef& offset, llvm::Type* type,
                    const llvm::DataLayout& layout);

  /**
   * Write the value to the array at the given offset.
   *
   * Does not assert that the write is inbounds. Callers of this method should
   * add the assertion first.
   */
  void write(const OpRef& offset, const OpRef& value,
             const llvm::DataLayout& layout);
  void write(const OpRef& offset, llvm::Type* type,
             const ContextValue& value, const MemHeap& heap,
             const llvm::DataLayout& layout);
};

using AllocId = typename slot_map<Allocation>::key_type;

/**
 * A pointer (either raw or to an allocation).
 *
 * Pointers have two possible representations:
 * - An absolute pointer value. This is not known to be associated with any
 *   allocation and so before it can be dereferenced it will have to be
 *   re-associated with some allocation.
 * - An allocation + an offset within that allocation. This is a pointer that is
 *   known to be relative to an existing allocation.
 *
 * To go from the allocation + offset representation just call value(). This is
 * cheap and quick to do. To go the other way it is necessary to call
 * MemHeap::resolve. This is usually quite expensive so, where semantics permit,
 * pointers should be kept as an allocation + offset pair as much as possible.
 *
 * # Working with Pointers
 * The main rule to keep in mind is this: unless you know that the semantics
 * disallow crossing between allocations (e.g. LLVM's GetElementPtr) then always
 * use value() to get the absolute pointer and work with that. This will prevent
 * situations where the code does something like this
 *
 * ```
 * char* a = <allocation>;
 * char* b = <allocation>;
 * ptrdiff_t x = a - b;
 * char v = *(a + x);
 * ```
 *
 * being detected as an out-of-bounds pointer even though this is perfectly
 * valid code.
 */
class Pointer {
private:
  AllocId alloc_;
  OpRef offset_;

public:
  explicit Pointer(const OpRef& value);
  Pointer(const AllocId& alloc, const OpRef& offset);

  AllocId alloc() const;
  const OpRef& offset() const;

  /**
   * The absolute value of this pointer.
   *
   * Pointers can be stored either as an absolute value or as an allocation +
   * offset pair. This method normalizes it to just the absolute value. Use
   * MemHeap::resolve to go the other way.
   */
  OpRef value(const MemHeap& heap) const;

  /**
   * Whether this pointer has been resolved to a specific allocation.
   *
   * If not, then this is a pointer to an absolute address. Use MemHeap::resolve
   * to convert it to a set of allocation pointers.
   */
  bool is_resolved() const;

  /**
   * Get an assertion to check if this pointer is a null pointer.
   */
  Assertion check_null(const MemHeap& heap) const;
};

class MemHeap {
private:
  slot_map<Allocation> allocs_;

public:
  MemHeap() = default;

  Allocation& operator[](const AllocId& alloc);
  const Allocation& operator[](const AllocId& alloc) const;

  /**
   * Creates a new allocation that has a distinct address from all currently
   * live allocations.
   *
   * This will add the corresponding assertions to the context as well.
   */
  AllocId allocate(const OpRef& size, const OpRef& alignment,
                   const OpRef& data, AllocationKind kind,
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
  Assertion check_valid(const Pointer& value, const OpRef& offset);

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
  llvm::SmallVector<Pointer, 1> resolve(const Pointer& value,
                                        Context& ctx) const;
};

} // namespace caffeine

#include "MemHeap.inl"

#endif
