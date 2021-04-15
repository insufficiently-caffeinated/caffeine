#include "caffeine/Memory/MemHeap.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Value.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Assert.h"

#include <llvm/ADT/SmallVector.h>

#include <algorithm>

namespace caffeine {

/***************************************************
 * Allocation                                      *
 ***************************************************/

Allocation::Allocation(const OpRef& address, const OpRef& size,
                       const OpRef& data, AllocationKind kind,
                       AllocationPermissions permissions)
    : address_(address), size_(size), data_(data), kind_(kind),
      perms_(permissions) {
  CAFFEINE_ASSERT(address->type().is_int());
  CAFFEINE_ASSERT(size->type().is_int());
  CAFFEINE_ASSERT(address->type().bitwidth() == size->type().bitwidth());
}
Allocation::Allocation(const OpRef& address, const ConstantInt& size,
                       const OpRef& data, AllocationKind kind,
                       AllocationPermissions permissions)
    : Allocation(address, make_ref<Operation>(size), data, kind, permissions) {}

void Allocation::overwrite(const OpRef& newdata) {
  CAFFEINE_ASSERT(perms_ == AllocationPermissions::Write || 
                  perms_ == AllocationPermissions::ReadWrite,
                  "tried to write to unwritable allocation");
  data_ = newdata;
}
void Allocation::overwrite(OpRef&& newdata) {
  CAFFEINE_ASSERT(perms_ == AllocationPermissions::Write ||
                  perms_ == AllocationPermissions::ReadWrite,
                  "tried to write to unwritable allocation");
  data_ = std::move(newdata);
}

bool Allocation::is_constant_size() const {
  return size()->is_constant();
}

Assertion Allocation::check_inbounds(const OpRef& offset,
                                     uint32_t width) const {
  return check_inbounds(offset, ConstantInt::Create(llvm::APInt(
                                    offset->type().bitwidth(), width)));
}
Assertion Allocation::check_inbounds(const OpRef& offset,
                                     const OpRef& width) const {
  // Basic check: offset < size && offset + width < size.
  // Need to check that the entire range is within the allocation.
  // TODO: Should we check for wraparound, probably not worth it for now.

  auto lower = ICmpOp::CreateICmp(ICmpOpcode::ULT, offset, size());
  auto upper = ICmpOp::CreateICmp(ICmpOpcode::ULE,
                                  BinaryOp::CreateAdd(offset, width), size());

  return Assertion(BinaryOp::CreateAnd(std::move(upper), std::move(lower)));
}

OpRef Allocation::read(const OpRef& offset, const Type& t,
                       const llvm::DataLayout& llvm) const {
  /**
   * Reading data here is actually somewhat complex. We need to effectively
   * reconstitute the type from its component bytes after we've read them
   * out of the array.
   */

  CAFFEINE_ASSERT(!t.is_void(), "attempted to read a value of type void");
  CAFFEINE_ASSERT(!t.is_array(), "attempted to read a value of type array");

  uint32_t width = t.byte_size(llvm);
  llvm::SmallVector<OpRef, 8> bytes;
  bytes.reserve(width);

  for (uint32_t i = 0; i < width; ++i) {
    bytes.push_back(LoadOp::Create(data(), BinaryOp::CreateAdd(offset, i)));
  }

  if (width == 1)
    return std::move(bytes[0]);

  uint32_t bitwidth = width * 8;
  auto bitresult = UnaryOp::CreateZExt(Type::int_ty(bitwidth), bytes[0]);

  for (uint32_t i = 1; i < width; ++i) {
    // extended = zext(bytes[i], bitwidth) << (i * 8)
    auto extended = BinaryOp::CreateShl(
        UnaryOp::CreateZExt(Type::int_ty(bitwidth), bytes[i]), (uint64_t)i * 8);
    bitresult = BinaryOp::CreateOr(bitresult, extended);
  }

  if (t.is_int()) {
    if (t.bitwidth() != bitwidth) {
      CAFFEINE_ASSERT(t.bitwidth() < bitwidth,
                      "t.byte_size() returned invalid value");

      bitresult = UnaryOp::CreateTrunc(t, bitresult);
    }

    return bitresult;
  }

  return UnaryOp::CreateBitcast(t, bitresult);
}
LLVMValue Allocation::read(const OpRef& offset, llvm::Type* type,
                           const llvm::DataLayout& layout) {
  if (type->isPointerTy()) {
    return LLVMValue(Pointer(
        read(offset, Type::int_ty(layout.getPointerSizeInBits()), layout)));
  }

  if (type->isArrayTy()) {
    std::vector<LLVMValue> members;
    members.reserve(type->getArrayNumElements());
    llvm::Type* elem_ty = type->getArrayElementType();

    for (size_t i = 0; i < type->getArrayNumElements(); ++i) {
      OpRef newoffset =
          BinaryOp::CreateAdd(offset, i * layout.getTypeAllocSize(elem_ty));

      members.push_back(read(newoffset, elem_ty, layout));
    }

    return LLVMValue(std::move(members));
  }

  if (type->isStructTy()) {
    std::vector<LLVMValue> members;
    members.reserve(type->getStructNumElements());

    size_t elem_offset = 0;
    for (size_t i = 0; i < type->getStructNumElements(); ++i) {
      llvm::Type* elem_ty = type->getStructElementType(i);
      OpRef newoffset = BinaryOp::CreateAdd(offset, elem_offset);

      members.push_back(read(newoffset, elem_ty, layout));
      elem_offset += layout.getTypeAllocSize(elem_ty);
    }

    return LLVMValue(std::move(members));
  }

  if (type->isVectorTy()) {
    CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                    "scalable vectors are not supported yet");
    LLVMValue::OpVector members;
    members.reserve(type->getVectorNumElements());
    llvm::Type* elem_ty = type->getVectorElementType();

    for (size_t i = 0; i < type->getVectorNumElements(); ++i) {
      OpRef newoffset =
          BinaryOp::CreateAdd(offset, i * layout.getTypeAllocSize(elem_ty));

      members.push_back(read(newoffset, elem_ty, layout).scalar());
    }

    return LLVMValue(std::move(members));
  }

