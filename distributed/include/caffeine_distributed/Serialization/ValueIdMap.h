#ifndef CAFFEINE_DIST_SERIALIZATION_H
#define CAFFEINE_DIST_SERIALIZATION_H

#include <cstdint>
#include <unordered_map>

#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>

namespace caffeine_distributed {
class ValueIdMap {
  std::unordered_map<llvm::Value*, uint64_t> mapping_;
  llvm::Function* func_;

public:
  ValueIdMap(llvm::Function*);
};
} // namespace caffeine_distributed

#endif
