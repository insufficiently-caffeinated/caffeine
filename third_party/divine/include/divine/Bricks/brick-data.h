// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * Supplementary data structures
 */

/*
 * (c) 2014-2017 Vladimír Štill <xstill@fi.muni.cz>
 * (c) 2017 Jan Mrázek <email@honzamrazek.cz>
 */

/* Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE. */

#pragma once

#include <array>
#include <initializer_list>
#include <iterator>
#include <map>
#include <memory>
#include <stdexcept>
#include <type_traits>
#include <utility>
#include <vector>

#include "brick-assert.h"
#include "brick-types.h"

namespace brick {
namespace data {

  template <typename K, typename V>
  struct RMap : std::map<K, V> {

    template <typename... Args>
    RMap(Args&&... args) : std::map<K, V>(std::forward<Args>(args)...) {}

    using std::map<K, V>::operator[]; // non-const one
    const V& operator[](const K& key) const {
      return this->at(key);
    }
  };

  template <typename A, typename B>
  struct Bimap;

  namespace _impl {

    template <typename A, typename B>
    struct BimapIx {

      B operator[](const A& key) const {
        return self().left()[key];
      }
      A operator[](const B& key) const {
        return self().right()[key];
      }

      size_t count(const A& key) const {
        return self().left().count(key);
      }
      size_t count(const B& key) const {
        return self().right().count(key);
      }

    private:
      const Bimap<A, B>& self() const {
        return *static_cast<const Bimap<A, B>*>(this);
      }
    };

    template <typename A>
    struct BimapIx<A, A> {};

  } // namespace _impl

  template <typename A, typename B>
  struct Bimap : _impl::BimapIx<A, B> {
    using value_type = std::pair<const A, const B>;

    static_assert(
        std::is_same<value_type,
                     typename std::map<A, const B>::value_type>::value,
        "value_type");

    Bimap() = default;

    Bimap(std::initializer_list<value_type> init) {
      for (auto& p : init)
        insert(std::move(p));
    }

    template <typename Iterator>
    Bimap(Iterator begin, Iterator end) {
      for (; begin != end; ++begin)
        insert(*begin);
    }

    const RMap<A, const B>& left() const {
      return _left;
    }
    const RMap<B, const A>& right() const {
      return _right;
    }

    bool insert(const value_type& value) {
      return insert(value.first, value.second);
    }

    bool insert(const A& a, const B& b) {
      auto l = _left.insert({a, b});
      auto r = _right.insert({b, a});
      if (l.second != r.second) {
        if (l.second)
          _left.erase(l.first);
        else
          _right.erase(r.first);
        throw std::invalid_argument("Bimap: Insert would break bijection");
      }
      return l.second;
    }

    void erase(const value_type& value) {
      auto l = _left.find(value.first);
      auto r = _right.find(value.second);
      if (l != _left.end() && r != _right.end()) {
        _left.erase(l);
        _right.erase(r);
      }
    }

  private:
    RMap<A, const B> _left;
    RMap<B, const A> _right;

    static std::pair<const B, const A>
    swap(const std::pair<const A, const B>& pair) {
      return {pair.second, pair.first};
    }
    static std::pair<const B, const A>
    swap(std::pair<const A, const B>&& pair) {
      return {std::move(pair.second), std::move(pair.first)};
    }
  };

  // a map whose keys are disjunct intervals [from, to) ('from' is inclusive,
  // 'to' is exclusive). Overlapping intervals are not merged, but the old are
  // shortened/deleted/split to accommodate for the newly inserted.

  template <typename K, typename T, typename Cmp = std::less<K>>
  struct IntervalMap {
    struct key_type {
      K from;
      mutable K to;
      bool operator<(const key_type& o) const {
        return Cmp()(from, o.from);
      }
      key_type(K from, K to) : from(from), to(to) {}
      key_type(K from) : from(from), to(from) {}
    };

    using map = std::map<key_type, T>;
    using iterator = typename map::const_iterator;
    using const_iterator = iterator;

    map _map;

