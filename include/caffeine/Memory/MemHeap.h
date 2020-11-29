#ifndef CAFFEINE_MEMORY_MEMHEAP_H
#define CAFFEINE_MEMORY_MEMHEAP_H

#include "caffeine/IR/Operation.h"

#include <llvm/ADT/APInt.h>
#include <llvm/IR/DataLayout.h>

#include <vector>

namespace caffeine {

class Context;
class Assertion;

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
  ref<Operation> address_;
  ref<Operation> size_;
  ref<Operation> data_;

  mutable uint32_t refcount = 0;
  bool dead_;

  template <typename T, typename Deleter>
  friend class ref;

public:
  Allocation(const ref<Operation>& address, const ref<Operation>& size,
             const ref<Operation>& data, bool dead = false);
  Allocation(const ref<Operation>& address, const ConstantInt& size,
             const ref<Operation>& data, bool dead = false);

  const ref<Operation>& size() const;
  ref<Operation>& size();

  const ref<Operation>& data() const;
  ref<Operation>& data();

  const ref<Operation>& address() const;
  ref<Operation>& address();

  bool dead() const;
  bool& dead();

  bool is_constant_size() const;

  /**
   * Update the internal data array of this allocation.
   */
  void overwrite(const ref<Operation>& newdata);
  void overwrite(ref<Operation>&& newdata);

  /**
   * Assert that a read from this allocation at the given offset and with the
   * given width would be a valid inbounds read.
   */
  Assertion check_inbounds(const ref<Operation>& offset, uint32_t width) const;

  /**
   * Read the specified type from the allocation at the given offset.
   *
   * Does not assert that the read is inbounds. Callers of this method should
   * check the assertion first.
   */
  ref<Operation> read(const ref<Operation>& offset, const Type& t,
                      const llvm::DataLayout& layout) const;
  /**
   * Write the value to the array at the given offset.
   *
   * Does not assert that the write is inbounds. Callers of this method should
   * add the assertion first.
   */
  void write(const ref<Operation>& offset, const ref<Operation>& value,
             const llvm::DataLayout& layout);
};

} // namespace caffeine

#endif