  return LLVMValue(read(offset, Type::from_llvm(type), layout));
}

void Allocation::write(const OpRef& offset, const OpRef& value_,
                       const llvm::DataLayout& layout) {
  /**
   * This is essentially the same process as for read but executed in reverse.
   */

  CAFFEINE_ASSERT(offset->type().is_int(),
                  "tried to write at non-integer offset");
  CAFFEINE_ASSERT(perms_ == AllocationPermissions::Write ||
                  perms_ == AllocationPermissions::ReadWrite,
                  "tried to write to unwritable allocation");

  auto value = value_;
  Type t = value->type();

  uint32_t byte_width = t.byte_size(layout);
  uint32_t bitwidth = byte_width * 8;

  if (t.is_int()) {
    if (t.bitwidth() == 8) {
      overwrite(StoreOp::Create(data(), offset, value));
      return;
    }

    if (t.bitwidth() != bitwidth)
      value = UnaryOp::CreateZExt(Type::int_ty(bitwidth), value);
  } else {
    value = UnaryOp::CreateBitcast(Type::int_ty(bitwidth), value);
  }

  for (uint32_t i = 0; i < byte_width; ++i) {
    auto byte = UnaryOp::CreateTrunc(Type::int_ty(8),
                                     BinaryOp::CreateLShr(value, i * 8));
    auto index = BinaryOp::CreateAdd(offset, i);

    overwrite(StoreOp::Create(data(), index, byte));
  }
}
void Allocation::write(const OpRef& offset, const LLVMScalar& value,
                       const MemHeap& heap, const llvm::DataLayout& layout) {
  if (value.is_pointer()) {
    write(offset, value.pointer().value(heap), layout);
  } else {
    write(offset, value.expr(), layout);
  }
}
void Allocation::write(const OpRef& offset, llvm::Type* type,
                       const LLVMValue& value, const MemHeap& heap,
                       const llvm::DataLayout& layout) {
  CAFFEINE_ASSERT(perms_ == AllocationPermissions::Write || 
                  perms_ == AllocationPermissions::ReadWrite,
                  "tried to write to unwritable allocation");
  if (value.is_vector()) {
    if (type->isVectorTy()) {
      CAFFEINE_ASSERT(value.num_elements() == type->getVectorNumElements());
      type = type->getVectorElementType();
    }

    for (size_t i = 0; i < value.num_elements(); ++i) {
      write(BinaryOp::CreateAdd(offset, i * layout.getTypeAllocSize(type)),
            value.element(i), heap, layout);
    }
  } else if (type->isArrayTy()) {
    CAFFEINE_ASSERT(value.num_members() == type->getArrayNumElements());
    llvm::Type* elem_ty = type->getArrayElementType();

    for (size_t i = 0; i < value.num_members(); ++i) {
      write(BinaryOp::CreateAdd(offset, i * layout.getTypeAllocSize(elem_ty)),
            elem_ty, value.member(i), heap, layout);
    }
  } else if (type->isStructTy()) {
    CAFFEINE_ASSERT(value.num_members() == type->getStructNumElements());
    size_t elem_offset = 0;

    for (size_t i = 0; i < value.num_members(); ++i) {
      llvm::Type* elem_ty = type->getStructElementType(i);

      write(BinaryOp::CreateAdd(offset, elem_offset), elem_ty, value.member(i),
            heap, layout);

      elem_offset += layout.getTypeAllocSize(elem_ty);
    }
  }
}