    template <typename TT>
    iterator insert(K from, K to, TT&& data) {
      ASSERT(_less(from, to));

      auto it = _map.upper_bound(from);

      if (!_map.empty()) {
        if (it != _map.begin()) {
          --it;
        }
        if (_less(it->first.from, from) && _less(to, it->first.to)) {
          // Splitting an existing interval in two
          _map.insert({{to, it->first.to}, it->second});
          it->first.to = from;
        } else {
          if (_leq(it->first.to, from)) {
            ++it;
          } else if (_less(it->first.from, from) &&
                     _geq(to, it->first.to)) { // Chomp from right
            it->first.to = from;
            ++it;
          }

          while (it != _map.end() && _leq(from, it->first.from) &&
                 _geq(to, it->first.to)) { // Destroy covered
            it = _map.erase(it);
          }

          if (it != _map.end() && _less(it->first.from, to) &&
              _less(to, it->first.to)) { // Chomp from left
            // XXX: once we have a newer stdlib...
            // auto nh = _map.extract( it++ );
            // nh.key().from = to;
            // it = _map.insert( it, std::move( nh ) );

            // It would *probably* be safe to change the key inside the map
            T data = std::move(it->second);
            key_type i = it->first;
            _map.erase(it++);
            i.from = to;
            it = _map.insert(it, {i, std::move(data)});
          }
        }
      }

      return _map.insert(it, {{from, to}, std::forward<TT>(data)});
    }

    const_iterator find(K val) const {
      auto it = _map.upper_bound(val);
      if (it == _map.begin())
        return _map.end();
      --it;
      if (_inside(val, it->first))
        return it;
      return _map.end();
    }

    bool empty() const {
      return _map.empty();
    }
    size_t size() const {
      return _map.size();
    }

    void clear() {
      _map.clear();
    }

    const_iterator begin() const {
      return _map.begin();
    }
    const_iterator cbegin() const {
      return _map.begin();
    }

    const_iterator end() const {
      return _map.end();
    }
    const_iterator cend() const {
      return _map.end();
    }

    friend void swap(IntervalMap& a, IntervalMap& b) {
      using std::swap;
      swap(a._map, b._map);
    }

    bool intersect(K from, K to) {
      ASSERT(_less(from, to));

      typename map::iterator next = _map.upper_bound(from);

      if (next == _map.end()) {
        if (_map.empty())
          return false;

        if (_less(from, std::prev(next)->first.to))
          return true;

        return false;
      }

      if (next == _map.begin()) {
        ASSERT(_leq(from, next->first.from));
        return !_leq(to, next->first.from);
      }

      if (_less(from, next->first.from) && _less(next->first.from, to))
        return true;

      if (_less(from, std::prev(next)->first.to))
        return true;

      return false;
    }

    void _validate() {
      bool prevSet = false;
      T prev;
      for (const auto& p : _map) {
        ASSERT(_less(p.first.from, p.first.to));
        ASSERT(!prevSet || _leq(prev, p.first.from));
        prev = p.first.to;
        prevSet = true;
      }
    }

    static bool _less(const K& a, const K& b) {
      return Cmp()(a, b);
    }

    static bool _eq(const K& a, const K& b) {
      return !_less(a, b) && !_less(b, a);
    }

    static bool _geq(const K& a, const K& b) {
      return !_less(a, b);
    }

    static bool _leq(const K& a, const K& b) {
      return _geq(b, a);
    }

    static bool _inside(const K& p, const key_type& i) {
      return _leq(i.from, p) && _less(p, i.to);
    }
  };

  // a set for efficient storage of intervals [a, b) (i.e. from is inclusive,
  // while to is exclusive)
  template <typename T, typename Cmp = std::less<T>>
  struct IntervalSet {
    using value_type = std::pair<T, T>;
    using map = std::map<T, T, Cmp>;
    using iterator = typename map::const_iterator;
    using const_iterator = iterator;

    struct Inserted {
      Inserted(bool was_contained, bool had_intersection)
          : was_contained(was_contained), had_intersection(had_intersection) {}

      bool was_contained;
      bool had_intersection;
    };

