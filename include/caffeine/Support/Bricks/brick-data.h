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
      bool prevSet = false;
      T prev;
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

namespace t_data {

  using namespace brick::data;

#define TC(X)                                                                  \
  do {                                                                         \
    try {                                                                      \
      X;                                                                       \
    } catch (std::out_of_range & ex) {                                         \
      throw std::runtime_error(                                                \
          "caught: " + std::string(ex.what()) + " at " __FILE__ ":" +          \
          std::to_string(__LINE__) + " while evaluating " + #X);               \
    }                                                                          \
  } while (false)
  struct BimapTest {
    TEST(basic) {
      Bimap<int, int> a;
      Bimap<int, long> b;

      a.insert(1, 42);
      b.insert(1, 42);

      Bimap<int, int> ac(a);
      Bimap<int, long> bc(b);

      Bimap<int, int> am(std::move(a));
      Bimap<int, long> bm(std::move(b));

      TC(ASSERT_EQ(am.left()[1], 42L));
      TC(ASSERT_EQ(am.right()[42], 1));
      TC(ASSERT_EQ(bm.left()[1], 42L));
      TC(ASSERT_EQ(bm.right()[42], 1));

      Bimap<int, int> ai{{1, 42}, {2, 3}};
      Bimap<int, long> bi{{1, 42}, {2, 3}};

      TC(ASSERT_EQ(ai.left()[1], 42L));
      TC(ASSERT_EQ(ai.right()[42], 1));
      TC(ASSERT_EQ(ai.left()[2], 3L));
      TC(ASSERT_EQ(ai.right()[3], 2));

      TC(ASSERT_EQ(bi[1], 42L));
      TC(ASSERT_EQ(bi[42L], 1));
      TC(ASSERT_EQ(bi[2], 3L));
      TC(ASSERT_EQ(bi[3L], 2));

      Bimap<int, int> ait(ac.left().begin(), ac.left().end());
      Bimap<int, long> bit(bc.left().begin(), bc.left().end());

      TC(ASSERT_EQ(ait.left()[1], 42L));
      TC(ASSERT_EQ(ait.right()[42], 1));
      TC(ASSERT_EQ(bit[1], 42L));
      TC(ASSERT_EQ(bit[42L], 1));
    }

    TEST(outOfRange) {
      Bimap<int, long> bim{{1, 42}};
      TC(bim[42L]);
      TC(bim[1]);
      try {
        bim[42];
        ASSERT(false);
      } catch (std::out_of_range&) {}
      try {
        bim[1L];
        ASSERT(false);
      } catch (std::out_of_range&) {}
    }

    TEST(bijection) {
      Bimap<int, long> bim;
      bim.insert(1, 42);
      try {
        ASSERT(bim.insert(1, 1) && false);
      } catch (std::invalid_argument&) {}
      ASSERT_EQ(bim.left().size(), 1ul);
      ASSERT_EQ(bim.right().size(), 1ul);
      try {
        ASSERT(bim.insert(2, 42) && false);
      } catch (std::invalid_argument&) {}
      ASSERT_EQ(bim.left().size(), 1ul);
      ASSERT_EQ(bim.right().size(), 1ul);
    }

    TEST(bijection_ctor) {
      try {
        Bimap<int, int> bim{{1, 1}, {1, 42}};
        ASSERT(false);
      } catch (std::invalid_argument&) {}
      try {
        Bimap<int, int> bim{{2, 42}, {1, 42}};
        ASSERT(false);
      } catch (std::invalid_argument&) {}
    }

    TEST(erase) {
      Bimap<int, bool> bim{{1, true}};
      bim.erase({1, false});
      ASSERT_EQ(bim.count(1), 1);
      bim.erase({1, true});
      ASSERT_EQ(bim.count(1), 0);
    }
  };

  struct TestIntervalMap {
    TEST(disjoint_insert) {
      IntervalMap<int, int> map;
      ASSERT(map.empty());
      ASSERT_EQ(map.size(), 0);
      map._validate();

      ASSERT(!map.intersect(0, 1));
      map.insert(0, 1, 0xDA7A1);
      ASSERT_EQ(map.size(), 1);
      map._validate();

      // before
      ASSERT(!map.intersect(-10, -8));
      map.insert(-10, -8, 0xDA7A2);
      ASSERT_EQ(map.size(), 2);
      map._validate();

      // after
      ASSERT(!map.intersect(8, 12));
      map.insert(8, 12, 0xDA7A3);
      ASSERT_EQ(map.size(), 3);
      map._validate();

      // inbetween
      ASSERT(!map.intersect(3, 5));
      map.insert(3, 5, 0xDA7A4);
      ASSERT_EQ(map.size(), 4);
      map._validate();

      // close to, but not overlaping
      ASSERT(!map.intersect(-7, -6));
      map.insert(-7, -6, 0xDA7A5);
      ASSERT_EQ(map.size(), 5);
      map._validate();

      // close to, but not overlaping
      ASSERT(!map.intersect(-3, -1));
      map.insert(-3, 0, 0xDA7A6);
      ASSERT_EQ(map.size(), 6);
      map._validate();

      // close to end
      ASSERT(!map.intersect(13, 15));
      map.insert(13, 15, 0xDA7A7);
      ASSERT_EQ(map.size(), 7);
      map._validate();

      ASSERT_EQ(map.find(0)->second, 0xDA7A1);
      ASSERT_EQ(map.find(-10)->second, 0xDA7A2);
      ASSERT_EQ(map.find(-9)->second, 0xDA7A2);
      ASSERT(map.find(-8) == map.end());
      ASSERT_EQ(map.find(9)->second, 0xDA7A3);
      ASSERT_EQ(map.find(4)->second, 0xDA7A4);
      ASSERT_EQ(map.find(-7)->second, 0xDA7A5);
      ASSERT_EQ(map.find(-1)->second, 0xDA7A6);
      ASSERT_EQ(map.find(13)->second, 0xDA7A7);
      ASSERT(map.find(15) == map.end());
      ASSERT(map.find(20) == map.end());
      ASSERT(map.find(7) == map.end());
      ASSERT(map.find(-20) == map.end());
    }

    TEST(overlap_inserts) {
      IntervalMap<int, int> map;

      // no overlap
      ASSERT(!map.intersect(4, 8));
      map.insert(4, 8, 0xFF01);
      ASSERT(!map.empty());
      ASSERT_EQ(map.size(), 1);
      map._validate();
      ASSERT_EQ(map.find(5)->first.from, 4);
      ASSERT_EQ(map.find(5)->first.to, 8);
      ASSERT_EQ(map.find(5)->second, 0xFF01);
      // [4, 8)

      // no overlap, after end
      ASSERT(!map.intersect(32, 35));
      map.insert(32, 35, 0xFF02);
      ASSERT(!map.empty());
      ASSERT_EQ(map.size(), 2);
      map._validate();
      ASSERT_EQ(map.find(34)->first.from, 32);
      ASSERT_EQ(map.find(34)->first.to, 35);
      // [4, 8) [32, 35)

      // overlaps with end
      ASSERT(map.intersect(5, 10));
      map.insert(5, 10, 0xFF03);
      ASSERT(!map.empty());
      ASSERT_EQ(map.size(), 3);
      map._validate();
      ASSERT_EQ(map.find(5)->first.from, 5);
      ASSERT_EQ(map.find(5)->first.to, 10);
      ASSERT_EQ(map.find(5)->second, 0xFF03);
      ASSERT(map.find(5) == map.find(7));
      ASSERT(map.find(5) == map.find(9));
      ASSERT(map.find(10) == map.end());
      ASSERT_EQ(map.find(4)->first.from, 4);
      ASSERT_EQ(map.find(4)->first.to, 5);
      ASSERT_EQ(map.find(4)->second, 0xFF01);
      // [4, 5) [5, 10) [32, 35)

      // begin-aligned
      ASSERT(map.intersect(5, 8));
      map.insert(5, 8, 0xFF04);
      ASSERT_EQ(map.size(), 4);
      map._validate();
      ASSERT_EQ(map.find(5)->first.from, 5);
      ASSERT_EQ(map.find(5)->first.to, 8);
      ASSERT_EQ(map.find(5)->second, 0xFF04);
      ASSERT_EQ(map.find(8)->first.from, 8);
      ASSERT_EQ(map.find(8)->first.to, 10);
      ASSERT_EQ(map.find(9)->second, 0xFF03);
      // [4, 5) [5, 8), [8, 10) [32, 35)

      // complete precise ovelap
      ASSERT(map.intersect(4, 10));
      map.insert(4, 10, 0xFF05);
      ASSERT_EQ(map.size(), 2);
      map._validate();
      ASSERT_EQ(map.find(5)->first.from, 4);
      ASSERT_EQ(map.find(5)->first.to, 10);
      ASSERT_EQ(map.find(5)->second, 0xFF05);
      ASSERT(map.find(5) == map.find(9));
      // [4, 10) [32, 35)

      // complete overlap, end-aligned
      ASSERT(map.intersect(30, 35));
      map.insert(30, 35, 0xFF06);
      ASSERT_EQ(map.size(), 2);
      map._validate();
      ASSERT_EQ(map.find(34)->first.from, 30);
      ASSERT_EQ(map.find(34)->first.to, 35);
      ASSERT_EQ(map.find(34)->second, 0xFF06);
      // [4, 10) [30, 35)

      // right after end
      ASSERT(!map.intersect(10, 12));
      map.insert(10, 12, 0xFF07);
      ASSERT_EQ(map.size(), 3);
      map._validate();
      ASSERT_EQ(map.find(5)->first.from, 4);
      ASSERT_EQ(map.find(5)->first.to, 10);
      ASSERT_EQ(map.find(10)->first.from, 10);
      ASSERT_EQ(map.find(10)->first.to, 12);
      ASSERT(map.find(12) == map.end());
      // [4, 10) [10, 12) [30, 35)

      // right before end
      ASSERT(!map.intersect(25, 30));
      map.insert(25, 30, 0xFF08);
      ASSERT_EQ(map.size(), 4);
      map._validate();
      ASSERT_EQ(map.find(30)->first.from, 30);
      ASSERT_EQ(map.find(30)->first.to, 35);
      ASSERT_EQ(map.find(28)->first.from, 25);
      ASSERT_EQ(map.find(28)->first.to, 30);
      ASSERT_EQ(map.find(30)->second, 0xFF06);
      ASSERT_EQ(map.find(28)->second, 0xFF08);
      // [4, 10) [10, 12) [25, 30) [30, 35)

      // inbetween
      ASSERT(!map.intersect(15, 20));
      map.insert(15, 20, 0xFF09);
      ASSERT_EQ(map.size(), 5);
      map._validate();
      ASSERT_EQ(map.find(16)->first.from, 15);
      ASSERT_EQ(map.find(16)->first.to, 20);
      // [4, 10) [10, 12) [15, 20) [25, 30) [30, 35)

      // overlapping two
      ASSERT(map.intersect(11, 16));
      map.insert(11, 16, 0xFF0A);
      ASSERT_EQ(map.size(), 6);
      map._validate();
      ASSERT_EQ(map.find(10)->first.from, 10);
      ASSERT_EQ(map.find(10)->first.to, 11);
      ASSERT_EQ(map.find(14)->first.from, 11);
      ASSERT_EQ(map.find(14)->first.to, 16);
      ASSERT_EQ(map.find(16)->first.from, 16);
      ASSERT_EQ(map.find(16)->first.to, 20);
      // [4, 10) [10, 11) [11, 16) [16, 20) [25, 30) [30, 35)

      // right inbetween
      ASSERT(!map.intersect(20, 25));
      map.insert(20, 25, 0xFF0B);
      ASSERT_EQ(map.size(), 7);
      map._validate();
      ASSERT_EQ(map.find(16)->first.from, 16);
      ASSERT_EQ(map.find(16)->first.to, 20);
      ASSERT_EQ(map.find(20)->first.from, 20);
      ASSERT_EQ(map.find(20)->first.to, 25);
      ASSERT_EQ(map.find(25)->first.from, 25);
      ASSERT_EQ(map.find(25)->first.to, 30);
      // [4, 10) [10, 11) [11, 16) [16, 20) [20, 25) [25, 30) [30, 35)

      // no overlap, before first
      ASSERT(!map.intersect(-5, -2));
      map.insert(-5, -2, 0xFF0C);
      ASSERT_EQ(map.size(), 8);
      map._validate();
      // [-5, -2) [4, 10) [10, 11) [11, 16) [16, 20) [20, 25) [25, 30) [30, 35)

      // spanning multiple succeeding with start overlap
      ASSERT(map.intersect(18, 40));
      map.insert(18, 40, 0xFF0D);
      map._validate();
      ASSERT_EQ(map.size(), 6);
      ASSERT_EQ(map.find(16)->first.from, 16);
      ASSERT_EQ(map.find(16)->first.to, 18);
      ASSERT_EQ(map.find(30)->first.from, 18);
      ASSERT_EQ(map.find(30)->first.to, 40);
      ASSERT(map.find(18) == map.find(30));
      ASSERT(map.find(20) == map.find(30));
      ASSERT(map.find(25) == map.find(30));
      ASSERT(map.find(35) == map.find(30));
      // [-5, -2) [4, 10) [10, 11) [11, 16) [16, 18) [18, 40)

      // spanning multiple succeeding with end overlap
      ASSERT(map.intersect(-10, 14));
      map.insert(-10, 14, 0xFF0E);
      map._validate();
      ASSERT_EQ(map.size(), 4);
      ASSERT_EQ(map.find(4)->first.from, -10);
      ASSERT_EQ(map.find(4)->first.to, 14);
      ASSERT(map.find(-5) == map.find(4));
      ASSERT(map.find(-10) == map.find(4));
      ASSERT(map.find(10) == map.find(4));
      ASSERT(map.find(11) == map.find(4));
      ASSERT_EQ(map.find(30)->first.from, 18);
      ASSERT_EQ(map.find(30)->first.to, 40);
      // [-10, 14) [14, 16) [16, 18) [18, 40)

      // spanning multiple succeeding with both overlaps
      map.insert(2, 25, 0xFF0F);
      ASSERT_EQ(map.size(), 3);
      map._validate();
      ASSERT_EQ(map.find(14)->first.from, 2);
      ASSERT_EQ(map.find(14)->first.to, 25);
      ASSERT_EQ(map.find(25)->first.from, 25);
      ASSERT_EQ(map.find(25)->first.to, 40);
      ASSERT_EQ(map.find(0)->first.from, -10);
      ASSERT_EQ(map.find(0)->first.to, 2);
      // [-10, 2) [2, 25) [25, 40)

      // splitting the last interval in two
      map.insert(30, 35, 0xFF10);
      ASSERT_EQ(map.size(), 5);
      map._validate();
      ASSERT_EQ(map.find(27)->first.from, 25);
      ASSERT_EQ(map.find(27)->first.to, 30);
      ASSERT_EQ(map.find(32)->first.from, 30);
      ASSERT_EQ(map.find(32)->first.to, 35);
      ASSERT_EQ(map.find(37)->first.from, 35);
      ASSERT_EQ(map.find(37)->first.to, 40);
      ASSERT_EQ(map.find(27)->second, 0xFF0D);
      ASSERT_EQ(map.find(32)->second, 0xFF10);
      ASSERT_EQ(map.find(37)->second, 0xFF0D);
      // [-10, 2) [2, 25) [25, 30) [30, 35) [35, 40)

      // splitting the first interval in two
      map.insert(-5, 0, 0xFF11);
      ASSERT_EQ(map.size(), 7);
      map._validate();
      ASSERT_EQ(map.find(-9)->first.from, -10);
      ASSERT_EQ(map.find(-9)->first.to, -5);
      ASSERT_EQ(map.find(-4)->first.from, -5);
      ASSERT_EQ(map.find(-4)->first.to, 0);
      ASSERT_EQ(map.find(1)->first.from, 0);
      ASSERT_EQ(map.find(1)->first.to, 2);
      ASSERT_EQ(map.find(-9)->second, 0xFF0E);
      ASSERT_EQ(map.find(-4)->second, 0xFF11);
      ASSERT_EQ(map.find(1)->second, 0xFF0E);
      // [-10, -5) [-5, 0) [0, 2) [2, 25) [25, 30) [30, 35) [35, 40)

      // spanning multiple, aligned begin and end
      map.insert(0, 35, 0xFF12);
      map._validate();
      ASSERT_EQ(map.size(), 4);
      ASSERT_EQ(map.find(-1)->first.from, -5);
      ASSERT_EQ(map.find(-1)->first.to, 0);
      ASSERT_EQ(map.find(-1)->second, 0xFF11);
      ASSERT_EQ(map.find(0)->first.from, 0);
      ASSERT_EQ(map.find(0)->first.to, 35);
      ASSERT_EQ(map.find(0)->second, 0xFF12);
      ASSERT(map.find(0) == map.find(2));
      ASSERT(map.find(0) == map.find(25));
      ASSERT(map.find(0) == map.find(33));
      ASSERT_EQ(map.find(35)->first.from, 35);
      ASSERT_EQ(map.find(35)->first.to, 40);
      ASSERT_EQ(map.find(35)->second, 0xFF0D);
      // [-10, -5) [-5, 0) [0, 35) [35, 40)

      // clearing
      map.clear();
      map._validate();
      ASSERT_EQ(map.size(), 0);
      ASSERT(map.empty());

      map.insert(10, 20, 0xFE01);
      map._validate();
      ASSERT_EQ(map.size(), 1);
      ASSERT_EQ(map.find(15)->second, 0xFE01);
      // [10, 20)

      // no overlap, before the only entry
      map.insert(0, 5, 0xFE02);
      map._validate();
      ASSERT_EQ(map.size(), 2);
      ASSERT_EQ(map.find(15)->second, 0xFE01);
      ASSERT_EQ(map.find(1)->second, 0xFE02);
      // [0, 5) [10, 20)

      // no overlap, before the first entry
      map.insert(-10, -5, 0xFE03);
      map._validate();
      ASSERT_EQ(map.size(), 3);
      // [-10, -5) [0, 5) [10, 20)

      // begin between, one destroyed, end overlaps
      map.insert(-2, 15, 0xFE04);
      map._validate();
      ASSERT_EQ(map.size(), 3);
      ASSERT_EQ(map.find(15)->second, 0xFE01);
      ASSERT_EQ(map.find(0)->second, 0xFE04);
      // [-10, -5) [-2, 15) [15, 20)

      // no overlap, after last
      map.insert(30, 40, 0xFE05);
      map._validate();
      ASSERT_EQ(map.size(), 4);
      // [-10, -5) [-2, 15) [15, 20) [30, 40)

      // begin overlaps, two destroyed, end between
      map.insert(-7, 25, 0xFE06);
      map._validate();
      ASSERT_EQ(map.size(), 3);
      ASSERT_EQ(map.find(15)->second, 0xFE06);
      ASSERT_EQ(map.find(0)->second, 0xFE06);
      ASSERT_EQ(map.find(-9)->second, 0xFE03);
      ASSERT(map.find(25) == map.end());
      // [-10, -7) [-7, 25) [30, 40)

      // everything destroyed
      map.insert(-20, 50, 0xFE07);
      map._validate();
      ASSERT_EQ(map.size(), 1);
      ASSERT_EQ(map.find(-10)->second, 0xFE07);
      ASSERT_EQ(map.find(25)->second, 0xFE07);
      ASSERT_EQ(map.find(40)->second, 0xFE07);
      // [-20, 50)
    }
  };

  struct TestIntervalSet {

    TEST(disjoint_insert) {
      IntervalSet<int> set;
      ASSERT(set.empty());
      ASSERT_EQ(set.size(), 0);
      set._validate();

      ASSERT(!set.intersect(0, 1));
      auto i = set.insert(0, 1);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 1);
      set._validate();

      // before
      ASSERT(!set.intersect(-10, -8));
      i = set.insert(-10, -8);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();

      // after
      ASSERT(!set.intersect(8, 12));
      i = set.insert(8, 12);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 3);
      set._validate();

      // inbetween
      ASSERT(!set.intersect(3, 5));
      i = set.insert(3, 5);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 4);
      set._validate();

