#include "caffeine/Memory/Allocation.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Model/Value.h"
#include <llvm/IR/Type.h>

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
    : Allocation(address, ConstantInt::Create(size.value()), data, kind,
                 permissions) {}

const OpRef& Allocation::size() const {
  return size_;
}
OpRef& Allocation::size() {
  return size_;
}

const OpRef& Allocation::data() const {
  return data_;
}
OpRef& Allocation::data() {
  return data_;
}

const OpRef& Allocation::address() const {
  return address_;
}
OpRef& Allocation::address() {
  return address_;
}

AllocationKind Allocation::kind() const {
  return kind_;
}

AllocationPermissions Allocation::permissions() const {
  return perms_;
}

void Allocation::permissions(AllocationPermissions p) {
  perms_ = p;
}

void Allocation::overwrite(const OpRef& newdata) {
  if (!(perms_ & AllocationPermissions::Write)) {
    throw AllocationException("tried to write to unwritable allocation");
  }
  data_ = newdata;
}
void Allocation::overwrite(OpRef&& newdata) {
  if (!(perms_ & AllocationPermissions::Write)) {
    throw AllocationException("tried to write to unwritable allocation");
  }
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

  auto lower = ICmpOp::CreateICmpULT(offset, size());
  auto upper =
      ICmpOp::CreateICmpULE(BinaryOp::CreateAdd(offset, width), size());

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
  if (!(perms_ & AllocationPermissions::Read)) {
    throw AllocationException("tried to read unreadable allocation");
  }

  uint32_t width = t.byte_size(llvm);
  llvm::SmallVector<OpRef, 8> bytes;
  bytes.reserve(width);

  for (uint32_t i = 0; i < width; ++i) {
    bytes.push_back(LoadOp::Create(data(), BinaryOp::CreateAdd(offset, i)));
  }

  if (t.is_int() && t.bitwidth() == 8) {
    CAFFEINE_ASSERT(bytes.size() == 1);
    return std::move(bytes[0]);
  }

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
  if (!(perms_ & AllocationPermissions::Read)) {
    throw AllocationException("tried to read unreadable allocation");
  }

  if (type->isPointerTy()) {
    auto heap = type->getPointerElementType()->isFunctionTy()
                    ? MemHeapMgr::FUNCTION_INDEX
                    : type->getPointerAddressSpace();

    return LLVMValue(Pointer(
        read(offset, Type::int_ty(layout.getPointerSizeInBits()), layout),
        heap));
  }

  if (type->isArrayTy()) {
    std::vector<LLVMValue> members;
    members.reserve(type->getArrayNumElements());
    llvm::Type* elem_ty = type->getArrayElementType();

    for (size_t i = 0; i < type->getArrayNumElements(); ++i) {
      OpRef newoffset = BinaryOp::CreateAdd(
          offset, i * layout.getTypeAllocSize(elem_ty).getFixedSize());

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
    auto fixedVectorTy = llvm::dyn_cast<llvm::FixedVectorType>(type);
    CAFFEINE_ASSERT(fixedVectorTy, "Scalable vectors are not supported yet");
    LLVMValue::OpVector members;
    members.reserve(fixedVectorTy->getNumElements());
    llvm::Type* elem_ty = fixedVectorTy->getElementType();

    for (size_t i = 0; i < fixedVectorTy->getNumElements(); ++i) {
      OpRef newoffset = BinaryOp::CreateAdd(
          offset, i * layout.getTypeAllocSize(elem_ty).getFixedSize());

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
  if (!(perms_ & AllocationPermissions::Write)) {
    throw AllocationException("tried to write to unwritable allocation");
  }

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
                       const MemHeapMgr& heapmgr,
                       const llvm::DataLayout& layout) {
  if (value.is_pointer()) {
    write(offset, value.pointer().value(heapmgr), layout);
  } else {
    write(offset, value.expr(), layout);
  }
}
void Allocation::write(const OpRef& offset, llvm::Type* type,
                       const LLVMValue& value, const MemHeapMgr& heapmgr,
                       const llvm::DataLayout& layout) {
  if (!(perms_ & AllocationPermissions::Write)) {
    throw AllocationException("tried to write to unwritable allocation");
  }

  if (value.is_vector()) {
    if (type->isVectorTy()) {
      auto fixedVectorTy = llvm::dyn_cast<llvm::FixedVectorType>(type);
      CAFFEINE_ASSERT(fixedVectorTy, "Scalable vectors are not supported");
      CAFFEINE_ASSERT(value.num_elements() == fixedVectorTy->getNumElements());
      type = fixedVectorTy->getElementType();
    }

    for (size_t i = 0; i < value.num_elements(); ++i) {
      write(BinaryOp::CreateAdd(
                offset, i * layout.getTypeAllocSize(type).getFixedSize()),
            value.element(i), heapmgr, layout);
    }
  } else if (type->isArrayTy()) {
    CAFFEINE_ASSERT(value.num_members() == type->getArrayNumElements());
    llvm::Type* elem_ty = type->getArrayElementType();

    for (size_t i = 0; i < value.num_members(); ++i) {
      write(BinaryOp::CreateAdd(
                offset, i * layout.getTypeAllocSize(elem_ty).getFixedSize()),
            elem_ty, value.member(i), heapmgr, layout);
    }
  } else if (type->isStructTy()) {
    CAFFEINE_ASSERT(value.num_members() == type->getStructNumElements());
    size_t elem_offset = 0;

    for (size_t i = 0; i < value.num_members(); ++i) {
      llvm::Type* elem_ty = type->getStructElementType(i);

      write(BinaryOp::CreateAdd(offset, elem_offset), elem_ty, value.member(i),
            heapmgr, layout);

      elem_offset += layout.getTypeAllocSize(elem_ty);
    }
  }
}

} // namespace caffeine