    Inserted insert(value_type v) {
      ASSERT(_less(v.first, v.second));

      typename map::iterator next = _map.upper_bound(v.first),
                             prev =
                                 next == _map.begin() ? next : std::prev(next);
      if ((next == prev || _less(prev->second, v.first)) &&
          (next == _map.end() || _less(v.second, next->first))) {
        _map[v.first] = v.second;
        return {false, false};
      }

      if (_subset(v, *prev))
        return {true, true};

      Inserted i = {false, false};
      if (prev != next && _leq(v.first, prev->second))
        i.had_intersection = _less(v.first, prev->second);
      else
        prev = _map.insert(next, {v.first, next->second});

      while (next != _map.end() && _leq(next->first, v.second)) {
        i.had_intersection |= _less(next->first, v.second);
        prev->second = next->second;
        _map.erase(next++);
      }
      if (_less(prev->second, v.second))
        prev->second = v.second;
      return i;
    }

    Inserted insert(T first, T second) {
      return insert({first, second});
    }

    const_iterator find(T val) const {
      auto it = _map.upper_bound(val);
      if (it == _map.begin())
        return _map.end();
      --it;
      if (_less(it->second, val))
        return _map.end();
      return it;
    }

    bool intersect(T first, T second) {
      ASSERT(_less(first, second));

      typename map::iterator next = _map.upper_bound(first);

      if (next == _map.end()) {
        if (_map.empty())
          return false;

        if (_less(first, std::prev(next)->second))
          return true;

        return false;
      }

      if (next == _map.begin()) {
        ASSERT(_leq(first, next->first));
        return !_leq(second, next->first);
      }

      if (_less(first, next->first) && _less(next->first, second))
        return true;

      if (_less(first, std::prev(next)->second))
        return true;

      return false;
    }

    size_t count(T val) const {
      return find(val) != _map.end();
    }

    bool empty() const {
      return _map.empty();
    }
    size_t size() const {
      return _map.size();
    }

    void clear() {
      _map.clear();
    }

    const_iterator begin() const {
      return _map.begin();
    }
    const_iterator cbegin() const {
      return _map.begin();
    }

    const_iterator end() const {
      return _map.end();
    }
    const_iterator cend() const {
      return _map.end();
    }

    map _map;

    void _validate() {
      [[maybe_unused]] bool prevSet = false;
      [[maybe_unused]] T prev;
      for (const auto& p : _map) {
        ASSERT(_less(p.first, p.second));
        ASSERT(!prevSet || _less(prev, p.first));
        prev = p.second;
        prevSet = true;
      }
    }

    static bool _less(const T& a, const T& b) {
      return Cmp()(a, b);
    }

    static bool _eq(const T& a, const T& b) {
      return !_less(a, b) && !_less(b, a);
    }

    static bool _geq(const T& a, const T& b) {
      return !_less(a, b);
    }

    static bool _leq(const T& a, const T& b) {
      return _geq(b, a);
    }

    static bool _subset(const value_type& a, const value_type& b) {
      return _geq(a.first, b.first) && _leq(a.second, b.second);
    }
  };

  template <typename T>
  void swap(IntervalSet<T>& a, IntervalSet<T>& b) {
    using std::swap;
    swap(a._map, b._map);
  }

  namespace uninitialized {
    template <typename InputIt, typename ForwardIt>
    ForwardIt move(InputIt first, InputIt last, ForwardIt dst) {
      using T = typename std::iterator_traits<ForwardIt>::value_type;
      ForwardIt current = dst;
      try {
        for (; first != last; ++first, ++current)
          new (static_cast<void*>(&*current)) T(*first);
        return current;
      } catch (...) {
        for (; dst != current; ++dst)
          dst->~T();
        throw;
      }
    }

    template <typename T, typename ForwardIt>
    void construct(ForwardIt first, ForwardIt last) {
      ForwardIt current = first;
      try {
        for (; current != last; ++current)
          new (static_cast<void*>(&*current)) T();
      } catch (...) {
        for (; first != current; ++first)
          first->~T();
        throw;
      }
    }
  } // namespace uninitialized

  namespace _impl {