      // close to, but not overlaping
      ASSERT(!set.intersect(-7, -6));
      i = set.insert(-7, -6);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 5);
      set._validate();

      // close to, but not overlaping
      ASSERT(!set.intersect(-3, -1));
      i = set.insert(-3, -1);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 6);
      set._validate();

      // close to end
      ASSERT(!set.intersect(13, 15));
      i = set.insert(13, 15);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 7);
      set._validate();
    }

    TEST(overlap_inserts) {
      IntervalSet<int> set;
      ASSERT(set.empty());
      ASSERT_EQ(set.size(), 0);
      set._validate();

      // no overlap
      ASSERT(!set.intersect(4, 8));
      auto i = set.insert(4, 8);
      ASSERT(!set.empty());
      ASSERT_EQ(set.size(), 1);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 8);

      // no overlap, after end
      ASSERT(!set.intersect(32, 35));
      i = set.insert(32, 35);
      ASSERT(!set.empty());
      ASSERT_EQ(set.size(), 2);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      set._validate();
      ASSERT_EQ(set.find(34)->first, 32);
      ASSERT_EQ(set.find(34)->second, 35);

      // overlaps with end
      ASSERT(set.intersect(5, 10));
      i = set.insert(5, 10);
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 10);

      // subset
      ASSERT(set.intersect(5, 8));
      i = set.insert(5, 8);
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 10);

      // the same
      ASSERT(set.intersect(4, 10));
      i = set.insert(4, 10);
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 10);

      // overlaps with begin
      ASSERT(set.intersect(30, 35));
      i = set.insert(30, 35);
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();
      ASSERT_EQ(set.find(34)->first, 30);
      ASSERT_EQ(set.find(34)->second, 35);

      // right after end
      ASSERT(!set.intersect(10, 12));
      i = set.insert(10, 12);
      ASSERT(!set.empty());
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 12);

      // right before end
      ASSERT(!set.intersect(25, 30));
      i = set.insert(25, 30);
      ASSERT(!set.empty());
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();
      ASSERT_EQ(set.find(34)->first, 25);
      ASSERT_EQ(set.find(34)->second, 35);

      // inbetween
      ASSERT(!set.intersect(15, 20));
      i = set.insert(15, 20);
      ASSERT(!set.empty());
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 3);
      set._validate();
      ASSERT_EQ(set.find(16)->first, 15);
      ASSERT_EQ(set.find(16)->second, 20);

      // two sided overlap
      ASSERT(set.intersect(10, 16));
      i = set.insert(10, 16);
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();
      ASSERT_EQ(set.find(16)->first, 4);
      ASSERT_EQ(set.find(16)->second, 20);

      // right inbetween
      ASSERT(!set.intersect(20, 25));
      i = set.insert(20, 25);
      ASSERT(!set.empty());
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 1);
      set._validate();
      ASSERT_EQ(set.find(16)->first, 4);
      ASSERT_EQ(set.find(16)->second, 35);

      // no overlap, before first
      ASSERT(!set.intersect(-5, -2));
      i = set.insert(-5, -2);
      ASSERT(!set.empty());
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.size(), 2);
      set._validate();

      // spanning multiple succeeding with start overlap
      set.insert(40, 45);
      set.insert(50, 55);
      set.insert(60, 65);
      ASSERT_EQ(set.size(), 5);
      ASSERT(set.intersect(30, 70));
      i = set.insert(30, 70);
      ASSERT_EQ(set.size(), 2);
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.find(16)->first, 4);
      ASSERT_EQ(set.find(16)->second, 70);
      set._validate();

      // spanning multiple succeeding without start overlap
      set.insert(80, 85);
      set.insert(90, 95);
      set.insert(100, 105);
      ASSERT_EQ(set.size(), 5);
      ASSERT(set.intersect(75, 102));
      i = set.insert(75, 102);
      ASSERT_EQ(set.size(), 3);
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.find(80)->first, 75);
      ASSERT_EQ(set.find(80)->second, 105);
      set._validate();

      // the same but the inserted subsumes all in between and adds to them
      i = set.insert(2, 110);
      ASSERT_EQ(set.size(), 2);
      ASSERT(set.intersect(2, 110));
      ASSERT(!set.empty());
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      ASSERT_EQ(set.find(80)->first, 2);
      ASSERT_EQ(set.find(80)->second, 110);
      set._validate();
    }

    TEST(touch) {
      IntervalSet<int> set;
      set.insert(1, 2);
      ASSERT(!set.intersect(0, 1));
      auto i = set.insert(0, 1);
      ASSERT(!i.had_intersection);
      ASSERT(!set.intersect(2, 3));
      ASSERT_EQ(set.size(), 1);
      i = set.insert(2, 3);
      ASSERT(!i.had_intersection);
      ASSERT_EQ(set.size(), 1);
      set._validate();
    }

    auto overlap_start() {
      IntervalSet<int> set;
      ASSERT(set.empty());
      ASSERT_EQ(set.size(), 0);
      set._validate();

      auto i = set.insert(4, 8);
      ASSERT(!set.empty());
      ASSERT_EQ(set.size(), 1);
      ASSERT(!i.had_intersection);
      ASSERT(!i.was_contained);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 8);
      return set;
    }

    TEST(overlap_second_insert_back_subset) {
      auto set = overlap_start();

      ASSERT(set.intersect(4, 12));
      auto i = set.insert(4, 12);
      ASSERT(!set.empty());
      ASSERT_EQ(set.size(), 1);
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 12);
    }

    TEST(overlap_second_insert_back_nosubset) {
      auto set = overlap_start();

      ASSERT(set.intersect(6, 12));
      auto i = set.insert(6, 12);
      ASSERT(!set.empty());
      ASSERT_EQ(set.size(), 1);
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 4);
      ASSERT_EQ(set.find(5)->second, 12);
    }

    TEST(overlap_second_insert_front_subset) {
      auto set = overlap_start();

      ASSERT(set.intersect(0, 8));
      auto i = set.insert(0, 8);
      ASSERT(!set.empty());
      ASSERT_EQ(set.size(), 1);
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 0);
      ASSERT_EQ(set.find(5)->second, 8);
    }

    TEST(overlap_second_insert_front_nosubset) {
      auto set = overlap_start();

      ASSERT(set.intersect(0, 6));
      auto i = set.insert(0, 6);
      ASSERT(!set.empty());
      ASSERT_EQ(set.size(), 1);
      ASSERT(i.had_intersection);
      ASSERT(!i.was_contained);
      set._validate();
      ASSERT_EQ(set.find(5)->first, 0);
      ASSERT_EQ(set.find(5)->second, 8);
    }
  };

  struct TestSmallVector {

    struct A {
      A(int& v) : v(&v) {
        v = 1;
      }
      ~A() {
        *v = 2;
      }
      int* v;
    };

    TEST(basic) {
      SmallVector<long> vec_l;
      vec_l.emplace_back(1);
      ASSERT_EQ(vec_l[0], 1);
      vec_l.emplace_back(2);
      ASSERT_EQ(vec_l[1], 2);
      vec_l.emplace_back(3);
      vec_l.emplace_back(4);
      vec_l.emplace_back(5);
      ASSERT_EQ(vec_l[4], 5);
      ASSERT_EQ(vec_l.end()[-1], 5);
      SmallVector<int> vec_i;
      for (int i = 1; i < 128; ++i) {
        vec_i.emplace_back(i);
        ASSERT_EQ(i, vec_i.size());
        ASSERT_LEQ(i, vec_i.capacity());
      }
      int v = 0;
      {
        SmallVector<A> vec_a;
        vec_a.emplace_back(v);
        ASSERT_EQ(v, 1);
      }
      ASSERT_EQ(v, 2);
    }

    TEST(resize) {
      SmallVector<int, 8> vec;
      ASSERT_EQ(vec.capacity(), 8);
      ASSERT_EQ(vec.size(), 0);
      vec.resize(14);
      ASSERT_EQ(vec.capacity(), 16);
      ASSERT_EQ(vec.size(), 14);
      vec.resize(200);
      ASSERT_EQ(vec.capacity(), 256);
      ASSERT_EQ(vec.size(), 200);
      vec.resize(512);
      ASSERT_EQ(vec.capacity(), 512);
      ASSERT_EQ(vec.size(), 512);
      vec.resize(16);
      ASSERT_EQ(vec.capacity(), 512);
      ASSERT_EQ(vec.size(), 16);
      vec[0] = 42;
      vec.resize(1);
      ASSERT_EQ(vec.capacity(), 512);
      ASSERT_EQ(vec.size(), 1);
      ASSERT_EQ(vec[0], 42);
      vec.resize(0);
      ASSERT_EQ(vec.capacity(), 512);
      ASSERT_EQ(vec.size(), 0);
    }

    struct Tracker {
      Tracker(int& cnt) : _cnt(&cnt) {
        ++(*_cnt);
      }
      Tracker(const Tracker& o) : _cnt(o._cnt) {
        ++(*_cnt);
      }
      ~Tracker() {
        --(*_cnt);
      }
      int* _cnt;
    };

    TEST(resize_copy) {
      SmallVector<Tracker, 4> vec;
      int cnt = 0;
      vec.resize(16, Tracker(cnt));
      ASSERT_EQ(vec.size(), 16);
      ASSERT_EQ(vec.capacity(), 16);
      ASSERT_EQ(cnt, 16);
      vec.resize(24, Tracker(cnt));
      ASSERT_EQ(vec.size(), 24);
      ASSERT_EQ(vec.capacity(), 32);
      ASSERT_EQ(cnt, 24);
      vec.resize(8, Tracker(cnt));
      ASSERT_EQ(vec.size(), 8);
      ASSERT_EQ(vec.capacity(), 32);
      ASSERT_EQ(cnt, 8);
      vec.clear();
      ASSERT_EQ(vec.size(), 0);
      ASSERT_EQ(vec.capacity(), 32);
      ASSERT_EQ(cnt, 0);
      vec.clear_and_drop_memory();
      ASSERT_EQ(vec.size(), 0);
      ASSERT_EQ(vec.capacity(), 4);
      vec.resize(2, Tracker(cnt));
      ASSERT_EQ(vec.size(), 2);
      ASSERT_EQ(vec.capacity(), 4);
      ASSERT_EQ(cnt, 2);
      vec.clear_and_drop_memory();
      ASSERT_EQ(vec.size(), 0);
      ASSERT_EQ(vec.capacity(), 4);
    }

    TEST(reserve) {
      SmallVector<int, 8> vec;
      ASSERT_EQ(vec.capacity(), 8);
      ASSERT_EQ(vec.size(), 0);
      vec.reserve(14);
      ASSERT_EQ(vec.capacity(), 16);
      ASSERT_EQ(vec.size(), 0);
      vec.reserve(200);
      ASSERT_EQ(vec.capacity(), 256);
      ASSERT_EQ(vec.size(), 0);
      vec.reserve(512);
      ASSERT_EQ(vec.capacity(), 512);
      ASSERT_EQ(vec.size(), 0);
      vec.reserve(16);
      ASSERT_EQ(vec.capacity(), 512);
      ASSERT_EQ(vec.size(), 0);
      vec.reserve(0);
      ASSERT_EQ(vec.capacity(), 512);
      ASSERT_EQ(vec.size(), 0);
    }

    template <int def>
    struct Int {
      Int(int i) : v(i) {}
      Int() : v(def) {}
      ~Int() {
        v = 0;
      }
      operator int() {
        return v;
      }
      volatile int v;
    };

    TEST(defcon) {
      SmallVector<Int<42>, 8> vec;
      std::fill(vec.data(), vec.data() + 8, 0);

      vec.resize(4);
      for (int i = 0; i < 4; ++i)
        ASSERT_EQ(int(vec[i]), 42);
      for (int i = 4; i < 8; ++i)
        ASSERT_EQ(int(vec[i]), 0);

      vec.resize(16);
      for (int i = 0; i < 16; ++i)
        ASSERT_EQ(int(vec[i]), 42);

      vec.resize(8);
      for (int i = 0; i < 8; ++i)
        ASSERT_EQ(int(vec[i]), 42);
      for (int i = 8; i < 16; ++i)
        ASSERT_EQ(int(vec[i]), 0);

      vec.clear();
      for (int i = 0; i < 16; ++i)
        ASSERT_EQ(int(vec[i]), 0);
    }

    TEST(push) {
      SmallVector<int> vec;
      for (int i = 0; i < 512; ++i) {
        vec.emplace_back(i);
        ASSERT_EQ(vec.back(), i);
        ASSERT_EQ(vec.size(), i + 1);
        ASSERT_LEQ(i + 1, vec.capacity());
      }
      for (int i = 511; i >= 256; --i) {
        ASSERT_EQ(vec.back(), i);
        vec.pop_back();
        ASSERT_EQ(vec.size(), i);
        ASSERT_EQ(vec.capacity(), 512);
      }
      for (int i = 256; i < 512; ++i) {
        vec.emplace_back(i);
        ASSERT_EQ(vec.back(), i);
        ASSERT_EQ(vec.size(), i + 1);
        ASSERT_EQ(vec.capacity(), 512);
      }
      for (int i = 0; i < 512; ++i)
        ASSERT_EQ(vec[i], i);
      ASSERT_EQ(vec.size(), 512);
      ASSERT_EQ(vec.capacity(), 512);
      while (!vec.empty()) {
        ASSERT_LEQ(1, vec.size());
        vec.pop_back();
        ASSERT_LEQ(0, vec.size());
      }
      ASSERT_EQ(0, vec.size());
    }

    TEST(move) {
      // when on stack, vector has to move elements around
      SmallVector<int, 2> x{1, 2};
      int *px = &x[0], *py, *pz;
      SmallVector<int, 2> y = std::move(x);
      ASSERT_NEQ(px, (py = &y[0])); // on stack
      x = std::move(y);
      ASSERT_EQ(px, &x[0]);
      ASSERT_NEQ(px, py);

      while (x.capacity() == x.minimal_capacity)
        x.push_back(
            3); // move it out of stack, now move should preserve references
      ASSERT_NEQ(px, &x[0]);
      px = &x[0];
      SmallVector<int, 2> z(std::move(x));
      pz = &z[0];
      ASSERT_EQ(px, pz);
      y = std::move(z);
      ASSERT_NEQ(py, &y[0]);
      py = &y[0];
      ASSERT_EQ(pz, py);
    }

    TEST(erase) {
      SmallVector<int, 4> x{1, 2, 3, 4};
      auto i = x.erase(x.begin() + 2);
      ASSERT_EQ(*i, 4);
      ASSERT_EQ(i, std::prev(x.end()));
      ASSERT_EQ(x.size(), 3);
      ASSERT_EQ(x[0], 1);
      ASSERT_EQ(x[1], 2);
      ASSERT_EQ(x[2], 4);

      i = x.erase(std::prev(x.end()));
      ASSERT_EQ(i, x.end());
      ASSERT_EQ(x.size(), 2);
      ASSERT_EQ(x.back(), 2);
    }
  };

#undef TC
} // namespace t_data

} // namespace brick

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab ft=cpp
