#ifndef CAFFEINE_ADT_PERSISTENTARRAY_H
#define CAFFEINE_ADT_PERSISTENTARRAY_H

#include "caffeine/ADT/Ref.h"

#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/Hashing.h>

#include <initializer_list>
#include <iterator>
#include <memory>
#include <mutex>
#include <shared_mutex>
#include <type_traits>
#include <utility>
#include <variant>
#include <vector>

#include <immer/vector.hpp>

namespace caffeine {

namespace detail {
  [[noreturn]] void throw_out_of_bounds(size_t n, size_t size);
} // namespace detail

/**
 * Efficiently-updateable shareable array.
 *
 * A persistent array is an array which can be copied easily but will share data
 * between multiple copies. Changes made to one copy will not observable to
 * another copy.
 *
 * This version is a thin wrapper around immer::vector.
 */
template <typename T>
class PersistentArray {
private:
  immer::vector<T> inner_;

public:
  PersistentArray() = default;
  ~PersistentArray() = default;

  PersistentArray(const immer::vector<T>& vec) : inner_(vec) {}
  PersistentArray(immer::vector<T>&& vec) : inner_(std::move(vec)) {}
  PersistentArray(const std::vector<T>& vec)
      : PersistentArray(vec.begin(), vec.end()) {}
  PersistentArray(std::vector<T>&& vec)
      : PersistentArray(std::move_iterator(vec.begin()),
                        std::move_iterator(vec.end())) {}
  PersistentArray(std::initializer_list<T> list) : inner_(list) {}
  PersistentArray(llvm::ArrayRef<T> array)
      : inner_(array.begin(), array.end()) {}

  template <typename It>
  PersistentArray(It begin, It end) : inner_(begin, end) {}

  size_t size() const {
    return inner_.size();
  }
  bool empty() const {
    return size() == 0;
  }

  /**
   * Construct a value at index i using the provided arguments.
   *
   * This will also reroot the underlying representation to be more efficient
   * for future sets from this PersistentArray instance.
   */
  void set(size_t i, const T& value) {
    inner_ = std::move(inner_).set(i, value);
  }
  void set(size_t i, T&& value) {
    inner_ =
        std::move(inner_).update(i, [&](const T&) { return std::move(value); });
  }

  /**
   * Read the value at index i.
   */
  const T& get(size_t i) const {
    if (i >= size())
      detail::throw_out_of_bounds(i, size());
    return inner_[i];
  }

  const immer::vector<T>& inner() const {
    return inner_;
  }

  /**
   * Reroot the underlying data array to the version pointed to by the current
   * reference.
   *
   * Semantically this doesn't change the value of the array but it does affect
   * the inner representation.
   */
  [[deprecated]] void reroot() const {}

  /// Copy the elements within this PersistentVector to a std::vector.
  std::vector<T> vec() const {
    return std::vector<T>(begin(), end());
  }

  /// Does the same thing as vec() but will move the vector out of this
  /// PersistentArray if possible.
  ///
  /// If the data is moved out of this PersistentArray then it will be left
  /// empty, otherwise there will be no change in what it stores.
  [[deprecated]] std::vector<T> take_vec() {
    return vec();
  }

  /**
   * If available, access the underlying vector of this PersistentArray. Returns
   * nullptr otherwise.
   */
  [[deprecated]] const std::vector<T>* underlying_vec() const {
    return nullptr;
  }

  // /**
  //  * Get a modifiable reference to an element. Multiple references can be
  //  * acquired at a single time but requesting the same reference twice will
  //  not
  //  * necessarily result in getting the a reference to the same location.
  //  */
  // T& element_reference(size_t i) {
  //   std::shared_lock lock(*mutex_);
  //   data_ = make_ref<Node>(data_, i, get(i));
  //   return std::get<Node::Diff>(data_->data).value;
  // }

  bool operator==(const PersistentArray<T>& array) const {
    return inner_ == array.inner_;
  }
  bool operator!=(const PersistentArray<T>& array) const {
    return !(*this == array);
  }

  using iterator = typename immer::vector<T>::iterator;
  using const_iterator = iterator;

  iterator begin() const {
    return inner_.begin();
  }
  iterator end() const {
    return inner_.end();
  }

  iterator cbegin() const {
    return begin();
  }
  iterator cend() const {
    return end();
  }

  std::reverse_iterator<const_iterator> rbegin() const {
    return std::reverse_iterator<const_iterator>(end());
  }
  std::reverse_iterator<const_iterator> rend() const {
    return std::reverse_iterator<const_iterator>(begin());
  }

public:
  class ElementAccessor {
  private:
    PersistentArray<T>* array;
    size_t index;

    ElementAccessor(PersistentArray<T>* array, size_t index)
        : array(array), index(index) {}

    template <typename U>
    friend class PersistentArray;

  public:
    operator const T&() const {
      return array->get(index);
    }

    ElementAccessor& operator=(const T& value) {
      array->set(index, value);
      return *this;
    }
    ElementAccessor& operator=(T&& value) {
      array->set(index, value);
      return *this;
    }

    auto operator==(const T& other)
        -> decltype(std::declval<const T&>() == std::declval<const T&>()) {
      return (const T&)(*this) == other;
    }
    auto operator!=(const T& other)
        -> decltype(std::declval<const T&>() != std::declval<const T&>()) {
      return (const T&)(*this) != other;
    }

  private:
    ElementAccessor(const ElementAccessor&) = delete;
    ElementAccessor(ElementAccessor&&) = delete;
    ElementAccessor& operator=(const ElementAccessor&) = delete;
    ElementAccessor& operator=(ElementAccessor&&) = delete;
  };

public:
  const T& operator[](size_t i) const {
    return get(i);
  }
  ElementAccessor operator[](size_t i) {
    if (i >= size())
      detail::throw_out_of_bounds(i, size());

    return ElementAccessor(this, i);
  }
};

template <typename T>
llvm::hash_code hash_value(const PersistentArray<T>& array) {
  return llvm::hash_combine_range(std::begin(array), std::end(array));
}

} // namespace caffeine

#endif
