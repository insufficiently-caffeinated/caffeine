#ifndef CAFFEINE_ADT_REF_H
#define CAFFEINE_ADT_REF_H

#include <memory>
#include <type_traits>

namespace caffeine {

/**
 * Intrusive reference-counted pointer.
 *
 * This type is analogous to std::shared_ptr except that it uses an internal
 * member of T to store the reference count. Whether ref is thread-safe or not
 * depends on the type of the refcount within T.
 *
 * Implementing a Pointee Type
 * ===========================
 * There is only one requirement for a pointee type: It should have a member
 * with name refcount that supports the following operations
 *  - operator++ (preincrement)
 *  - operator-- (predecrement)
 *  - operator size_t
 *  - operator ! - if operator size_t is implicit then that can be used instead.
 *
 * Upon construction, the refcount should be initialized with 0 (or whatever
 * value is equivalent for the type.)
 *
 * If you want to support constant refs (i.e. ref<const T>) then it is
 * necessary to declare the refcount field as mutable.
 */
template <typename T, typename Deleter = std::default_delete<T>>
class ref : Deleter {
private:
  T* value;

  static const bool is_nothrow_destructible =
      std::is_nothrow_destructible<T>::value;

  enum raw_t { raw };
  constexpr ref(raw_t, T* value, Deleter deleter)
      : Deleter(deleter), value(value) {}

public:
  constexpr ref() : value(nullptr) {}

  /**
   * Take ownership of the pointer.
   *
   * This will increment the refcount of value.
   */
  explicit ref(T* value, const Deleter& deleter = Deleter())
      : Deleter(deleter), value(value) {
    increment();
  }

  // References are implicitly convertable to const references.
  operator ref<const T>() const {
    return ref<const T>(get(), this->deleter());
  }

  /**
   * Create a ref without incrementing the refcount.
   *
   * Note that UB will occur if there are more references than the
   * refcount indicates.
   */
  static ref<T> from_raw(T* value, const Deleter& deleter = Deleter()) {
    return ref<T>(raw, value, deleter);
  }

  size_t refcount() const {
    if (!value)
      return 0;
    return static_cast<size_t>(value->refcount);
  }

  Deleter& deleter() & {
    return *this;
  }
  const Deleter& deleter() const& {
    return *this;
  }
  Deleter&& deleter() && {
    return *this;
  }
  const Deleter&& deleter() const&& {
    return *this;
  }

  /**
   * Take the internal pointer from this reference without changing the
   * refcount.
   *
   * Note that UB will occur if there are more references than the refcount
   * indicates.
   */
  T* take() {
    auto prev = value;
    value = nullptr;
    return prev;
  }

  constexpr T* get() {
    return value;
  }
  constexpr const T* get() const {
    return value;
  }

  constexpr T* operator->() {
    return get();
  }
  constexpr const T* operator->() const {
    return get();
  }

  T& operator*() & {
    return *get();
  }
  T&& operator*() && {
    return *get();
  }
  const T& operator*() const& {
    return *get();
  }
  const T&& operator*() const&& {
    return *get();
  }

  operator bool() const {
    return get();
  }
  bool operator!() const {
    return !get();
  }

  bool operator==(const ref<T>& r) const {
    return value == r.value;
  }
  bool operator!=(const ref<T>& r) const {
    return value != r.value;
  }

  ref(const ref<T>& r) noexcept(std::is_nothrow_copy_constructible_v<Deleter>)
      : Deleter(r.deleter()), value(r.value) {
    increment();
  }
  ref(ref<T>&& r) noexcept(std::is_nothrow_move_constructible_v<Deleter>)
      : Deleter(r.deleter()), value(r.value) {
    r.value = nullptr;
  }

  ref<T>& operator=(const ref<T>& r) noexcept(
      is_nothrow_destructible&& std::is_nothrow_copy_assignable_v<Deleter>) {
    decrement();
    value = r.value;
    *(Deleter*)this = r.deleter();
    increment();
    return *this;
  }
  ref<T>& operator=(ref<T>&& r) noexcept(
      is_nothrow_destructible&& std::is_nothrow_move_assignable_v<Deleter>) {
    decrement();
    value = r.value;
    r.value = nullptr;
    *(Deleter*)this = std::move(r.deleter());
    return *this;
  }

  ref<T>& operator=(std::nullptr_t) noexcept(is_nothrow_destructible) {
    decrement();
    value = nullptr;
    return *this;
  }

  ~ref() noexcept(is_nothrow_destructible) {
    decrement();
  }

private:
  void increment() {
    if (value) {
      ++value->refcount;
    }
  }
  void decrement() {
    if (!value)
      return;

    // Note: Because refcount may be an atomic, the only valid time to check
    //       the refcount is at the same time that we're decrementing it.
    if (!(--value->refcount)) {
      // Use the deleter
      this->operator()(const_cast<typename std::remove_const<T>::type*>(value));
      value = nullptr;
    }
  }
};

template <typename T, typename... Args>
ref<T> make_ref(Args&&... args) {
  return ref<T>(new T(std::forward<Args>(args)...));
}

} // namespace caffeine

#endif