/***************************************************
 * Pointer                                         *
 ***************************************************/

Pointer::Pointer(const OpRef& value) : Pointer({SIZE_MAX, SIZE_MAX}, value) {
  CAFFEINE_ASSERT(value->type().is_int());
}
Pointer::Pointer(const AllocId& alloc, const OpRef& offset)
    : alloc_(alloc), offset_(offset) {
  CAFFEINE_ASSERT(offset->type().is_int());
}

OpRef Pointer::value(const MemHeap& heap) const {
  if (is_resolved())
    return BinaryOp::CreateAdd(heap[alloc()].address(), offset());
  return offset();
}

Assertion Pointer::check_null(const MemHeap& heap) const {
  return ICmpOp::CreateICmp(ICmpOpcode::EQ, value(heap), 0);
}

bool Pointer::operator==(const Pointer& p) const {
  return offset_ == p.offset_ && alloc_ == p.alloc_;
}
bool Pointer::operator!=(const Pointer& p) const {
  return !(*this == p);
}

/***************************************************
 * MemHeap                                         *
 ***************************************************/

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
  CAFFEINE_ASSERT(data->type().is_array());
  CAFFEINE_ASSERT(data->type().bitwidth() == size->type().bitwidth());

  auto newalloc = 
      Allocation(Constant::Create(size->type(), ctx.next_constant()), size,
                data, kind, permissions);

  // Ensure that the allocation is properly aligned
  auto is_aligned = ICmpOp::CreateICmp(
      ICmpOpcode::EQ, BinaryOp::CreateURem(newalloc.address(), alignment), 0);
  auto align_is_zero = ICmpOp::CreateICmp(ICmpOpcode::EQ, alignment, 0);
  ctx.add(BinaryOp::CreateOr(is_aligned, align_is_zero));
  // The allocation can never wrap around the address space
  ctx.add(ICmpOp::CreateICmp(ICmpOpcode::ULE, newalloc.address(),
                             BinaryOp::CreateAdd(newalloc.address(), size)));
  // The allocation is not null
  ctx.add(ICmpOp::CreateICmp(ICmpOpcode::NE, newalloc.address(), 0));

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

    auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::ULE, old_end, new_start);
    auto cmp2 = ICmpOp::CreateICmp(ICmpOpcode::ULE, new_end, old_start);

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

    return ICmpOp::CreateICmp(
        ICmpOpcode::ULE, ptr.offset(),
        BinaryOp::CreateSub((*this)[ptr.alloc()].size(), width));
  }

  auto result = ConstantInt::Create(false);
  auto value = ptr.value(*this);

  for (const auto& alloc : allocs_) {
    auto end = BinaryOp::CreateAdd(alloc.address(),
                                   BinaryOp::CreateSub(alloc.size(), width));
    auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::ULE, alloc.address(), value);
    auto cmp2 = ICmpOp::CreateICmp(ICmpOpcode::ULE, value, end);

    // result |= (address <= value) && (value < address + size)
    result = BinaryOp::CreateOr(result, BinaryOp::CreateAnd(cmp1, cmp2));
  }

  // Note: NULL pointers are never valid.
  return BinaryOp::CreateAnd(ICmpOp::CreateICmp(ICmpOpcode::NE, value, 0),
                             result);
}

Assertion MemHeap::check_starts_allocation(const Pointer& ptr) {
  if (ptr.is_resolved()) {
    if (!check_live(ptr.alloc()))
      return ConstantInt::Create(false);

    return ICmpOp::CreateICmp(ICmpOpcode::EQ, ptr.offset(), 0);
  }

  auto result = ConstantInt::Create(false);
  auto value = ptr.value(*this);

  for (const auto& alloc : allocs_) {
    result = BinaryOp::CreateOr(
        result, ICmpOp::CreateICmp(ICmpOpcode::EQ, value, alloc.address()));
  }

  // Note: NULL pointers are never valid.
  return BinaryOp::CreateAnd(ICmpOp::CreateICmp(ICmpOpcode::NE, value, 0),
                             result);
}

llvm::SmallVector<Pointer, 1> MemHeap::resolve(std::shared_ptr<Solver> solver,
                                               const Pointer& ptr,
                                               Context& ctx) const {
  llvm::SmallVector<Pointer, 1> results;

  if (ptr.is_resolved()) {
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
    auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::ULE, alloc.address(), value);
    auto cmp2 = ICmpOp::CreateICmp(ICmpOpcode::ULT, value, end);
    auto assertion = BinaryOp::CreateAnd(cmp1, cmp2);

    if (ctx.check(solver, Assertion(assertion)) != SolverResult::UNSAT) {
      results.push_back(
          Pointer(it.key(), BinaryOp::CreateSub(value, alloc.address())));
    }
  }

  return results;
}

} // namespace caffeine
