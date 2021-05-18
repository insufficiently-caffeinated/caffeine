#pragma once

#include "caffeine/ADT/SparseVector.h"
#include <boost/range/adaptor/filtered.hpp>
#include <boost/range/adaptor/transformed.hpp>
#include <memory>
#include <unordered_map>
#include <utility>

namespace caffeine {

/**
 * A hash map that uses std::weak_ptr as keys. Once the weak_ptr expires it will
 * be implicitly removed from the map. This means that this mainly usable as a
 * cache.
 *
 * Dead values will be removed periodically. To remove them right away you can
 * call purge().
 *
 * Otherwise this class tries to follow a similar API as std::unordered_map.
 *
 * A note on iterators
 * ===================
 * Iterators will iterate over values that have expired. To only iterate over
 * non-expired values call purge() first.
 */
template <typename T, typename V>
class weak_map {
public:
  struct value_type : std::pair<std::weak_ptr<T>, V> {
  private:
    using base_type = std::pair<std::weak_ptr<T>, V>;

  public:
    template <typename A, typename B>
    value_type(A&& first, B&& second)
        : base_type(std::forward<A>(first), std::forward<B>(second)) {}

    template <typename U>
    explicit value_type(std::pair<std::weak_ptr<T>, U*>&& data)
        : base_type(std::move(data.first), std::move(*data.second)) {}
    template <typename U>
    explicit value_type(std::pair<std::weak_ptr<T>, const U*>&& data)
        : base_type(std::move(data.first), *data.second) {}
  };

private:
  using map_type = std::unordered_map<const T*, value_type>;

private:
  template <bool is_const>
  class iterator_base {
  private:
    using inner_valty =
        std::conditional_t<is_const, const weak_map<T, V>::value_type,
                           weak_map<T, V>::value_type>;
    using it_type =
        std::conditional_t<is_const, typename map_type::const_iterator,
                           typename map_type::iterator>;

  private:
    it_type it;

    iterator_base(const it_type& it) : it(it) {}
    iterator_base(it_type&& it) : it(std::move(it)) {}

    friend class weak_map;

  public:
    using value_type = std::remove_const_t<inner_valty>;
    using reference = inner_valty&;
    using pointer = inner_valty*;
    using difference_type =
        typename std::iterator_traits<it_type>::difference_type;
    using iterator_category =
        typename std::iterator_traits<it_type>::iterator_category;

    bool operator==(const iterator_base& oit) const {
      return it == oit.it;
    }
    bool operator!=(const iterator_base& oit) const {
      return it != oit.it;
    }

    reference operator*() {
      return it->second;
    }
    pointer operator->() {
      return &it->second;
    }

    iterator_base& operator++() {
      it++;
      return *this;
    }
    iterator_base operator++(int) {
      return ++it;
    }
  };

public:
  weak_map() = default;

  using iterator = iterator_base<false>;
  using const_iterator = iterator_base<true>;

  bool empty() const {
    return map.empty();
  }
  bool estimated_size() const {
    return map.size();
  }

  void clear() {
    map.clear();
  }

  V& at(const T* key) {
    return map.at(key).second;
  }
  const V& at(const T* key) const {
    return map.at(key).second;
  }

  V& at(const std::shared_ptr<T>& key) {
    return at(key.get());
  }
  const V& at(const std::shared_ptr<T>& key) const {
    return at(key.get());
  }

  V* get(const T* key) noexcept {
    auto it = map.find(key);
    if (it == map.end())
      return nullptr;
    return &it->second.second;
  }
  const V* get(const T* key) const noexcept {
    auto it = map.find(key);
    if (it == map.end())
      return nullptr;
    return &it->second.second;
  }

  V* get(const std::shared_ptr<T>& key) {
    return get(key.get());
  }
  const V* get(const std::shared_ptr<T>& key) const {
    return get(key.get());
  }

  template <typename U>
  std::pair<iterator, bool> emplace(const std::shared_ptr<T>& key, U&& value) {
    if (!key) {
      return {iterator(map.end()), false};
    }

    auto it1 = map.find(key.get());
    if (it1 != map.end() && it1->second.first.expired()) {
      it1->second = value_type(key, std::forward<U>(value));
      return {iterator(it1), true};
    }

    auto [it2, inserted] =
        map.emplace(key.get(), std::make_pair(std::weak_ptr<T>(key), &value));

    if (map.size() == prune_size)
      prune();

    return {iterator(it2), inserted};
  }

  std::pair<iterator, bool> insert(const std::shared_ptr<T>& key,
                                   const V& value) {
    return emplace(key, value);
  }
  std::pair<iterator, bool> insert(const std::shared_ptr<T>& key, V&& value) {
    return emplace(key, value);
  }

  iterator erase(const_iterator pos) {
    return map.erase(pos.it);
  }
  iterator erase(iterator pos) {
    return map.erase(pos.it);
  }
  size_t erase(const std::shared_ptr<T>& key) {
    return erase(key.get());
  }
  size_t erase(const T* key) {
    return map.erase(key);
  }

  iterator find(const T* key) {
    auto it = map.find(key);
    if (it == map.end() || !it->second.first.expired())
      return it;

    map.erase(it);
    return map.end();
  }
  const_iterator find(const T* key) const {
    auto it = map.find(key);
    if (it == map.end() || !it->second.first.expired())
      return it;
    return map.end();
  }
  iterator find(const std::shared_ptr<T>& key) {
    return find(key.get());
  }
  const_iterator iterator_find(const std::shared_ptr<T>& key) const {
    return find(key.get());
  }

  bool contains(const std::shared_ptr<T>& key) const {
    return find(key) != end();
  }
  bool contains(const T* key) const {
    return find(key) != end();
  }

  void prune() {
    for (auto it = map.begin(), end = map.end(); it != end;) {
      if (it->second.first.expired()) {
        it = map.erase(it);
      } else {
        ++it;
      }
    }

    prune_size = map.size() * 2;
  }

  iterator begin() {
    return map.begin();
  }
  iterator end() {
    return map.end();
  }
  const_iterator begin() const {
    return map.begin();
  }
  const_iterator end() const {
    return map.end();
  }

private:
  map_type map;
  size_t prune_size = 16;
};

} // namespace caffeine
