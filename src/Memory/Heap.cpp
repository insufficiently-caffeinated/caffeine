
#include "caffeine/Memory/Heap.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Interpreter/InterpreterContext.h"

namespace caffeine {

Heap::Heap(unsigned index) : Heap(index, nullptr) {}
Heap::Heap(unsigned index, std::unique_ptr<ConcreteAllocator>&& alloc)
    : concrete_(std::move(alloc)), index_(index) {}

unsigned Heap::index() const {
  return index_;
}

Allocation& Heap::operator[](const AllocId& alloc) {
  return allocs_.at(alloc);
}
const Allocation& Heap::operator[](const AllocId& alloc) const {
  return allocs_.at(alloc);
}

std::optional<OpRef> Heap::try_concrete_allocate(const OpRef& size_,
                                                 const OpRef& align_) {
  if (!concrete_)
    return std::nullopt;

  auto size = llvm::dyn_cast<ConstantInt>(size_.get());
  auto align = llvm::dyn_cast<ConstantInt>(align_.get());

  if (!size || !align)
    return std::nullopt;

  auto addr = concrete_->allocate(size->value(), align->value());
  if (addr)
    return ConstantInt::Create(std::move(*addr));
  return std::nullopt;
}

AllocId Heap::allocate(const OpRef& size, const OpRef& alignment,
                       const OpRef& data, AllocationKind kind,
                       AllocationPermissions permissions,
                       InterpreterContext& ctx) {
  CAFFEINE_ASSERT(size->type() == alignment->type());
  CAFFEINE_ASSERT(size->type().is_int());

  if (data->type().is_array())
    CAFFEINE_ASSERT(data->type().bitwidth() == size->type().bitwidth());

  auto address = try_concrete_allocate(size, alignment);
  if (!address.has_value()) {
    concrete_ = nullptr;
    address = Constant::Create(size->type(), ctx.context().next_constant());
  }

  auto newalloc = Allocation(*address, size, data, kind, permissions);

  // Ensure that the allocation is properly aligned
  auto is_aligned =
      ctx.createICmpEQ(ctx.createURem(newalloc.address(), alignment), 0);
  auto align_is_zero = ctx.createICmpEQ(alignment, 0);
  ctx.add_assertion(ctx.createOr(is_aligned, align_is_zero));
  // The allocation can never wrap around the address space
  ctx.add_assertion(ctx.createICmpULE(newalloc.address(),
                                      ctx.createAdd(newalloc.address(), size)));
  // The allocation is not null
  ctx.add_assertion(ctx.createICmpNE(newalloc.address(), 0));

  // If we're still using the concrete allocator then we can assume that the new
  // allocation doesn't overlap with any other allocations.
  if (concrete_)
    return allocs_.insert(newalloc);

  for (const Allocation& alloc : allocs_) {
    /**
     * Ensure that the new allocation doesn't overlap with any of the existing
     * allocations.
     *
     * To explain a bit what's being done here. We know that the ranges don't
     * overlap if one of them starts after the other one ends. If we express the
     * ranges as [a, b) and [c, d) then we have
     *    no_overlap = b <= c || d <= a
     * Note that this requires that ranges don't wrap around the address space
     * but we're already asserting that so we should be good.
     */

    auto new_start = newalloc.address();
    auto old_start = alloc.address();

    auto new_end = ctx.createAdd(newalloc.address(), newalloc.size());
    auto old_end = ctx.createAdd(alloc.address(), alloc.size());

    auto cmp1 = ctx.createICmpULE(old_end, new_start);
    auto cmp2 = ctx.createICmpULE(new_end, old_start);

    ctx.add_assertion(Assertion(ctx.createOr(cmp1, cmp2)));
  }

  return allocs_.insert(newalloc);
}

void Heap::deallocate(const AllocId& alloc) {
  auto value = allocs_.remove(alloc);

  // Note: This likely means that we're trying to deallocate an allocation that
  //       was created in an unrelated context.
  CAFFEINE_ASSERT(value.has_value(),
                  "tried to deallocate a nonexistant allocation");

  if (concrete_) {
    concrete_->deallocate(
        llvm::cast<ConstantInt>(value->address().get())->value());
  }
}

bool Heap::contains(const AllocId& alloc) const {
  return allocs_.find(alloc) != allocs_.end();
}

OpRef Heap::ptr_value(const Pointer& ptr) const {
  if (ptr.is_resolved())
    return BinaryOp::CreateAdd(allocs_.at(ptr.alloc()).address(), ptr.offset());
  return ptr.offset();
}

Assertion Heap::ptr_is_valid(const Pointer& ptr, const OpRef& width) const {
  /**
   * Implementation note: When checking that the end of the read is within the
   * allocation we check ptr < alloc + (size - width) instead of checking ptr +
   * width < alloc + size since it gives better opportunities for constant
   * folding.
   */

  CAFFEINE_ASSERT(ptr.heap() == index_);

  if (ptr.is_resolved()) {
    auto it = allocs_.find(ptr.alloc());
    if (it == allocs_.end())
      return ConstantInt::Create(false);

    return ICmpOp::CreateICmpULE(ptr.offset(),
                                 BinaryOp::CreateSub(it->size(), width));
  }

  auto result = ConstantInt::Create(false);
  auto value = ptr.offset();

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

Assertion Heap::ptr_starts_allocation(const Pointer& ptr) const {
  CAFFEINE_ASSERT(ptr.heap() == index_);

  if (ptr.is_resolved()) {
    auto it = allocs_.find(ptr.alloc());
    if (it == allocs_.end())
      return ConstantInt::Create(false);

    return ICmpOp::CreateICmpEQ(ptr.offset(), 0);
  }

  auto result = ConstantInt::Create(false);
  for (const auto& alloc : allocs_) {
    result = BinaryOp::CreateOr(
        result, ICmpOp::CreateICmpEQ(alloc.address(), ptr.offset()));
  }

  return result;
}

llvm::SmallVector<Pointer, 1> Heap::resolve(const Pointer& ptr,
                                            InterpreterContext& ctx) const {
  CAFFEINE_ASSERT(ptr.heap() == index(),
                  "Attempted to resolve a pointer using the wrong heap");

  if (ptr.is_resolved()) {
    if (!contains(ptr.alloc()))
      return {};

    const Allocation& alloc = allocs_.at(ptr.alloc());
    if (ctx.check(alloc.check_inbounds(ptr.offset(), 0)) == SolverResult::UNSAT)
      return {};

    return {ptr};
  }

  llvm::SmallVector<Pointer, 1> results;
  auto value = ptr.offset();

  auto end = allocs_.end();
  for (auto it = allocs_.begin(); it != end; ++it) {
    const auto& alloc = *it;

    auto end = ctx.createAdd(alloc.address(), alloc.size());
    auto cmp1 = ctx.createICmpULE(alloc.address(), value);
    auto cmp2 = ctx.createICmpULT(value, end);
    auto assertion = ctx.createAnd(cmp1, cmp2);

    if (ctx.check(assertion) != SolverResult::UNSAT) {
      results.push_back(
          Pointer(it.key(), ctx.createSub(value, alloc.address()), ptr.heap()));
    }
  }

  return results;
}

MultiHeap::MultiHeap() {}
MultiHeap::MultiHeap(AllocFactory factory) : factory_(factory) {}

Pointer MultiHeap::allocate(const OpRef& size, const OpRef& alignment,
                            const OpRef& data, AllocationKind kind,
                            AllocationPermissions permissions,
                            unsigned int heap, InterpreterContext& ctx) {
  auto it = heaps_.find(heap);
  if (it == heaps_.end()) {
    auto concrete = factory_ ? (*factory_)(size->type().bitwidth()) : nullptr;
    it = heaps_.emplace(heap, Heap(heap, std::move(concrete))).first;
  }

  auto alloc =
      it.value().allocate(size, alignment, data, kind, permissions, ctx);
  return Pointer(alloc, ConstantInt::CreateZero(size->type().bitwidth()), heap);
}

void MultiHeap::deallocate(const Pointer& ptr, InterpreterContext& ctx) {
  CAFFEINE_ASSERT(ptr.is_resolved());
  return deallocate(ptr.alloc(), ptr.heap(), ctx);
}

void MultiHeap::deallocate(AllocId alloc, unsigned heap,
                           InterpreterContext& ctx) {
  auto it = heaps_.find(heap);
  if (it == heaps_.end() || !it->second.contains(alloc)) {
    ctx.assert_or_fail(ConstantInt::Create(false), "invalid deallocation");
  } else {
    it.value().deallocate(alloc);
  }
}

const Allocation& MultiHeap::ptr_allocation(const Pointer& ptr) const {
  CAFFEINE_ASSERT(ptr.is_resolved());

  auto it = heaps_.find(ptr.heap());
  CAFFEINE_ASSERT(it != heaps_.end());

  return it->second[ptr.alloc()];
}
Allocation& MultiHeap::ptr_allocation(const Pointer& ptr) {
  return const_cast<Allocation&>(
      const_cast<const MultiHeap*>(this)->ptr_allocation(ptr));
}

Assertion MultiHeap::check_valid(const Pointer& value,
                                 const OpRef& width) const {
  auto it = heaps_.find(value.heap());
  if (it == heaps_.end())
    return ConstantInt::Create(false);

  return it->second.ptr_is_valid(value, width);
}
Assertion MultiHeap::check_valid(const Pointer& value, uint32_t width) const {
  return check_valid(value, ConstantInt::Create(llvm::APInt(
                                value.offset()->type().bitwidth(), width)));
}

Assertion MultiHeap::check_starts_allocation(const Pointer& value) const {
  auto it = heaps_.find(value.heap());
  if (it == heaps_.end())
    return ConstantInt::Create(false);

  return it->second.ptr_starts_allocation(value);
}

llvm::SmallVector<Pointer, 1>
MultiHeap::resolve(const Pointer& value, InterpreterContext& ctx) const {
  auto it = heaps_.find(value.heap());
  if (it == heaps_.end())
    return {};

  return it->second.resolve(value, ctx);
}

} // namespace caffeine
