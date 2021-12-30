#ifndef CAFFEINE_MEMORY_MEMHEAP_INL
#define CAFFEINE_MEMORY_MEMHEAP_INL

#include "caffeine/Memory/MemHeap.h"

#include <climits>

namespace caffeine {

/***************************************************
 * Allocation                                      *
 ***************************************************/

inline const OpRef& Allocation::size() const {
  return size_;
}
inline OpRef& Allocation::size() {
  return size_;
}

inline const OpRef& Allocation::data() const {
  return data_;
}
inline OpRef& Allocation::data() {
  return data_;
}

inline const OpRef& Allocation::address() const {
  return address_;
}
inline OpRef& Allocation::address() {
  return address_;
}

inline AllocationKind Allocation::kind() const {
  return kind_;
}

inline AllocationPermissions Allocation::permissions() const {
  return perms_;
}

inline void Allocation::permissions(AllocationPermissions p) {
  perms_ = p;
}

/***************************************************
 * Pointer                                         *
 ***************************************************/

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

/***************************************************
 * AllocationPermissions                           *
 ***************************************************/

inline bool operator!(AllocationPermissions perm) {
  return perm == AllocationPermissions::None;
}

inline AllocationPermissions operator&(AllocationPermissions lhs,
                                       AllocationPermissions rhs) {
  return static_cast<AllocationPermissions>(static_cast<uint>(lhs) &
                                            static_cast<uint>(rhs));
}

} // namespace caffeine

#endif
