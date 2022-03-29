#include "caffeine/Memory/Pointer.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"

namespace caffeine {

Pointer::Pointer(const OpRef& value, unsigned heap)
    : Pointer({SIZE_MAX, SIZE_MAX}, value, heap) {
  CAFFEINE_ASSERT(value->type().is_int());
}
Pointer::Pointer(const AllocId& alloc, const OpRef& offset, unsigned heap)
    : alloc_(alloc), offset_(offset), heap_(heap) {
  CAFFEINE_ASSERT(offset->type().is_int());
}

Pointer Pointer::null(unsigned bitwidth, unsigned heap) {
  return Pointer(ConstantInt::CreateZero(bitwidth), heap);
}

unsigned Pointer::heap() const {
  return heap_;
}

Assertion Pointer::check_null(const MemHeap& heap) const {
  return ICmpOp::CreateICmpEQ(value(heap), 0);
}
Assertion Pointer::check_null(const MemHeapMgr& heapmgr) const {
  return ICmpOp::CreateICmp(ICmpOpcode::EQ, value(heapmgr), 0);
}

bool Pointer::operator==(const Pointer& p) const {
  return offset_ == p.offset_ && alloc_ == p.alloc_;
}
bool Pointer::operator!=(const Pointer& p) const {
  return !(*this == p);
}

} // namespace caffeine
