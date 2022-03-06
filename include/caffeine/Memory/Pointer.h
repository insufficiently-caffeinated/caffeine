#pragma once

#include "caffeine/ADT/SlotMap.h"
#include "caffeine/IR/OperationBase.h"
#include "caffeine/Memory/Allocation.h"

namespace caffeine {

class Allocation;

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
 * In addition pointers also have a heap index. This is meant to allow for
 * separate address spaces although currently it is only used to distinguish
 * functions and data.
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
  unsigned heap_;

public:
  explicit Pointer(const OpRef& value, unsigned heap);
  Pointer(const AllocId& alloc, const OpRef& offset, unsigned heap);

  AllocId alloc() const;
  const OpRef& offset() const;
  unsigned heap() const;

  /**
   * The absolute value of this pointer.
   *
   * Pointers can be stored either as an absolute value or as an allocation +
   * offset pair. This method normalizes it to just the absolute value. Use
   * MemHeap::resolve to go the other way.
   */
  OpRef value(const MemHeap& heap) const;
  OpRef value(const MemHeapMgr& heapmgr) const;

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
  Assertion check_null(const MemHeapMgr& heapmgr) const;

  bool operator==(const Pointer& p) const;
  bool operator!=(const Pointer& p) const;

  void DebugPrint() const;
};

inline AllocId Pointer::alloc() const {
  return alloc_;
}

inline const OpRef& Pointer::offset() const {
  return offset_;
}

inline bool Pointer::is_resolved() const {
  // TODO: This depends on some internal parts of slot_map which aren't really
  //       meant to be exposed. It should be fine but if slotmap ever starts
  //       using a different key type then it'll be necessary to rework this.
  return alloc_.second != SIZE_MAX;
}

} // namespace caffeine
