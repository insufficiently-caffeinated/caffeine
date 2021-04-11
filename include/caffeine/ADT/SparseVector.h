#pragma once

#include "caffeine/Support/Assert.h"
#include <climits>
#include <cstddef>
#include <iterator>
#include <llvm/ADT/ArrayRef.h>
#include <variant>
#include <vector>

namespace caffeine {

namespace detail {
  [[noreturn]] void throw_out_of_bounds(size_t n, size_t size);
} // namespace detail

/**
 * A vector that may have holes between elements. This allows for elements to be
 * erased from the vector without invalidating iterators. The primary use case
 * for this data structure is an algorithm that needs to remove values from the
 * vector while iterating it.
 *
 * This allows some operations (e.g. erase) which would not be constant-time in
 * a std::vector to be constant-time for a SparseVector. The trade-off, however,
 * is that a SparseVector is not contiguous.
 *
 * Note: Iterators pointing to a slot which has been erased are only partially
 *       invalidated. They may not be dereferenced but they may still be
 *       incremented and decremented.
 *
 * Operation Complexity Guarantees
 * ===============================
 * - operator[]     O(1)
 * - emplace        O(1) (amortized)
 * - emplace_back   O(1) (amortized)
 * - erase          O(1)
 * - compress       O(n)
 */
template <typename T>
class SparseVector {
private:
  enum { Index, Value };
  using elem_type = std::variant<size_t, T>;
  template <typename It>
  class iterator_base;

  template <typename It>
  friend class iterator_base;

private:
  static constexpr size_t no_head = SIZE_MAX;

  std::vector<elem_type> elements_;
  size_t size_ = 0;
  size_t head_ = no_head;

public:
  using iterator = iterator_base<typename std::vector<elem_type>::iterator>;
  using const_iterator =
      iterator_base<typename std::vector<elem_type>::const_iterator>;

public:
  constexpr SparseVector() = default;
  SparseVector(llvm::ArrayRef<T> values) : size_(values.size()) {
    elements_.reserve(values.size());

    for (const T& value : values) {
      elements_.emplace_back(std::in_place_index<Value>, value);
    }
  }
  SparseVector(std::initializer_list<T> values)
      : SparseVector(llvm::ArrayRef<T>(values)) {}

  constexpr size_t size() const {
    return size_;
  }
  constexpr size_t capacity() const {
    return elements_.capacity();
  }
  constexpr size_t backing_size() const {
    return elements_.size();
  }
  constexpr bool empty() const {
    return size() == 0;
  }

  T& operator[](size_t idx) {
    if (idx >= backing_size())
      detail::throw_out_of_bounds(idx, backing_size());
    return std::get<T>(elements_[idx]);
  }
  const T& operator[](size_t idx) const {
    if (idx >= backing_size())
      detail::throw_out_of_bounds(idx, backing_size());
    return std::get<T>(elements_[idx]);
  }

  template <typename... Args>
  size_t emplace_back(Args&&... args) {
    elements_.emplace_back(std::in_place_index<Value>,
                           std::forward<Args>(args)...);
    size_ += 1;
    return elements_.size() - 1;
  }
  size_t push_back(const T& value) {
    return emplace_back(value);
  }
  size_t push_back(T&& value) {
    return emplace_back(value);
  }

  template <typename... Args>
  size_t emplace(Args&&... args) {
    size_t index = alloc_slot();
    elem_type& slot = elements_[index];

    slot.template emplace<T>(std::forward<Args>(args)...);
    size_ += 1;

    return index;
  }
  size_t insert(const T& value) {
    return emplace(value);
  }
  size_t insert(T&& value) {
    return emplace(std::move(value));
  }

  void erase(size_t idx) {
    CAFFEINE_ASSERT(idx < backing_size());
    elem_type& elem = elements_[idx];
    CAFFEINE_ASSERT(elem.index() == Value);
    elem.template emplace<size_t>(head_);
    head_ = idx;
    size_ -= 1;
  }
  void erase(iterator it) {
    erase(it.index());
  }
  void erase(iterator start, iterator end) {
    for (; start != end; ++start) {
      erase(start);
    }
  }

