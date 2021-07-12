#pragma once

#include "caffeine/IR/Operation.h"
#include <shared_mutex>
#include <tsl/hopscotch_set.h>

namespace caffeine {

class OperationCache {
private:
  struct hasher {
    size_t operator()(const OpRef& op) const {
      return hash_value(*op);
    }
  };

  struct equal_to {
    using is_transparent = void;

    bool operator()(const OpRef& a, const OpRef& b) const {
      return *a == *b;
    }

    bool operator()(const OpRef& a, const Operation& b) const {
      return *a == b;
    }
    bool operator()(const Operation& a, const OpRef& b) const {
      return a == *b;
    }
  };

  using set_type = tsl::hopscotch_set<OpRef, hasher, equal_to>;

  // Minimum threshold for a GC collection to run automatically.
  static constexpr size_t min_threshold = 2048;

  mutable std::shared_mutex mutex;
  set_type set;
  size_t threshold = min_threshold;

public:
  OperationCache() = default;

  // Get a pointer to the default global cache.
  static OperationCache* default_cache();

  size_t size() const;

  // Remove all items from the cache.
  void clear();

  // Look up an opertion in the cache, inserting it if it is not already
  // present.
  //
  // Note that this method does not cache any of the operands of op. If you want
  // to cache recursively then use intern instead.
  OpRef cache(Operation&& op);
  OpRef cache(const Operation& op);

  // Cache op and all of its operands recursively until everything is cached.
  OpRef intern(const OpRef& op);

  // Remove all items in the map with no external references.
  //
  // Normally the cache will automatically perform garbage collection every so
  // often but this method can be useful for forcing it.
  void gc();

private:
  void gc_locked(std::unique_lock<std::shared_mutex>&);
  OpRef intern_locked(const OpRef& op, std::unique_lock<std::shared_mutex>&);
};

} // namespace caffeine
