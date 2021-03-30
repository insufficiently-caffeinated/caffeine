#ifndef CAFFEINE_ADT_SLOTMAP_H
#define CAFFEINE_ADT_SLOTMAP_H

#include <cassert>
#include <climits>
#include <deque>
#include <optional>
#include <stdexcept>
#include <type_traits>
#include <utility>

#include "caffeine/ADT/Guard.h"

namespace caffeine {

namespace detail {
  /**
   * Replace a value in the location and return the previous value.
   */
  template <typename T>
  constexpr T replace(T& loc, const T& value) {
    T old = std::move(loc);
    loc = value;
    return old;
  }
} // namespace detail

/**
 * A slot_map is a stably indexed container that offers O(1) insert, remove, and
 * indexing.
 *
 * It allows for stored objects to be referred to by a stably indexed key that
 * is determined by the container at insert time. When copied the same key is
 * valid on both the original slot_map and the new slot_map until that specific
 * entry is removed. Keys are small value-types and accesses are (optionally)
 * checked so there are no lifetime concerns.
 *
 * Each slot keeps a generation counter to avoid the problem where an expired
 * key is used to access a slot that now has a new value.
 *
 * Values can be accessed by key or iterating over the container.
 */
template <typename T>
class slot_map {
  /**
   * Implementation notes
   * ====================
   * The overall implementation here is actually quite simple. We start off by
   * taking a contiguous container (for now this is a std::deque, in the future
   * it may be configurable) and use that to store all our entries. We keep a
   * linked list of free entries by reusing the space that would be used for
   * storing values and when a new value is inserted we either
   *  1. Reuse the empty entry at the front of the free list, or, if that is
   *     empty,
   *  2. Allocate a new entry at the end by calling push_back.
   * Entries are never returned to the underlying container (i.e. we never call
   * pop_back) except when the whole container is being cleared. There are
   * specializations to avoid it being necessary for the underlying container to
   * call all the destructors (see the comment above with_dtor and without_dtor
   * for details about how this is done).
   *
   * Whenever the value within an entry is removed, we increment the generation
   * counter so as to ensure that reads with the previous key no longer work.
   *
   * If in the future we decide that we want to perform some key-packing scheme
   * (e.g. use the top 16 bits of the index to store the generation on a 64-bit
   * CPU) then all the key packing and unpacking logic has been hidden within
   * the pack_key and unpack_key so there should be no need to change the logic
   * within the rest of the implementation.
   */
private:
  struct entry_inner {
    union {
      // Note: There is no case where this should be accessed directly as doing
      //       so is actually UB.
      std::aligned_storage_t<sizeof(T), alignof(T)> storage;
      size_t next;
    };
    size_t has_value : 1;
    size_t gen : sizeof(size_t) * CHAR_BIT - 1;

    constexpr entry_inner(size_t next) : next(next), has_value(false), gen(0) {}

    entry_inner(const entry_inner& e) noexcept(
        std::is_nothrow_copy_constructible_v<T>)
        : has_value(false), gen(e.gen) {
      if (e.has_value) {
        new (value()) T(*e.value());
        has_value = true;
      } else {
        next = e.next;
      }
    }
    entry_inner(entry_inner&& e) noexcept(
        std::is_nothrow_move_constructible_v<T>)
        : gen(e.gen), has_value(false) {
      if (e.has_value) {
        new (value()) T(std::move(*e.value()));
        has_value = true;
      } else {
        next = e.next;
      }
    }

    entry_inner& operator=(const entry_inner&) = delete;
    entry_inner& operator=(entry_inner&&) = delete;

    template <typename... Args>
    void emplace(Args&&... args) {
      if (has_value) {
        has_value = false;
        value()->~T();
      }

      new (value()) T(std::forward<Args>(args)...);
      has_value = true;
    }
    void remove(size_t next) {
      assert(has_value);

      auto guard = make_guard([&] {
        has_value = false;
        this->next = next;
        gen += 1;
      });

      value()->~T();
    }

    constexpr const T* value() const {
      return std::launder(reinterpret_cast<const T*>(&storage));
    }
    constexpr T* value() {
      return std::launder(reinterpret_cast<T*>(&storage));
    }

  protected:
    void destroy() {
      if (has_value) {
        value()->~T();
      }
    }
  };

  /**
   * This little bit of black magic is used to make the destructor of entry
   * trivial if the the destructor of T is trivial. It's not possible to do this
   * within the class, but by selecting between two different structs (which
   * forward the needed functions) at compile time we can get the same effect.
   */
  struct without_dtor : public entry_inner {
    using entry_inner::entry_inner;

    ~without_dtor() = default;
  };
  struct with_dtor : public entry_inner {
    using entry_inner::entry_inner;

    ~with_dtor() {
      entry_inner::destroy();
    }
  };

  using entry = std::conditional_t<std::is_trivially_destructible_v<T>,
                                   without_dtor, with_dtor>;

  static constexpr size_t no_head = ~static_cast<size_t>(0);

  std::deque<entry> entries_;
  size_t head = no_head;

public:
  using key_type = std::pair<size_t, size_t>;
  using value_type = T;

  using reference = T&;
  using const_reference = const T&;
  using pointer = T*;
  using const_pointer = const T*;

  constexpr slot_map() = default;
  constexpr slot_map(const slot_map&) = default;
  constexpr slot_map& operator=(const slot_map&) = default;