    template <typename T>
    constexpr size_t minimalStackCapacity() {
      return (sizeof(void*) + sizeof(size_t)) / sizeof(T);
    }

    template <typename T>
    constexpr size_t defaultStackCapacity() {
      return minimalStackCapacity<T>() > 4 ? minimalStackCapacity<T>() : 4;
    }

    template <size_t factor = 1>
    struct SizeWrapper {
      static size_t get(size_t x) {
        return (x + factor - 1) / factor;
      }
      static size_t set(size_t x) {
        return x * factor;
      }
    };

  } // namespace _impl

  template <typename T,
            size_t _stackCapacity = _impl::defaultStackCapacity<T>()>
  struct SmallVector {

    static const size_t
        minimal_capacity = _impl::minimalStackCapacity<T>() > _stackCapacity
                               ? _impl::minimalStackCapacity<T>()
                               : _stackCapacity;

    using value_type = T;
    using iterator = T*;
    using const_iterator = const T*;
    using reverse_iterator = std::reverse_iterator<iterator>;
    using const_reverse_iterator = std::reverse_iterator<const_iterator>;

    SmallVector() noexcept : _sos(0) {
      _onstack = true;
    }

    template <typename InputIt>
    SmallVector(InputIt begin, InputIt end) : SmallVector() {
      _resize(std::distance(begin, end));
      std::uninitialized_copy(begin, end, this->begin());
    }

    SmallVector(std::initializer_list<T> init) : SmallVector() {
      _resize(init.size());
      uninitialized::move(init.begin(), init.end(), begin());
    }

    SmallVector(const SmallVector& other) : SmallVector() {
      _resize(other._size);
      std::uninitialized_copy(other.begin(), other.end(), begin());
    }

    SmallVector(SmallVector&& other) noexcept : SmallVector() {
      if (other._onstack) {
        _resize(other._size);
        uninitialized::move(other.begin(), other.end(), begin());
        other.resize(0);
      } else {
        _data.range = other._data.range;
        _size = other._size;
        _onstack = false;
        other._size = 0;
        other._onstack = true;
      }
    }

    ~SmallVector() {
      _drop(begin(), end());
      if (!_onstack)
        operator delete(_data.range.begin);
    }

    SmallVector& operator=(const SmallVector& other) {
      _resize(other._size);
      std::uninitialized_copy(other.begin(), other.end(), begin());
      return *this;
    }

    SmallVector& operator=(SmallVector&& other) noexcept {
      std::swap(_data, other._data);
      std::swap(_sos, other._sos);
      return *this;
    }

    iterator begin() noexcept {
      return _onstack ? _data.data : _data.range.begin;
    }
    const_iterator begin() const noexcept {
      return _onstack ? _data.data : _data.range.begin;
    }
    const_iterator cbegin() const noexcept {
      return begin();
    }

    T& front() noexcept {
      return begin()[0];
    }
    const T& front() const noexcept {
      return begin()[0];
    }

    iterator end() noexcept {
      return begin() + size();
    }
    const_iterator end() const noexcept {
      return begin() + size();
    }
    const_iterator cend() const noexcept {
      return begin() + size();
    }

    T& back() noexcept {
      return end()[-1];
    }
    const T& back() const noexcept {
      return end()[-1];
    }

    reverse_iterator rbegin() {
      return reverse_iterator(end());
    }
    const_reverse_iterator rbegin() const {
      return const_reverse_iterator(end());
    }
    const_reverse_iterator crbegin() const {
      return rbegin();
    }

    reverse_iterator rend() {
      return reverse_iterator(begin());
    }
    const_reverse_iterator rend() const {
      return const_reverse_iterator(begin());
    }
    const_reverse_iterator crend() const {
      return rend();
    }

    T* data() noexcept {
      return begin();
    }
    const T* data() const noexcept {
      return begin();
    }

    size_t size() const noexcept {
      return _size;
    }
    bool empty() const noexcept {
      return _size == 0;
    }

    size_t capacity() const noexcept {
      return _onstack ? minimal_capacity : _data.range.capacity;
    }

    T& operator[](size_t ix) noexcept {
      return begin()[ix];
    }
    const T& operator[](size_t ix) const noexcept {
      return begin()[ix];
    }

