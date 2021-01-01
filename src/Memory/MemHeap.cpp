#include "caffeine/Memory/MemHeap.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Assert.h"

#include <llvm/ADT/SmallVector.h>

#include <algorithm>

namespace caffeine {

/***************************************************
 * Allocation                                      *
 ***************************************************/

Allocation::Allocation(const ref<Operation>& address,
                       const ref<Operation>& size, const ref<Operation>& data)
    : address_(address), size_(size), data_(data) {
  CAFFEINE_ASSERT(address->type().is_int());
  CAFFEINE_ASSERT(size->type().is_int());
  CAFFEINE_ASSERT(address->type().bitwidth() == size->type().bitwidth());
}
Allocation::Allocation(const ref<Operation>& address, const ConstantInt& size,
                       const ref<Operation>& data)
    : Allocation(address, make_ref<Operation>(size), data) {}

void Allocation::overwrite(const ref<Operation>& newdata) {
  data_ = newdata;
}
void Allocation::overwrite(ref<Operation>&& newdata) {
  data_ = std::move(newdata);
}

bool Allocation::is_constant_size() const {
  return size()->is_constant();
}

Assertion Allocation::check_inbounds(const ref<Operation>& offset,
                                     uint32_t width) const {
  // Basic check: offset < size && offset + width < size.
  // Need to check that the entire range is within the allocation.
  // TODO: Should we check for wraparound, probably not worth it for now.

  auto lower = ICmpOp::CreateICmp(ICmpOpcode::ULT, offset, size());
  auto upper = ICmpOp::CreateICmp(
      ICmpOpcode::ULT,
      BinaryOp::CreateAdd(offset, ConstantInt::Create(llvm::APInt(
                                      width, Type::pointer_ty().bitwidth()))),
      size());

  return Assertion(BinaryOp::CreateAnd(std::move(upper), std::move(lower)));
}

ref<Operation> Allocation::read(const ref<Operation>& offset, const Type& t,
                                const llvm::DataLayout& llvm) const {
  /**
   * Reading data here is actually somewhat complex. We need to effectively
   * reconstitute the type from its component bytes after we've read them
   * out of the array.
   */

  CAFFEINE_ASSERT(!t.is_void(), "attempted to read a value of type void");
  CAFFEINE_ASSERT(!t.is_array(), "attempted to read a value of type array");

  uint32_t width = t.byte_size(llvm);
  llvm::SmallVector<ref<Operation>, 8> bytes;
  bytes.reserve(width);

  for (uint32_t i = 0; i < width; ++i) {
    auto index = BinaryOp::CreateAdd(
        offset, ConstantInt::Create(llvm::APInt(offset->type().bitwidth(), i)));

    bytes.push_back(LoadOp::Create(data(), index));
  }

  if (width == 1)
    return std::move(bytes[0]);

  uint32_t bitwidth = width * 8;
  auto bitresult = UnaryOp::CreateZExt(Type::int_ty(bitwidth), bytes[0]);

  for (uint32_t i = 1; i < width; ++i) {
    // extended = zext(bytes[i], bitwidth) << (i * 8)
    auto extended = BinaryOp::CreateShl(
        UnaryOp::CreateZExt(Type::int_ty(bitwidth), bytes[i]),
        ConstantInt::Create(llvm::APInt(bitwidth, (uint64_t)i * 8)));
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

void Allocation::write(const ref<Operation>& offset,
                       const ref<Operation>& value_,
                       const llvm::DataLayout& layout) {
  /**
   * This is essentially the same process as for read but executed in reverse.
   */

  CAFFEINE_ASSERT(offset->type().is_int(),
                  "tried to write at non-integer offset");

  auto value = value_;
  Type t = value->type();
  uint32_t width = t.byte_size(layout);

  if (t.is_int()) {
    if (t.bitwidth() == 8) {
      overwrite(StoreOp::Create(data(), offset, value));
      return;
    }

    if (t.bitwidth() != width * 8)
      value = UnaryOp::CreateZExt(Type::int_ty(width * 8), value);
  } else {
    value = UnaryOp::CreateBitcast(Type::int_ty(width * 8), value);
  }

  for (uint32_t i = 0; i < width; ++i) {
    auto byte = UnaryOp::CreateTrunc(
        Type::int_ty(8),
        BinaryOp::CreateLShr(value, ConstantInt::Create(llvm::APInt(
                                        i * 8, (uint64_t)width * 8))));
    auto index = BinaryOp::CreateAdd(
        offset, ConstantInt::Create(llvm::APInt(i, (uint64_t)width * 8)));

    overwrite(StoreOp::Create(data(), index, byte));
  }
}

/***************************************************
 * Pointer                                         *
 ***************************************************/

Pointer::Pointer(const ref<Operation>& value)
    : Pointer({SIZE_MAX, SIZE_MAX}, value) {}
Pointer::Pointer(const AllocId& alloc, const ref<Operation>& offset)
    : alloc_(alloc), offset_(offset) {}

ref<Operation> Pointer::value(const MemHeap& heap) const {
  if (is_resolved())
    return BinaryOp::CreateAdd(heap[alloc()].address(), offset());
  return offset();
}

Assertion Pointer::check_null(const MemHeap& heap) const {
  return ICmpOp::CreateICmp(ICmpOpcode::EQ, value(heap), 0);
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

AllocId MemHeap::allocate(const ref<Operation>& size,
                          const ref<Operation>& alignment, Context& ctx) {
  CAFFEINE_ASSERT(size->type() == alignment->type());
  CAFFEINE_ASSERT(size->type().is_int());

  auto allocation = Allocation(
      Constant::Create(size->type(), ctx.next_constant()), size,
      AllocOp::Create(size, ConstantInt::Create(llvm::APInt(8, 0xDC))));

  // Ensure that the allocation is properly aligned
  ctx.add(ICmpOp::CreateICmp(
      ICmpOpcode::EQ, BinaryOp::CreateURem(allocation.address(), alignment),
      0));
  // The allocation can never wrap around the address space
  ctx.add(ICmpOp::CreateICmp(ICmpOpcode::ULE, allocation.address(),
                             BinaryOp::CreateAdd(allocation.address(), size)));
  // The allocation is not null
  ctx.add(ICmpOp::CreateICmp(ICmpOpcode::NE, allocation.address(), 0));

  for (const auto& alloc : allocs_) {
    /**
     * Ensure that the new allocation doesn't overlap with any of the existing
     * allocations.
     */

    auto new_start = allocation.address();
    auto old_start = alloc.address();

    auto new_end = BinaryOp::CreateAdd(allocation.address(), allocation.size());
    auto old_end = BinaryOp::CreateAdd(alloc.address(), alloc.size());

    auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::ULE, new_start, old_start);
    auto cmp2 = ICmpOp::CreateICmp(ICmpOpcode::ULT, old_start, new_end);
    auto cmp3 = ICmpOp::CreateICmp(ICmpOpcode::ULE, old_start, new_start);
    auto cmp4 = ICmpOp::CreateICmp(ICmpOpcode::ULT, new_end, old_end);

    ctx.add(!Assertion(BinaryOp::CreateOr(BinaryOp::CreateAnd(cmp1, cmp2),
                                          BinaryOp::CreateAnd(cmp3, cmp4))));
  }

  return allocs_.insert(allocation);
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

Assertion MemHeap::check_valid(const Pointer& ptr) {
  if (ptr.is_resolved()) {
    return ICmpOp::CreateICmp(ICmpOpcode::ULE, ptr.offset(),
                              (*this)[ptr.alloc()].size());
  }

  auto result = ConstantInt::Create(false);
  auto value = ptr.value(*this);

  for (const auto& alloc : allocs_) {
    auto end = BinaryOp::CreateAdd(alloc.address(), alloc.size());
    auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::ULE, alloc.address(), value);
    auto cmp2 = ICmpOp::CreateICmp(ICmpOpcode::ULT, value, end);

    // result |= (address <= value) && (value < address + size)
    result = BinaryOp::CreateOr(result, BinaryOp::CreateAnd(cmp1, cmp2));
  }

  return result;
}

llvm::SmallVector<Pointer, 1> MemHeap::resolve(const Pointer& ptr,
                                               Context& ctx) const {
  if (ptr.is_resolved())
    return llvm::SmallVector<Pointer, 1>{ptr};

  llvm::SmallVector<Pointer, 1> results;
  auto value = ptr.value(*this);

  auto end = allocs_.end();
  for (auto it = allocs_.begin(); it != end; ++it) {
    const auto& alloc = *it;

    auto end = BinaryOp::CreateAdd(alloc.address(), alloc.size());
    auto cmp1 = ICmpOp::CreateICmp(ICmpOpcode::ULE, alloc.address(), value);
    auto cmp2 = ICmpOp::CreateICmp(ICmpOpcode::ULT, value, end);
    auto assertion = BinaryOp::CreateAnd(cmp1, cmp2);

    if (ctx.check(Assertion(assertion)) != SolverResult::UNSAT) {
      results.push_back(
          Pointer(it.key(), BinaryOp::CreateSub(value, alloc.address())));
    }
  }

  return results;
}

} // namespace caffeine
