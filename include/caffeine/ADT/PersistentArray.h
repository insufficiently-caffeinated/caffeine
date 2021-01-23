#ifndef CAFFEINE_ADT_PERSISTENTARRAY_H
#define CAFFEINE_ADT_PERSISTENTARRAY_H

#include "caffeine/ADT/Ref.h"

#include <llvm/ADT/ArrayRef.h>

#include <initializer_list>
#include <type_traits>
#include <utility>
#include <variant>
#include <vector>

namespace caffeine {

namespace detail {

  template <typename T, typename... Ts>
  struct first_of {
    typedef T type;
  };

  template <typename... Ts>
  using first_of_t = typename first_of<Ts...>::type;

  /**
   * Template to check whether the type T has an operator== overload for itself.
   */
  template <typename T>
  class is_comparable {
  private:
    template <typename>
    struct sfinae_true : std::true_type {};

    template <typename U>
    static auto test_comparable(int)
        -> sfinae_true<decltype(std::declval<const U&>() ==
                                std::declval<const U&>())>;
    template <typename>
    static auto test_comparable(long) -> std::false_type;

  public:
    static constexpr bool value = decltype(test_comparable<T>(0))::value;
  };

} // namespace detail

/**
 * Efficiently-updateable shareable array.
 *
 * A persistent array is an array which can be copied easily but will share data
 * between multiple copies. Changes made to one copy will not observable to
 * another copy.
 *
 * This data structure is an implementation of the persistant array data
 * structure as described in "A Persistent Union-Find Data Structure" by
 * Conchon, S. and Filliatre, J.
 *
 * Efficiency Notes
 * ================
 * Internally, a persistent array is represented as a base array + a tree of
 * changes to the base array. When a store is doing the tree is rerooted to
 * bring the underlying array as close as possible to the persistent array
 * handle that made the store. This means that performing lots of work on a
 * single handle at a time will be much more efficient than scattering get and
 * set calls across many different ones.
 *
 * Multithreaded Use
 * =================
 * Since the internal data structures are shared it is not safe to store to any
 * PersistentArray that might share data with one being used in another thread.
 *
 * If you want to move a persistent array between threads call `vec()` or
 * `take_vec()` and construct a new PersistentArray with the resulting vector.
 */
template <typename T>
class PersistentArray {
public:
  class ElementAccessor;
  class const_iterator;

private:
  struct Node;

  ref<Node> data_;
  size_t size_ = 0;

public:
  constexpr PersistentArray() = default;
  ~PersistentArray() = default;

  PersistentArray(const std::vector<T>& vec)
      : data_(make_ref<Node>(vec)), size_(vec.size()) {}
  PersistentArray(std::vector<T>&& vec)
      : data_(make_ref<Node>(std::move(vec))), size_(vec.size()) {}
  PersistentArray(std::initializer_list<T> list)
      : data_(make_ref<Node>(std::vector<T>(list))), size_(list.size()) {}
  PersistentArray(llvm::ArrayRef<T> array) : PersistentArray(array.vec()) {}

  template <typename It>
  PersistentArray(It begin, It end)
      : PersistentArray(std::vector<T>(begin, end)) {}

  constexpr size_t size() const noexcept {
    return size_;
  }
  constexpr bool empty() const noexcept {
    return size() == 0;
  }

  /// Check whether the current array directly contains the underlying
  /// std::vector instance.
  bool is_base() const noexcept {
    return data_ && data_->kind() == Node::Base;
  }
  /// Check whether the current array contains a diff to the underlying
  /// std::vector instance.
  bool is_diff() const noexcept {
    return data_ && data_->kind() == Node::Diff;
  }

  /**
   * Construct a value at index i using the provided arguments.
   *
   * This will also reroot the underlying representation to be more efficient
   * for future sets from this PersistentArray instance.
   */
  template <typename... Us>
  void set(size_t i, Us&&... args) {
    if (i >= size_)
      throw_out_of_range(i);

    if (data_->refcount > 1)
      data_ = make_ref<Node>(data_, i, std::forward<Us>(args)...);

    if (data_->kind() != Node::Base)
      data_->reroot();

    T& slot = std::get<Node::Base>(data_->data)[i];

    // Specialize to use assignment operator when we have const T& or T&&
    if constexpr (sizeof...(Us) == 1 &&
                  std::is_same_v<T, std::decay_t<detail::first_of_t<Us...>>>) {
      slot = std::forward<detail::first_of_t<Us...>>(args...);
    } else {
      slot = T(std::forward<Us>(args)...);
    }
  }
  /// Like set, except does not modify the underlying representation.
  template <typename... Us>
  void set_direct(size_t i, Us&&... args) {
    if (i >= size_)
      throw_out_of_range(i);

    if (data_->refcount > 1 || data_->kind() == Node::Diff) {
      data_ = make_ref<Node>(data_, i, std::forward<Us>(args)...);
    } else {
      T& slot = std::get<Node::Base>(data_->data)[i];

      // Specialize to use assignment operator when we have const T& or T&&
      if constexpr (sizeof...(Us) == 1 &&
                    std::is_same_v<T,
                                   std::decay_t<detail::first_of_t<Us...>>>) {
        slot = std::forward<detail::first_of_t<Us...>>(args...);
      } else {
        slot = T(std::forward<Us>(args)...);
      }
    }
  }

