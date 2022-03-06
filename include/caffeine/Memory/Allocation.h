#pragma once

#include "caffeine/IR/OperationBase.h"
#include "caffeine/Support/UnsupportedOperation.h"

namespace caffeine {

class ConstantInt;
class Assertion;
class MemHeap;
class MemHeapMgr;
class LLVMScalar;
class LLVMValue;

/**
 * An allocation category.
 *
 * This is used to verify that, when a deallocation is being done, that the
 * allocation was allocated by a compatible function. As an example, free
 * cannot be used to deallocate an allocation created by alloca.
 */
enum class AllocationKind { Alloca, Malloc, Global };

/**
 * Permissions for an allocation
 *
 * This is used to indicate what kind of operations a user is allowed
 * to perform on the requested allocation. As an example, for an allocation
 * with ReadWrite permissions a user could can read and modify the underlying
 * memory. For a Read, a user can read the data, but cannot modify the buffer.
 */
enum class AllocationPermissions {
  None = 0x0,
  Read = 0x1,
  Write = 0x2,
  Execute = 0x4,
  ReadWrite = Read | Write,
};

class AllocationException : public UnsupportedOperationException {
public:
  AllocationException(std::string&& what_arg)
      : UnsupportedOperationException(std::move(what_arg)) {}
};

/**
 * A memory allocation (either alive or dead).
 *
 * In general, an allocation is a tuple (address, size, data, kind) where
 * - address is the pointer to the start of the allocation.
 * - size is the size in bytes of the allocation.
 * - data is an array containing the bytes of the allocation.
 * - kind indicates the general location of the allocation (heap, stack, global,
 *   etc.)
 *
 * Any of address, size, or data may be either concrete, symbolic, or, for data,
 * some combination of the two.
 *
 * See the docs for MemHeap for the invariants that are asserted for a new
 * allocation and the procedure that is used for resolving a pointer to an
 * allocation.
 */
class Allocation {
private:
  OpRef address_;
  OpRef size_;
  OpRef data_;

  AllocationKind kind_;
  AllocationPermissions perms_;

public:
  Allocation(const OpRef& address, const OpRef& size, const OpRef& data,
             AllocationKind kind, AllocationPermissions permissions);
  Allocation(const OpRef& address, const ConstantInt& size, const OpRef& data,
             AllocationKind kind, AllocationPermissions permissions);

  const OpRef& size() const;
  OpRef& size();

  AllocationKind kind() const;

  AllocationPermissions permissions() const;
  void permissions(AllocationPermissions new_perm);

  const OpRef& data() const;
  OpRef& data();

  const OpRef& address() const;
  OpRef& address();

  bool is_constant_size() const;

  /**
   * Update the internal data array of this allocation.
   */
  void overwrite(const OpRef& newdata);
  void overwrite(OpRef&& newdata);

  /**
   * Assert that a read from this allocation at the given offset and with the
   * given width would be a valid inbounds read.
   */
  Assertion check_inbounds(const OpRef& offset, uint32_t width) const;
  Assertion check_inbounds(const OpRef& offset, const OpRef& width) const;

  /**
   * Read the specified type from the allocation at the given offset.
   *
   * Does not assert that the read is inbounds. Callers of this method should
   * check the assertion first.
   */
  OpRef read(const OpRef& offset, const Type& t,
             const llvm::DataLayout& layout) const;
  LLVMValue read(const OpRef& offset, llvm::Type* type,
                 const llvm::DataLayout& layout);

  /**
   * Write the value to the array at the given offset.
   *
   * Does not assert that the write is inbounds. Callers of this method should
   * add the assertion first.
   */
  void write(const OpRef& offset, const OpRef& value,
             const llvm::DataLayout& layout);
  void write(const OpRef& offset, const LLVMScalar& value,
             const MemHeapMgr& heapmgr, const llvm::DataLayout& layout);
  void write(const OpRef& offset, llvm::Type* type, const LLVMValue& value,
             const MemHeapMgr& heapmgr, const llvm::DataLayout& layout);

  void DebugPrint() const;
};

inline bool operator!(AllocationPermissions perm) {
  return perm == AllocationPermissions::None;
}

inline AllocationPermissions operator&(AllocationPermissions lhs,
                                       AllocationPermissions rhs) {
  return static_cast<AllocationPermissions>(static_cast<unsigned>(lhs) &
                                            static_cast<unsigned>(rhs));
}

} // namespace caffeine
