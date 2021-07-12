#pragma once

#include "caffeine/IR/Operation.h"
#include <boost/thread/shared_mutex.hpp>
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
    bool operator()(const OpRef& a, const OpRef& b) const {
      return *a == *b;
    }
  };

  boost::upgrade_mutex mutex;
  tsl::hopscotch_set<OpRef, hasher, equal_to, std::allocator<OpRef>, 30, true>
      cache;

public:
  OperationCache() = default;

  // Look up an opertion in the cache, inserting it if it is not already
  // present.
  OpRef cache(Operation&& op);
};

} // namespace caffeine
