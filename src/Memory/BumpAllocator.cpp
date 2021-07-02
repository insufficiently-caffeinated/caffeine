#include "caffeine/Memory/BumpAllocator.h"
#include "caffeine/Support/Assert.h"
#include "caffeine/Support/LLVMFmt.h"
#include <fmt/format.h>

namespace caffeine {

BumpAllocator::BumpAllocator(const llvm::APInt& base, const llvm::APInt& size)
    : current(base), base(base), size(size) {}

std::optional<llvm::APInt> BumpAllocator::allocate(const llvm::APInt& size_,
                                                   const llvm::APInt& align_) {
  CAFFEINE_ASSERT(align_.isNullValue() || align_.isPowerOf2(),
                  "cannot allocate with a non-power-of-2 alignment");

  llvm::APInt align = align_;
  if (align.getLimitedValue() < 8) {
    align.clearAllBits();
    align.setBit(3);
  }

  // Note: we allocate extra space after the allocation so that we catch out of
  //       bounds accesses.
  llvm::APInt size = size_ + 8;

  current += align - 1;
  current &= ~(align - 1);

  if ((this->size - (current - base)).ult(size))
    return std::nullopt;

  llvm::APInt pos = current;
  current += size;

  allocations.insert(pos);

  return pos;
}

void BumpAllocator::deallocate(const llvm::APInt& addr) {
  CAFFEINE_ASSERT(
      allocations.erase(addr),
      fmt::format(
          FMT_STRING("attempted to deallocate an invalid address: 0x{:x}"),
          addr));
}

} // namespace caffeine