  /**
   * Read the value at index i.
   *
   * Note that modifying any PersistentArray that is shared with this one may
   * end up changing the value behind the reference.
   */
  const T& get(size_t i) const {
    if (i >= size_)
      throw_out_of_range(i);
    return data_->get(i);
  }

  /// Copy the elements within this PersistenVector to a std::vector.
  std::vector<T> vec() const {
    return std::vector<T>(begin(), end());
  }
  /// Does the same thing as vec() but will move the vector out of this
  /// PersistentArray if possible.
  ///
  /// If the data is moved out of this PersistentArray then it will be left
  /// empty, otherwise there will be no change in what it stores.
  std::vector<T> take_vec() {
    using std::swap;

    if (!is_base() || data_.refcount() != 1)
      return vec();

    ref<Node> inner;
    swap(inner, data_);
    size_ = 0;

    return std::move(std::get<Node::Base>(inner->data));
  }

  const T& operator[](size_t i) const {
    return get(i);
  }
  ElementAccessor operator[](size_t i) {
    if (i >= size())
      throw_out_of_range(i);

    return ElementAccessor(this, i);
  }

  bool operator==(const PersistentArray<T>& array) const {
    if (size() != array.size())
      return false;

    for (size_t i = 0; i < size(); ++i) {
      if (!(get(i) == array.get(i)))
        return false;
    }

    return true;
  }
  bool operator!=(const PersistentArray<T>& array) const {
    return !(*this == array);
  }

  const_iterator begin() const {
    return const_iterator(this, 0);
  }
  const_iterator end() const {
    return const_iterator(this, size());
  }

  const_iterator cbegin() const {
    return begin();
  }
  const_iterator cend() const {
    return end();
  }

  std::reverse_iterator<const_iterator> rbegin() const {
    return std::reverse_iterator<const_iterator>(end());
  }
  std::reverse_iterator<const_iterator> rend() const {
    return std::reverse_iterator<const_iterator>(begin());
  }

private:
  struct Node {
    enum NodeKind { Base, Diff };

    struct DiffData {
      ref<Node> next;
      size_t index;
      T value;
    };

    size_t refcount = 0;
    std::variant<std::vector<T>, DiffData> data;

    Node(const std::vector<T>& data) : data(data) {}
    Node(std::vector<T>&& data) : data(std::move(data)) {}
    Node(const ref<Node>& next, size_t index, T&& value)
        : data(DiffData{next, index, std::move(value)}) {}
    Node(const ref<Node>& next, size_t index, const T& value)
        : data(DiffData{next, index, value}) {}

    NodeKind kind() const {
      return static_cast<NodeKind>(data.index());
    }

    const T& get(size_t i) const {
      if (const auto* base = std::get_if<Base>(&data))
        return (*base)[i];

      const auto& diff = std::get<Diff>(data);
      if (diff.index == i)
        return diff.value;
      return diff.next->get(i);
    }

    void reroot() {
      using std::swap;

      if (data.index() == Base)
        return;

      DiffData& diff = std::get<Diff>(data);
      ref<Node> next = std::move(diff.next);
      next->reroot();

      swap(diff.value, std::get<Base>(next->data)[diff.index]);
      swap(this->data, next->data);
      std::get<Diff>(next->data).next = ref<Node>(this);
    }
  };

  [[noreturn]] static void throw_out_of_range(size_t i) {
    std::vector<T>().at(i);
    llvm_unreachable("Vector didn't throw exception");
  }

  void reroot() {
    if (data_)
      data_->reroot();
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

  class const_iterator {
  private:
    const PersistentArray<T>* array;
    size_t index;

    const_iterator(const PersistentArray<T>* array, size_t i)
        : array(array), index(i) {}

    friend class PersistentArray<T>;

  public:
    using iterator_category = std::random_access_iterator_tag;
    using difference_type = std::ptrdiff_t;
    using value_type = T;
    using pointer = const T*;
    using reference = const T&;

    bool operator==(const const_iterator& it) const noexcept {
      return index == it.index;
    }
    bool operator!=(const const_iterator& it) const noexcept {
      return !(*this == it);
    }

    bool operator<(const const_iterator& it) const noexcept {
      return index < it.index;
    }
    bool operator>(const const_iterator& it) const noexcept {
      return index > it.index;
    }
    bool operator<=(const const_iterator& it) const noexcept {
      return index <= it.index;
    }
    bool operator>=(const const_iterator& it) const noexcept {
      return index >= it.index;
    }

    const T& operator*() const {
      return array->get(index);
    }
    const T* operator->() const {
      return &this->operator*();
    }
    const T& operator[](size_t n) const {
      return array->get(index + n);
    }

    const_iterator& operator++() {
      ++index;
      return *this;
    }
    const_iterator& operator--() {
      --index;
      return *this;
    }

    const_iterator operator++(int) {
      auto prev = *this;
      ++*this;
      return prev;
    }
    const_iterator operator--(int) {
      auto prev = *this;
      --*this;
      return prev;
    }

    const_iterator operator+(std::ptrdiff_t n) const {
      return const_iterator(array, index + n);
    }
    std::ptrdiff_t operator-(const const_iterator& it) const {
      return (std::ptrdiff_t)index - (std::ptrdiff_t)it.index;
    }

    const_iterator& operator+=(std::ptrdiff_t n) {
      index += n;
      return *this;
    }
    const_iterator& operator-=(std::ptrdiff_t n) {
      index -= n;
      return *this;
    }
  };
};

} // namespace caffeine

#endif
