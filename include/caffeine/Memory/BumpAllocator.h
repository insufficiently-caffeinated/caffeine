#pragma once

#include <llvm/ADT/APInt.h>
#include <llvm/ADT/Hashing.h>
#include <optional>
#include <unordered_set>

namespace caffeine {
class BumpAllocator {
private:
  struct llvm_hash {
    size_t operator()(const llvm::APInt& v) const {
      return (size_t)llvm::hash_value(v);
    }
  };

  std::unordered_set<llvm::APInt, llvm_hash> allocations;
  llvm::APInt current;

  llvm::APInt base;
  llvm::APInt size;

public:
  BumpAllocator(const llvm::APInt& base, const llvm::APInt& size);

  std::optional<llvm::APInt> allocate(const llvm::APInt& size,
                                      const llvm::APInt& align);
  void deallocate(const llvm::APInt& addr);
};
} // namespace caffeine
