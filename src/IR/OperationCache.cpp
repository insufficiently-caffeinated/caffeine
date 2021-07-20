#include "caffeine/IR/OperationCache.h"
#include "caffeine/Support/Assert.h"

#include <algorithm>

namespace caffeine {

OperationCache* OperationCache::default_cache() {
  static OperationCache cache;
  return &cache;
}

size_t OperationCache::size() const {
  auto lock = std::shared_lock(mutex);
  return set.size();
}

void OperationCache::clear() {
  auto lock = std::unique_lock(mutex);
  set.clear();
  threshold = min_threshold;
}

OpRef OperationCache::cache(const Operation& op) {
  return cache(Operation(op));
}
OpRef OperationCache::cache(Operation&& op) {
  auto hash = hash_value(op);

  // Fast path - the item is already in the cache
  auto lock = std::shared_lock(mutex);
  auto it = set.find<Operation>(op, hash);
  if (it != set.end())
    return *it;

  // Slow path - need to modify the map itself
  lock.unlock();
  auto ulock = std::unique_lock(mutex);
  auto val = *set.insert(std::make_shared<Operation>(std::move(op))).first;

  if (set.size() > threshold)
    gc_locked(ulock);

  return val;
}

OpRef OperationCache::intern(const OpRef& op) {
  CAFFEINE_ASSERT(op);
  auto hash = hasher()(op);

  // Fast path - the item is already in the cache
  auto lock = std::shared_lock(mutex);
  auto it = set.find(op, hash);
  if (it != set.end())
    return *it;

  // Slow path - need to recursively intern values
  lock.unlock();
  auto ulock = std::unique_lock(mutex);
  auto interned = intern_locked(op, ulock);

  if (set.size() > threshold)
    gc_locked(ulock);

  return interned;
}

OpRef OperationCache::intern_locked(const OpRef& op,
                                    std::unique_lock<std::shared_mutex>& lock) {
  auto it = set.find(op);
  if (it != set.end())
    return op;

  bool any_cached = false;
  size_t num_operands = op->num_operands();
  llvm::SmallVector<OpRef, 3> operands;
  operands.reserve(num_operands);

  for (size_t i = 0; i < num_operands; ++i) {
    const auto& uncached = op->operand_at(i);
    auto cached = intern_locked(uncached, lock);

    if (cached == uncached)
      any_cached = true;

    operands.push_back(std::move(cached));
  }

  if (!any_cached) {
    set.insert(op);
    return op;
  }

  auto cached = op->with_new_operands(operands);
  set.insert(cached);
  return cached;
}

void OperationCache::gc() {
  auto lock = std::unique_lock(mutex);
  gc_locked(lock);
}

void OperationCache::gc_locked(std::unique_lock<std::shared_mutex>&) {
  for (auto it = set.begin(), end = set.end(); it != end;) {
    if (it->use_count() == 1) {
      it = set.erase(it);
    } else {
      ++it;
    }
  }

  threshold = std::max(set.size() * 2, min_threshold);
}

} // namespace caffeine