    template <typename... Args>
    void emplace_back(Args&&... args) {
      _resize(_size + 1);
      new (end() - 1) T(std::forward<Args>(args)...);
    }

    void push_back(const T& value) {
      emplace_back(value);
    }
    void pop_back() noexcept {
      _resize(size() - 1);
    }

    void resize(size_t count) {
      size_t old = size();
      _resize(count);
      auto from = begin() + old;
      auto to = end();
      if (from < to)
        uninitialized::construct<T>(from, to);
    }

    void resize(size_t count, const T& value) {
      size_t old = size();
      _resize(count);
      auto from = begin() + old;
      auto to = end();
      if (from < to)
        std::uninitialized_fill(from, to, value);
    }

    void reserve(size_t newcap) {
      if (newcap > capacity())
        _reserve(newcap);
    }

    void clear() noexcept {
      _resize(0);
    }
    void clear_and_drop_memory() noexcept {
      clear();
      if (!_onstack) {
        operator delete(_data.range.begin);
        _data.range.begin = nullptr;
        _onstack = true;
      }
    }

    iterator erase(iterator i) {
      std::move(std::next(i), end(), i);
      pop_back();
      return i; // pop_back invalidates only end()
    }

    iterator erase(const_iterator i) {
      // const_cast is safe as the iterator has to point to this vector for
      // the call to erase to be valid (and this is non-const)
      return erase(const_cast<iterator>(i));
    }

  private:
    struct Range {
      T* begin;
      size_t capacity;
    };
    union Data {
      Range range;
      T data[minimal_capacity];
      Data() {}
      ~Data() {}
    };

    Data _data;
    union {
      struct {
        size_t _size : sizeof(size_t) * 8 - 1;
        bool _onstack : 1;
      };
      size_t _sos;
    };

    void _drop(T*, T*, std::true_type) noexcept {}

    void
    _drop(T* from, T* to,
          std::false_type) noexcept(std::is_nothrow_destructible<T>::value) {
      for (; from < to; ++from)
        from->~T();
    }

    void _drop(T* from, T* to) {
      _drop(from, to, std::is_trivially_destructible<T>());
    }

    struct MemDeleter {
      void operator()(T* x) {
        operator delete(x);
      }
    };

    void _reserve(size_t count) {
      if (count < size())
        _drop(begin() + count, end());
      else if (count > capacity()) {
        size_t newcap = 1;
        for (; newcap < count; newcap <<= 1) {}
        std::unique_ptr<T, MemDeleter> nstor(
            static_cast<T*>(operator new(sizeof(T) * newcap)));
        uninitialized::move(begin(), end(), nstor.get());
        _drop(begin(), end());
        if (!_onstack)
          operator delete(_data.range.begin);
        _data.range.begin = nstor.release();
        _data.range.capacity = newcap;
        _onstack = false;
      }
    }

    void _resize(size_t count) {
      _reserve(count);
      _size = count;
    }
  };

  template <typename T>
  struct StdSort {
    template <typename It>
    static void sort(It begin, It end) {
      std::sort(begin, end, comparator());
    }

    template <typename It>
    static It lower_bound(It begin, It end, const T& v) {
      return std::lower_bound(begin, end, v, comparator());
    }

    static auto comparator() {
      return [](const T& a, const T& b) { return a.first < b.first; };
    }
  };

  template <typename T>
  struct InsertSort {
    template <typename It>
    static It lower_bound(It begin, It end, const T& v) {
      if (begin == end)
        return begin;
      auto pivot = begin + (end - begin) / 2;
      if (pivot->first < v.first)
        return lower_bound(pivot + 1, end, v);
      else
        return lower_bound(begin, pivot, v);
    }

    template <typename It>
    static void sort(It begin, It end) {
      int i = 1;
      while (i < end - begin) {
        int j = i;
        while (j > 0 && begin[j - 1].first > begin[j].first) {
          std::swap(begin[j], begin[j - 1]);
          --j;
        }
        ++i;
      }
    }
  };

} // namespace data

} // namespace brick

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab ft=cpp