  void compress() {
    if (size() == backing_size())
      return;

    head_ = no_head;
    size_ = 0;
    auto it = std::remove_if(
        elements_.begin(), elements_.end(),
        [](const elem_type& elem) { return elem.index() == Index; });
    elements_.erase(it, elements_.end());
    size_ = elements_.size();
  }
  void clear() {
    head_ = no_head;
    size_ = 0;
    elements_.clear();
  }

  void reserve(size_t capacity) {
    elements_.reserve(capacity);
  }

private:
  template <typename It>
  class iterator_base {
  private:
    It cur;
    const SparseVector<T>* parent;

    template <typename U>
    friend class SparseVector;

  public:
    iterator_base(It cur, const SparseVector<T>* parent)
        : cur(cur), parent(parent) {}

    using value_type =
        std::remove_reference_t<decltype(std::get<T>(*std::declval<It>()))>;
    using pointer = value_type*;
    using reference = value_type&;
    using difference_type = typename It::difference_type;
    using iterator_category = typename std::bidirectional_iterator_tag;

    reference operator*() const {
      return std::get<T>(*cur);
    }
    pointer operator->() const {
      return std::addressof(**this);
    }

    // Get the index of this iterator within the backing vector.
    size_t index() const {
      return cur - parent->elements_.begin();
    }
    // Check whether this iterator points to a valid element within the vector.
    //
    // Note that it is not valid to call this on the end iterator.
    bool valid() const {
      return cur->index() == Value;
    }

    // Return an iterator that is offset by a specific number of places in the
    // underlying vector.
    //
    // If the position at the given offset from the given iterator is not valid
    // then this will produce an invalid iterator.
    iterator_base<It> offset_by(difference_type offset) const {
      return iterator_base<It>(cur + offset, parent);
    }

    iterator_base<It>& operator++() {
      do {
        cur++;
      } while (cur != parent->elements_.end() && cur->index() == Index);

      return *this;
    }
    iterator_base<It> operator++(int) {
      auto it = *this;
      ++*this;
      return it;
    }

    iterator_base<It>& operator--() {
      do {
        cur--;
      } while (cur->index() == Index);

      return *this;
    }
    iterator_base<It> operator--(int) {
      auto it = *this;
      --*this;
      return it;
    }

    bool operator==(const iterator_base<It>& it) const {
      return cur == it.cur;
    }
    bool operator!=(const iterator_base<It>& it) const {
      return !(*this == it);
    }
  };

public:
  iterator begin() {
    auto it = elements_.begin();
    if (it != elements_.end() && it->index() != Value)
      ++it;

    return iterator(it, this);
  }
  iterator end() {
    return iterator(elements_.end(), this);
  }
  const_iterator begin() const {
    auto it = elements_.begin();
    if (it != elements_.end() && it->index() != Value)
      ++it;

    return const_iterator(it, this);
  }
  const_iterator end() const {
    return const_iterator(elements_.end(), this);
  }

  std::reverse_iterator<iterator> rbegin() {
    return std::reverse_iterator<iterator>(end());
  }
  std::reverse_iterator<iterator> rend() {
    return std::reverse_iterator<const_iterator>(begin());
  }
  std::reverse_iterator<const_iterator> rbegin() const {
    return std::reverse_iterator<iterator>(end());
  }
  std::reverse_iterator<const_iterator> rend() const {
    return std::reverse_iterator<const_iterator>(begin());
  }

  iterator iterator_at(size_t idx) {
    if (idx > backing_size())
      detail::throw_out_of_bounds(idx, backing_size());
    return iterator(elements_.begin() + idx, this);
  }
  const_iterator iterator_at(size_t idx) const {
    if (idx > backing_size())
      detail::throw_out_of_bounds(idx, backing_size());
    return const_iterator(elements_.begin() + idx, this);
  }

private:
  size_t alloc_slot() {
    if (head_ == no_head) {
      elements_.emplace_back(std::in_place_index<Index>, no_head);
      return elements_.size() - 1;
    }

    size_t idx = head_;
    elem_type* slot = &elements_[idx];
    CAFFEINE_ASSERT(slot->index() == Index);
    head_ = std::get<size_t>(*slot);

    return idx;
  }
};

} // namespace caffeine
