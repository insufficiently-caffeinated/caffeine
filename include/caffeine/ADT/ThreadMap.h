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
    return it == map.end() ? nullptr : &it->second;
  }
  T* get() {
    return const_cast<T*>(const_cast<const ThreadMap<T>*>(this)->get());
  }

  T& operator*() {
    return get_or_insert();
  }

  T& get_or_insert() {
    if (auto* ptr = get())
      return *ptr;

    auto id = std::this_thread::get_id();
    auto lock = std::unique_lock(mutex);
    return map[id];
  }

private:
  mutable std::shared_mutex mutex;
  std::unordered_map<std::thread::id, T> map;
};

} // namespace caffeine
