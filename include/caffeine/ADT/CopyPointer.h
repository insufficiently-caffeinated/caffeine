#include <memory>

namespace caffeine {

template <class T>
class CopyPointer {
  std::unique_ptr<T> pointer;

public:
  virtual ~CopyPointer() = default;

  CopyPointer(std::unique_ptr<T>&& p) : pointer(std::move(p)) {}

  CopyPointer(const CopyPointer<T>& other) {
    pointer = other.pointer->clone();
  }

  CopyPointer& operator=(const CopyPointer<T> other) {
    pointer = other.pointer->clone();
    return *this;
  }

  T* operator->() const {
    return pointer.get();
  }

  T* get() const {
    return pointer.get();
  }
};

template <typename T, typename... Params>
CopyPointer<T> make_copy(Params&&... args) {
  return std::make_unique<T>(std::forward<Params>(args)...);
}

} // namespace caffeine
