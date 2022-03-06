#include "caffeine/Memory/MemHeap.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/EGraph.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Model/Value.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <algorithm>
#include <llvm/ADT/SmallVector.h>

namespace caffeine {

/***************************************************
 * Pointer                                         *
 ***************************************************/

OpRef Pointer::value(const MemHeap& heap) const {
  if (!is_resolved())
    return offset();

  CAFFEINE_UASSERT(heap.index() == this->heap(),
                   "Attempted to get value of a pointer using the wrong heap");
  return BinaryOp::CreateAdd(heap[alloc()].address(), offset());
}
OpRef Pointer::value(const MemHeapMgr& heapmgr) const {
  if (!is_resolved())
    return offset();

  return value(heapmgr[heap()]);
}

/***************************************************
 * MemHeap                                         *
 ***************************************************/

MemHeap::MemHeap(unsigned index, bool concrete) : index_(index) {
  if (concrete)
    allocator_.emplace<Uninit>();
}

unsigned MemHeap::index() const {
  return index_;
}

Allocation& MemHeap::operator[](const AllocId& alloc) {
  return allocs_.at(alloc);
}
const Allocation& MemHeap::operator[](const AllocId& alloc) const {
  return allocs_.at(alloc);
}

AllocId MemHeap::allocate(const OpRef& size, const OpRef& alignment,
                          const OpRef& data, AllocationKind kind,
                          AllocationPermissions permissions, Context& ctx) {
  CAFFEINE_ASSERT(size->type() == alignment->type());
  CAFFEINE_ASSERT(size->type().is_int());
  CAFFEINE_ASSERT(!data->type().is_array() ||
                  data->type().bitwidth() == size->type().bitwidth());

  auto addr = alloc_addr(size, alignment, ctx);
  auto newalloc = Allocation(addr, size, data, kind, permissions);

  // Ensure that the allocation is properly aligned
  auto is_aligned = ICmpOp::CreateICmpEQ(
      BinaryOp::CreateURem(newalloc.address(), alignment), 0);
  auto align_is_zero = ICmpOp::CreateICmpEQ(alignment, 0);
  ctx.add(BinaryOp::CreateOr(is_aligned, align_is_zero));
  // The allocation can never wrap around the address space
  ctx.add(ICmpOp::CreateICmpULE(newalloc.address(),
                                BinaryOp::CreateAdd(newalloc.address(), size)));
  // The allocation is not null
  ctx.add(ICmpOp::CreateICmpNE(newalloc.address(), 0));

  for (const auto& alloc : allocs_) {
    /**
     * Ensure that the new allocation doesn't overlap with any of the existing
     * allocations.
     *
     * To explain a bit what's being done here. We know that the ranges don't
     * overlap if one of them starts after the other one ends. If we express the
     * ranges as [a, b) and [c, d) then we have
     *    no_overlap = b <= c || d <= a
     * Note that this requires that ranges don't wrapt around the address space
     * but we're already asserting that so we should be good.
     */

    auto new_start = newalloc.address();
    auto old_start = alloc.address();

    auto new_end = BinaryOp::CreateAdd(newalloc.address(), newalloc.size());
    auto old_end = BinaryOp::CreateAdd(alloc.address(), alloc.size());

    auto cmp1 = ICmpOp::CreateICmpULE(old_end, new_start);
    auto cmp2 = ICmpOp::CreateICmpULE(new_end, old_start);

    ctx.add(Assertion(BinaryOp::CreateOr(cmp1, cmp2)));
  }

  return allocs_.insert(newalloc);
}

void MemHeap::deallocate(const AllocId& alloc) {
  auto value = allocs_.remove(alloc);

  // Note: This likely means that we're trying to deallocate an allocation that
  //       was created in an unrelated context.
  CAFFEINE_ASSERT(value.has_value(),
                  "tried to deallocate a nonexistant allocation");

  if (allocator_.index() == Init) {
    std::get<Init>(allocator_)
        .deallocate(llvm::cast<ConstantInt>(*value->address()).value());
  } else {
    allocator_.emplace<Symbolic>();
  }
}

bool MemHeap::check_live(const AllocId& alloc) const {
  return allocs_.find(alloc) != allocs_.end();
}

Assertion MemHeap::check_valid(const Pointer& ptr, uint32_t width) {
  return check_valid(ptr, ConstantInt::Create(llvm::APInt(
                              ptr.offset()->type().bitwidth(), width)));
}
Assertion MemHeap::check_valid(const Pointer& ptr, const OpRef& width) {
  /**
   * Implementation note: When checking that the end of the read is within the
   * allocation we check ptr < alloc + (size - width) instead of checking ptr +
   * width < alloc + size since it gives better opportunities for constant
   * folding.
   */

  if (ptr.is_resolved()) {
    if (!check_live(ptr.alloc()))
      return ConstantInt::Create(false);

    return ICmpOp::CreateICmpULE(
        ptr.offset(), BinaryOp::CreateSub((*this)[ptr.alloc()].size(), width));
  }

  auto result = ConstantInt::Create(false);
  auto value = ptr.value(*this);

  for (const auto& alloc : allocs_) {
    auto end = BinaryOp::CreateAdd(alloc.address(),
                                   BinaryOp::CreateSub(alloc.size(), width));
    auto cmp1 = ICmpOp::CreateICmpULE(alloc.address(), value);
    auto cmp2 = ICmpOp::CreateICmpULE(value, end);

    // result |= (address <= value) && (value < address + size)
    result = BinaryOp::CreateOr(result, BinaryOp::CreateAnd(cmp1, cmp2));
  }

  // Note: NULL pointers are never valid.
  return BinaryOp::CreateAnd(ICmpOp::CreateICmpNE(value, 0), result);
}

Assertion MemHeap::check_starts_allocation(const Pointer& ptr) {
  if (ptr.is_resolved()) {
    if (!check_live(ptr.alloc()))
      return ConstantInt::Create(false);

    return ICmpOp::CreateICmpEQ(ptr.offset(), 0);
  }

  auto result = ConstantInt::Create(false);
  auto value = ptr.value(*this);

  for (const auto& alloc : allocs_) {
    result = BinaryOp::CreateOr(result,
                                ICmpOp::CreateICmpEQ(value, alloc.address()));
  }

  // Note: NULL pointers are never valid.
  return BinaryOp::CreateAnd(ICmpOp::CreateICmpNE(value, 0), result);
}

llvm::SmallVector<Pointer, 1> MemHeap::resolve(std::shared_ptr<Solver> solver,
                                               const Pointer& ptr,
                                               Context& ctx) const {
  llvm::SmallVector<Pointer, 1> results;

  if (ptr.is_resolved()) {
    CAFFEINE_UASSERT(ptr.heap() == index_,
                     "Attempted to resolve a pointer using the wrong heap");
    if (!check_live(ptr.alloc()))
      return results;

    const Allocation& alloc = (*this)[ptr.alloc()];
    if (ctx.check(solver, alloc.check_inbounds(ptr.offset(), 0)) ==
        SolverResult::UNSAT)
      return results;

    results.push_back(ptr);
    return results;
  }

  auto value = ptr.value(*this);

  auto end = allocs_.end();
  for (auto it = allocs_.begin(); it != end; ++it) {
    const auto& alloc = *it;

    auto end = BinaryOp::CreateAdd(alloc.address(), alloc.size());
    auto cmp1 = ICmpOp::CreateICmpULE(alloc.address(), value);
    auto cmp2 = ICmpOp::CreateICmpULT(value, end);
    auto assertion = BinaryOp::CreateAnd(cmp1, cmp2);

    if (ctx.check(solver, Assertion(assertion)) != SolverResult::UNSAT) {
      results.push_back(Pointer(
          it.key(), BinaryOp::CreateSub(value, alloc.address()), ptr.heap()));
    }
  }

  return results;
}
OpRef MemHeap::alloc_addr(const OpRef& size_, const OpRef& align_,
                          Context& ctx) {
  if (allocator_.index() != Symbolic) {
    ctx.egraph.rebuild();
    EGraphExtractor extractor{&ctx.egraph};
    OpRef size = extractor.extract(*size_);
    OpRef align = extractor.extract(*align_);

    if (!llvm::isa<ConstantInt>(*size) || !llvm::isa<ConstantInt>(*align)) {
      allocator_.emplace<Symbolic>();
      goto symbolic;
    }

    if (allocator_.index() == Uninit) {
      unsigned bitwidth = size->type().bitwidth();
      allocator_.emplace<Init>(llvm::APInt::getSignedMinValue(bitwidth),
                               llvm::APInt::getSignedMinValue(bitwidth));
    }

    auto addr = std::get<Init>(allocator_)
                    .allocate(llvm::cast<ConstantInt>(*size).value(),
                              llvm::cast<ConstantInt>(*align).value());
    if (addr)
      return ConstantInt::Create(std::move(*addr));
    allocator_.emplace<Symbolic>();
  }

symbolic:
  return Constant::Create(size_->type(), ctx.next_constant());
}

/***************************************************
 * MemHeapMgr                                      *
 ***************************************************/

MemHeapMgr::MemHeapMgr(bool concrete_heap)
    : heaps_are_concrete_(concrete_heap) {}

void MemHeapMgr::set_concrete(bool concrete) {
  heaps_are_concrete_ = concrete;
}

MemHeap& MemHeapMgr::operator[](unsigned index) {
  auto it = heaps_.try_emplace(index, index, heaps_are_concrete_).first;
  return it->getSecond();
}
const MemHeap& MemHeapMgr::operator[](unsigned index) const {
  auto it = heaps_.find(index);
  CAFFEINE_UASSERT(it != heaps_.end(),
                   "Attempted to access an invalid heap index");
  return it->getSecond();
}

MemHeap& MemHeapMgr::function_heap() {
  return (*this)[MemHeapMgr::FUNCTION_INDEX];
}
const MemHeap& MemHeapMgr::function_heap() const {
  return (*this)[MemHeapMgr::FUNCTION_INDEX];
}

Allocation& MemHeapMgr::ptr_allocation(const Pointer& ptr) {
  CAFFEINE_ASSERT(ptr.is_resolved(),
                  "cannot get allocation for an unresolved pointer");
  return (*this)[ptr.heap()][ptr.alloc()];
}
const Allocation& MemHeapMgr::ptr_allocation(const Pointer& ptr) const {
  CAFFEINE_ASSERT(ptr.is_resolved(),
                  "cannot get allocation for an unresolved pointer");
  return (*this)[ptr.heap()][ptr.alloc()];
}

Assertion MemHeapMgr::check_valid(const Pointer& ptr, uint32_t width) {
  return check_valid(ptr, ConstantInt::Create(llvm::APInt(
                              ptr.offset()->type().bitwidth(), width)));
}
Assertion MemHeapMgr::check_valid(const Pointer& ptr, const OpRef& width) {
  return (*this)[ptr.heap()].check_valid(ptr, width);
}

Assertion MemHeapMgr::check_starts_allocation(const Pointer& value) {
  return (*this)[value.heap()].check_starts_allocation(value);
}

llvm::SmallVector<Pointer, 1>
MemHeapMgr::resolve(std::shared_ptr<Solver> solver, const Pointer& value,
                    Context& ctx) const {
  return (*this)[value.heap()].resolve(std::move(solver), value, ctx);
}

} // namespace caffeine
