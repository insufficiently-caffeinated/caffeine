#include <memory>

namespace caffeine {

template <class T>
class clone_ptr {
  std::unique_ptr<T> pointer;

public:
  virtual ~clone_ptr() = default;

  clone_ptr(std::unique_ptr<T>&& p) : pointer(std::move(p)) {}

  clone_ptr(const clone_ptr<T>& other) : pointer(other.pointer->clone()) {}

  clone_ptr& operator=(const clone_ptr<T> other) {
    pointer = other.pointer->clone();
    return *this;
  }

  T* operator->() const {
    return pointer.get();
  }

  T* get() const {
    return pointer.get();
  }

  // So that we can cast between different templates
  template <typename U>
  explicit operator clone_ptr<U>() {
    return clone_ptr<U>(
        std::move(static_cast<std::unique_ptr<U>>(this->pointer->clone())));
  }
};

template <typename T, typename... Params>
clone_ptr<T> make_clone(Params&&... args) {
  return clone_ptr<T>(std::make_unique<T>(std::forward<Params>(args)...));
}

} // namespace caffeine
