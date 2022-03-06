#pragma once

#include <memory>

namespace caffeine {

// This class essentially wraps a unique pointer. However, instead of
// copying the same pointer every time this wrapper is copied, the
// actual object behind the pointer is copied as well.
//
// This is desirable because we are then able to have subclasses in a
// vector when normally that would not be possible.
//
// In order to use this class, the template parameter T must implement
// a clone() method which returns a std::unique_ptr<T>. This method is
// called on copys and assignments in order to copy the underlying class
// behind the unique pointer.
template <class T>
class clone_ptr {
  std::unique_ptr<T> pointer;

public:
  virtual ~clone_ptr() = default;

  clone_ptr() = default;
  clone_ptr(clone_ptr<T>&&) = default;
  clone_ptr(const clone_ptr<T>& other)
      : pointer(other ? other->clone() : nullptr) {}
  clone_ptr(std::unique_ptr<T>&& p) : pointer(std::move(p)) {}
  clone_ptr(std::nullptr_t) : pointer(nullptr) {}

  clone_ptr& operator=(clone_ptr<T>&&) = default;

  clone_ptr& operator=(const clone_ptr<T>& other) {
    pointer = other ? other->clone() : nullptr;
    return *this;
  }
  clone_ptr& operator=(std::nullptr_t) {
    pointer = nullptr;
    return *this;
  }

  T* operator->() const noexcept {
    return get();
  }

  T& operator*() const noexcept {
    return *get();
  }

  T* get() const {
    return pointer.get();
  }

  bool operator!() const noexcept {
    return !get();
  }

  operator bool() const noexcept {
    return !!get();
  }

  bool operator==(const clone_ptr<T>& p) const noexcept {
    return pointer == p.pointer;
  }

  bool operator!=(const clone_ptr<T>& p) const {
    return !(*this == p);
  }

  // So that we can cast between different templates
  template <typename U>
  explicit operator clone_ptr<U>() const {
    return clone_ptr<U>(
        std::move(static_cast<std::unique_ptr<U>>(this->pointer->clone())));
  }
};

template <typename T, typename... Params>
clone_ptr<T> make_clone(Params&&... args) {
  return clone_ptr<T>(std::make_unique<T>(std::forward<Params>(args)...));
}

} // namespace caffeine
