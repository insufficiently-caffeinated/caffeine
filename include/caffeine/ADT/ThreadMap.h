#pragma once

#include <shared_mutex>
#include <thread>
#include <unordered_map>

namespace caffeine {

template <typename T>
class ThreadMap {
public:
  ThreadMap() = default;

  const T* get() const {
    auto id = std::this_thread::get_id();
    auto lock = std::shared_lock(mutex);

    auto it = map.find(id);
    return it == map.end() ? nullptr : it->second.get();
  }
  T* get() {
    return const_cast<T*>(const_cast<const ThreadMap<T>*>(this)->get());
  }

  T& operator*() {
    return get_or_insert();
  }

  template <typename... Args>
  T& get_or_insert(Args&&... args) {
    if (auto* ptr = get())
      return *ptr;

    auto id = std::this_thread::get_id();
    auto lock = std::unique_lock(mutex);
    auto it = map.find(id);
    if (it == map.end()) {
      it = map.emplace(id, std::make_unique<T>(std::forward<Args>(args)...))
               .first;
    }

    return *it->second;
  }

private:
  mutable std::shared_mutex mutex;
  std::unordered_map<std::thread::id, std::unique_ptr<T>> map;
};

} // namespace caffeine