  constexpr slot_map(slot_map&& O) noexcept
      : entries_(std::move(O.entries_)), head(O.head) {
    O.head = no_head;
  }
  constexpr slot_map& operator=(slot_map&& O) noexcept {
    head = no_head;
    entries_ = std::move(O.entries_);
    head = detail::replace(O.head, no_head);
    return *this;
  }
  ~slot_map() = default;

  constexpr reference at(const key_type& key) {
    return const_cast<reference>(const_cast<const slot_map*>(this)->at(key));
  }
  constexpr const_reference at(const key_type& key) const {
    auto [index, gen] = unpack_key(key);

    auto& entry = entries_.at(index);
    if (entry.gen != gen || !entry.has_value)
      throw std::out_of_range("at");

    return *entry.value();
  }

  constexpr reference operator[](const key_type& key) noexcept {
    return const_cast<reference>(
        const_cast<const slot_map<T>*>(this)->operator[](key));
  }
  constexpr const_reference operator[](const key_type& key) const noexcept {
    auto [index, gen] = unpack_key(key);

    auto& entry = entries_[index];
    assert(entry.gen == gen);
    return *entry.value();
  }

  void clear() {
    entries_.clear();
    head = no_head;
  }

  template <typename... Args>
  key_type emplace(Args&&... args) {
    size_t index = next_slot();
    auto& entry = entries_[index];

    try {
      entry.emplace(std::forward<Args>(args)...);
    } catch (...) {
      entry.next = head;
      head = index;
      throw;
    }

    return pack_key(index, entry.gen);
  }

  key_type insert(const T& value) {
    return emplace(value);
  }
  key_type insert(T&& value) {
    return emplace(std::move(value));
  }

  std::optional<T> remove(const key_type& key) {
    auto [index, gen] = unpack_key(key);

    if (index > entries_.size())
      return std::nullopt;

    auto& entry = entries_[index];
    if (!entry.has_value || entry.gen != gen)
      return std::nullopt;

    std::optional<T> result{std::move(*entry.value())};
    entry.remove(detail::replace(head, index));
    return result;
  }

private:
  template <typename U>
  struct as_const {
    typedef const U type;
  };

  template <typename U>
  struct identity {
    typedef U type;
  };

  template <template <class> class Transform>
  class iterator_impl {
  private:
    template <typename U>
    using transform_t = typename Transform<U>::type;

    transform_t<slot_map<T>>* map;
    size_t index;

    friend class slot_map<T>;

    iterator_impl(transform_t<slot_map<T>>* map, size_t _index)
        : map(map), index(_index) {
      while (index < map->entries_.size() && !map->entries_[index].has_value)
        index += 1;
    }

  public:
    using pointer = transform_t<T>*;
    using reference = transform_t<T>&;
    using value_type = T;
    using iterator_category = std::bidirectional_iterator_tag;
    using difference_type = std::ptrdiff_t;

    iterator_impl() = default;

    /**
     * Get the key for the current entry.
     */
    key_type key() const {
      return pack_key(index, map->entries_[index].gen);
    }

    reference operator*() {
      return *map->entries_[index].value();
    }
    pointer operator->() {
      return map->entries_[index].value();
    }

    bool operator==(const iterator_impl& o) const {
      return index == o.index;
    }
    bool operator!=(const iterator_impl& o) const {
      return !(*this == o);
    }

    iterator_impl& operator++() {
      do {
        index += 1;
      } while (index < map->entries_.size() && !map->entries_[index].has_value);
      return *this;
    }
    iterator_impl operator++(int) {
      auto prev = *this;
      ++*this;
      return prev;
    }

    iterator_impl& operator--() {
      do {
        index -= 1;
      } while (map->entries_[index].has_value);
      return *this;
    }
    iterator_impl operator--(int) {
      auto prev = *this;
      --*this;
      return prev;
    }
  };

public:
  using iterator = iterator_impl<identity>;
  using const_iterator = iterator_impl<as_const>;

  iterator begin() {
    return iterator(this, 0);
  }
  iterator end() {
    return iterator(this, entries_.size());
  }

  const_iterator begin() const {
    return const_iterator(this, 0);
  }
  const_iterator end() const {
    return const_iterator(this, entries_.size());
  }

  void swap(slot_map<T>& other) {
    using std::swap;

    swap(entries_, other.entries_);
    swap(head, other.head);
  }

  iterator find(const key_type& key) {
    auto [index, gen] = unpack_key(key);

    if (index > entries_.size())
      return end();
    auto& entry = entries_[index];

    if (!entry.has_value || entry.gen != gen)
      return end();

    return iterator(this, index);
  }
  const_iterator find(const key_type& key) const {
    auto [index, gen] = unpack_key(key);

    if (index > entries_.size())
      return end();
    auto& entry = entries_[index];

    if (!entry.has_value || entry.gen != gen)
      return end();

    return const_iterator(this, index);
  }

private:
  size_t next_slot() {
    if (head == no_head) {
      size_t next = entries_.size();
      entries_.emplace_back(no_head);
      return next;
    }

    auto& entry = entries_[head];
    assert(!entry.has_value);
    return detail::replace(head, entry.next);
  }

  // Centralize these so if we decide to do some weird key-packing scheme in the
  // future then the changes needed will be minimal.
  static constexpr key_type pack_key(size_t index, size_t gen) {
    return std::make_pair(index, gen);
  }

  static constexpr std::pair<size_t, size_t> unpack_key(const key_type& key) {
    return key;
  }
};

template <typename T>
void swap(slot_map<T>& a, slot_map<T>& b) {
  a.swap(b);
}

} // namespace caffeine

#endif
