#ifndef CAFFEINE_DIST_SERIALIZATION_H
#define CAFFEINE_DIST_SERIALIZATION_H

#include <cstdint>
#include <unordered_map>

#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>

namespace caffeine_distributed {

typedef uint64_t ValueId;

// ValueIdMap is an object which stores a mapping of llvm::Value's to unique IDs
//
// The way this works is by iterating over all llvm::Instructions and Globals.
// Because the iteration happens in a deterministic manner, we are guaranteed to
// receive the same ID if the file doesn't change.
//
// This approach is discussed in
// https://lists.llvm.org/pipermail/llvm-dev/2017-May/112831.html
class ValueIdMap {
  std::unordered_map<llvm::Value*, ValueId> mapping_;
  llvm::Function* func_;

public:
  ValueIdMap(llvm::Function*);

  std::optional<ValueId> getValueId(llvm::Value* val);
};

} // namespace caffeine_distributed

#endif
