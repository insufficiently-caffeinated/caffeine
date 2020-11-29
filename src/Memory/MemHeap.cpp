#include "caffeine/Memory/MemHeap.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/Support/Assert.h"

#include <llvm/ADT/SmallVector.h>

namespace caffeine {

/***************************************************
 * Allocation                                      *
 ***************************************************/

Allocation::Allocation(const ref<Operation>& address,
                       const ref<Operation>& size, const ref<Operation>& data,
                       bool dead)
    : address_(address), size_(size), data_(data), dead_(dead) {
  CAFFEINE_ASSERT(address->type().is_int());
  CAFFEINE_ASSERT(size->type().is_int());
  CAFFEINE_ASSERT(address->type().bitwidth() == size->type().bitwidth());
}
Allocation::Allocation(const ref<Operation>& address, const ConstantInt& size,
                       const ref<Operation>& data, bool dead)
    : Allocation(address, make_ref<Operation>(size), data, dead) {}

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
        ConstantInt::Create(llvm::APInt(bitwidth, i * 8)));
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
        BinaryOp::CreateLShr(
            value, ConstantInt::Create(llvm::APInt(i * 8, width * 8))));
    auto index = BinaryOp::CreateAdd(
        offset, ConstantInt::Create(llvm::APInt(i, width * 8)));

    overwrite(StoreOp::Create(data(), index, byte));
  }
}

} // namespace caffeine
