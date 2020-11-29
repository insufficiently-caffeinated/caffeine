#ifndef CAFFEINE_MEMORY_MEMHEAP_INL
#define CAFFEINE_MEMORY_MEMHEAP_INL

#include "caffeine/Memory/MemHeap.h"

namespace caffeine {

/***************************************************
 * Allocation                                      *
 ***************************************************/

const ref<Operation>& Allocation::size() const {
  return size_;
}
ref<Operation>& Allocation::size() {
  return size_;
}

const ref<Operation>& Allocation::data() const {
  return data_;
}
ref<Operation>& Allocation::data() {
  return data_;
}

const ref<Operation>& Allocation::address() const {
  return address_;
}
ref<Operation>& Allocation::address() {
  return address_;
}

bool Allocation::dead() const {
  return dead_;
}
bool& Allocation::dead() {
  return dead_;
}

} // namespace caffeine

#endif
