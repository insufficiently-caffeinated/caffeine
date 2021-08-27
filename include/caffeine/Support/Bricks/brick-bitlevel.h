// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * Utilities and data structures for bit-level manipulation and data packing.
 */

/*
 * (c) 2013-2014 Jiří Weiser <xweiser1@fi.muni.cz>
 * (c) 2013 Petr Ročkai <me@mornfall.net>
 * (c) 2015 Vladimír Štill <xstill@fi.muni.cz>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#pragma once

#include "brick-assert.h"

#include <limits>
#include <type_traits>

#ifdef __linux
#include <byteswap.h>
#include <sys/types.h>
#elif !defined LITTLE_ENDIAN // if defined _WIN32
#define BYTE_ORDER 1234
#define LITTLE_ENDIAN 1234
#endif

#include <atomic>
#include <cstring>

namespace brq {

/* Align a value to the closest higher value divisible by 'a', unless it's
 * already divisible by 'a'. */

template <typename T1, typename T2>
constexpr inline T1 align(T1 v, T2 a) {
  return (v % T1(a)) ? (v + T1(a) - (v % T1(a))) : v;
}

/* Same but in the opposite direction. */

template <typename T1, typename T2>
constexpr inline T1 downalign(T1 v, T2 a) {
  return v - (v % T1(a));
}

/* A safe version of reinterpret_cast that works between arbitrary
 * trivially-constructible values of the same size. The maybe version
 * checks the same-size constraint at runtime. The one-parameter version is
 * used like standard C++ casts. */

template <typename F, typename T>
void maybe_bitcast(const F& f, T& t) {
  ASSERT(sizeof(T) == sizeof(F));
  memcpy(&t, &f, sizeof(T));
}

template <typename F, typename T>
void bitcast(const F& f, T& t) {
  static_assert(sizeof(F) == sizeof(T));
  maybe_bitcast(f, t);
}

template <typename T, typename F>
T bitcast(F f) {
  T t;
  bitcast(f, t);
  return t;
}

template <typename T>
void bitcast_mem(const uint8_t* mem, T& t) {
  memcpy(&t, mem, sizeof(T));
}

template <typename type>
constexpr size_t storage_size() {
  if constexpr (std::is_same_v<type, void>)
    return 0;
  else
    return std::is_empty_v<type> ? 0 : sizeof(type);
}
} // namespace brq

namespace brick::bitlevel {
using brq::align;
using brq::bitcast;
using brq::downalign;
using brq::maybe_bitcast;

/* Compile-time bit manipulation utilities, useful for constructing bit masks.
 */

namespace compiletime {
  template <typename T>
  constexpr unsigned MSB(T x) {
    return x > 1 ? 1 + MSB(x >> 1) : 0;
  }

  template <typename T>
  constexpr T fill(T x) {
    return x ? x | compiletime::fill(x >> 1) : x;
  }

  template <typename T>
  constexpr T ones(int bits) {
    return bits ? (T(1) << (bits - 1)) | compiletime::ones<T>(bits - 1) : 0;
  }
} // namespace compiletime

using compiletime::ones;

/* Compose 2 unsigned integers to build bitvectors of unusual lengths (80, 128
 * bits), with basic bitwise and shift operators. See the bitvec template
 * below. */

template <typename T>
static constexpr T shift_left(T v, size_t bits) {
  if (bits >= sizeof(T) * 8)
    return T();
  else
    return v << bits;
}

template <typename T>
static constexpr T shift_right(T v, size_t bits) {
  if (bits >= sizeof(T) * 8)
    return T();
  else
    return v >> bits;
}

template <typename L, typename H>
struct bvpair {
  L low;
  H high;
  constexpr bvpair(L l, H h = 0) : low(l), high(h) {}
  constexpr bvpair() = default;
  explicit constexpr operator bool() const {
    return low || high;
  }

  explicit constexpr operator uint64_t() const {
    return low;
  }
  explicit constexpr operator uint32_t() const {
    return low;
  }
  explicit constexpr operator uint16_t() const {
    return low;
  }
  explicit constexpr operator uint8_t() const {
    return low;
  }
  explicit constexpr operator int() const {
    return low;
  }

  constexpr bvpair operator<<(bvpair p) const {
    return p.high ? bvpair(0, 0) : *this << p.low;
  }

  constexpr bvpair operator>>(bvpair p) const {
    return p.high ? bvpair(0, 0) : *this >> p.low;
  }

  constexpr bvpair operator<<(int s) const {
    int rem = 8 * sizeof(low) - s;
    int unshift = std::max(rem, 0);
    int shift = rem < 0 ? -rem : 0;
    H carry = shift_right(low & ~ones<L>(unshift), unshift);
    return bvpair(shift_left(low, s),
                  shift_left(high, s) | shift_left(carry, shift));
  }

  constexpr bvpair operator>>(int s) const {
    int rem = 8 * sizeof(low) - s;
    int unshift = std::max(rem, 0);
    int shift = rem < 0 ? -rem : 0;
    L carry = L(high & ones<H>(s)) << unshift;
    return bvpair((low >> s) | (carry >> shift), high >> s);
  }

  constexpr bvpair operator&(bvpair o) const {
    return bvpair(o.low & low, o.high & high);
  }
  constexpr bvpair operator|(bvpair o) const {
    return bvpair(o.low | low, o.high | high);
  }
  constexpr bvpair operator^(bvpair o) const {
    return bvpair(o.low ^ low, o.high ^ high);
  }
  bvpair& operator|=(bvpair o) {
    return *this = *this | o;
  }

  constexpr bool operator==(bvpair o) const {
    return o.low == low && o.high == high;
  }
  constexpr bool operator!=(bvpair o) const {
    return o.low != low || o.high != high;
  }

  constexpr bool operator>=(bvpair o) const {
    return high == o.high ? low >= o.low : high > o.high;
  }

  constexpr bvpair operator+() const {
    return *this;
  }
  constexpr bvpair operator~() const {
    return bvpair(~low, ~high);
  }
} __attribute__((packed));

template <typename stream, typename a, typename b>
auto operator<<(stream& o, const bvpair<a, b>& p) -> decltype(o << p.high) {
  return o << p.high << "_" << p.low;
}

/* Types which can store bit vectors of a given bit size. Might be bigger than
 * required. Currently supports at most 128 bits (256b would be possible with
 * the 128b integers compiler extensions). */

template <int i>
struct _bitvec {
  using T = typename _bitvec<i + 1>::T;
};
template <>
struct _bitvec<8> {
  using T = uint8_t;
};
template <>
struct _bitvec<16> {
  using T = uint16_t;
};
template <>
struct _bitvec<32> {
  using T = uint32_t;
};
template <>
struct _bitvec<64> {
  using T = uint64_t;
};
template <>
struct _bitvec<80> {
  using T = bvpair<uint64_t, uint16_t>;
};
template <>
struct _bitvec<128> {
  using T = bvpair<uint64_t, uint64_t>;
};

template <int i>
using bitvec = typename _bitvec<i>::T;

namespace {
  template <typename T>
  union Cast {
    bitvec<sizeof(T) * 8> r;
    T c;
    Cast(T c) : c(c) {}
    Cast(bitvec<sizeof(T) * 8> r) : r(r) {}
  };

  template <typename T>
  bitvec<sizeof(T) * 8> raw(T t) {
    Cast<T> c(t);
    return c.r;
  }

  template <typename T>
  T unraw(bitvec<sizeof(T) * 8> r) {
    Cast<T> c(r);
    return c.c;
  }
} // namespace

/* Fills `x` by bits up to the most si significant bit. Complexity is O(log n),
 * n is sizeof(x) * 8 */
template <typename number>
static inline number fill(number x) {
  const unsigned m = sizeof(number) * 8;
  unsigned r = 1;
  if (!x)
    return 0;
  while (m != r) {
    x |= x >> r;
    r <<= 1;
  }
  return x;
}

// get index of Most Significant Bit
// templated by argument to int, long, long long (all unsigned)
template <typename T>
static inline unsigned MSB(T x) {
  unsigned position = 0;
  while (x) {
    x >>= 1;
    ++position;
  }
  return position - 1;
}

template <>
inline unsigned MSB<unsigned int>(unsigned int x) {
  const unsigned long bits = sizeof(unsigned int) * 8 - 1;
  return bits - __builtin_clz(x);
}

template <>
inline unsigned MSB<unsigned long>(unsigned long x) {
  const unsigned bits = sizeof(unsigned long) * 8 - 1;
  return bits - __builtin_clzl(x);
}

template <>
inline unsigned MSB<unsigned long long>(unsigned long long x) {
  const unsigned bits = sizeof(unsigned long long) * 8 - 1;
  return bits - __builtin_clzll(x);
}

// gets only Most Significant Bit
template <typename number>
static inline number onlyMSB(number x) {
  return number(1) << MSB(x);
}

// gets number without Most Significant Bit
template <typename number>
static inline number withoutMSB(number x) {
  return x & ~onlyMSB(x);
}

inline constexpr uint64_t bitshift(uint64_t t, int shift) {
  return shift < 0 ? (t << -shift) : (t >> shift);
}

inline constexpr uint64_t mask(int first, int count) {
  return (uint64_t(-1) << first) & (uint64_t(-1) >> (64 - first - count));
}

struct BitPointer {
  using Storage = uint32_t;
  static constexpr int storageBits = sizeof(Storage) * 8;

  BitPointer() : base(nullptr), _bitoffset(0) {}
  template <typename T>
  BitPointer(T* t, int offset = 0)
      : base(static_cast<void*>(t)), _bitoffset(offset) {
    normalize();
  }

  template <typename T>
  T& ref() {
    ASSERT(valid());
    return *static_cast<T*>(base);
  }
  uint32_t& word() {
    return ref<uint32_t>();
  }
  uint64_t& dword() {
    return ref<uint64_t>();
  }

  // unsafe version does not cross word boundary
  uint32_t getUnsafe(int bits) {
    return _get<uint32_t>(bits);
  }
  uint32_t get(int bits) {
    return bits + _bitoffset <= 32 ? _get<uint32_t>(bits)
                                   : _get<uint64_t>(bits);
  }

  void setUnsafe(uint32_t val, int bits) {
    return _set<uint32_t>(val, bits);
  }
  void set(uint32_t val, int bits) {
    return bits + _bitoffset <= 32 ? _set<uint32_t>(val, bits)
                                   : _set<uint64_t>(val, bits);
  }

  void normalize() {
    int shift = downalign(_bitoffset, storageBits);
    _bitoffset -= shift;
    ASSERT_EQ(shift % 8, 0);
    base = static_cast<Storage*>(base) + shift / storageBits;
  }

  void shift(int bits) {
    _bitoffset += bits;
    normalize();
  }
  void fromReference(BitPointer r) {
    *this = r;
  }
  int bitoffset() {
    return _bitoffset;
  }
  bool valid() {
    return base;
  }

private:
  void* base;
  int _bitoffset;

  template <typename T>
  uint32_t _get(int bits) {
    static_assert(std::is_unsigned<T>::value,
                  "T has to be unsigned numeric type");
    ASSERT(valid());
    ASSERT_LEQ(0, bits);
    ASSERT_LEQ(bits, 32);
    ASSERT_LEQ(bits + _bitoffset, int(sizeof(T) * 8));
    return (ref<T>() >> _bitoffset) & mask(0, bits);
  }

  template <typename T>
  void _set(uint32_t val, int bits) {
    static_assert(std::is_unsigned<T>::value,
                  "T has to be unsigned numeric type");
    ASSERT_EQ(val & ~mask(0, bits), 0u);
    ASSERT_LEQ(bits, 32);
    ASSERT_LEQ(bits + _bitoffset, int(sizeof(T) * 8));
    ref<T>() = (ref<T>() & ~mask(_bitoffset, bits)) | (T(val) << _bitoffset);
  }
};

/*
 * NB. This function will alias whatever "to" points to with an uint64_t. With
 * aggressive optimisations, this might break code that passes an address of a
 * variable of different type. When "to" points to a stack variable, take
 * precautions to avoid breaking strict aliasing rules (the violation is not
 * detected by GCC as of 4.7.3).
 */

inline void bitcopy(BitPointer from, BitPointer to, int bitcount) {
  while (bitcount) {
    if (from.bitoffset() == 0 && to.bitoffset() == 0 &&
        bitcount >= BitPointer::storageBits) {
      const int cnt = bitcount / BitPointer::storageBits;
      std::copy(&from.word(), &from.word() + cnt, &to.word());
      const int bitcnt = cnt * BitPointer::storageBits;
      from.shift(bitcnt);
      to.shift(bitcnt);
      bitcount -= bitcnt;
    } else {
      int w = std::min(BitPointer::storageBits - from.bitoffset(), bitcount);
      to.set(from.getUnsafe(w), w);
      from.shift(w);
      to.shift(w);
      bitcount -= w; // slide
    }
  }
}

/* The following code implements BitTuple, which is somewhat like a
 * bit-packed version of the standard std::tuple. Includes overloads for a
 * few basic operators, add more as needed. The BitField structure
 * represents a single item of the BitTuple. It is okay to nest BitTuples
 * in other BitTuples. */

template <typename T, int width = sizeof(T) * 8>
struct BitField {
  static constexpr int bitwidth = width;
  struct Virtual : BitPointer {
    T set(T t) {
      bitcopy(BitPointer(&t), *this, bitwidth);
      return t;
    }
    Virtual operator=(T t) {
      set(t);
      return *this;
    }

    Virtual operator=(Virtual v) {
      set(v.get());
      return *this;
    }

    operator T() const {
      return get();
    }

    T get() const {
      union U {
        uint64_t x;
        T t;
        U() : t() {}
      } u;
      bitcopy(*this, BitPointer(&u.x), bitwidth);
      return u.t;
    }

    Virtual& operator++() {
      T value(get());
      set(++value);
      return *this;
    }

    T operator++(int) {
      T value(get());
      T result(value++);
      set(value);
      return result;
    }

    Virtual& operator--() {
      T value(get());
      set(--value);
      return *this;
    }

    T operator--(int) {
      T value(get());
      T result(value--);
      set(value);
      return result;
    }

#define OP(__op)                                                               \
  template <typename U>                                                        \
  Virtual operator __op(U value) {                                             \
    T t(get());                                                                \
    t __op value;                                                              \
    set(t);                                                                    \
    return *this;                                                              \
  }

    OP(+=);
    OP(-=);
    OP(*=);
    OP(/=);
    OP(%=);
    OP(|=);
    OP(&=);
#undef OP
  };
};

struct BitLock {
  static constexpr int bitwidth = 1;
  struct Virtual : BitPointer {
    using Atomic = std::atomic<uint32_t>;
    Atomic& atomic() {
      return *reinterpret_cast<Atomic*>(&word());
    }
    uint32_t bit() {
      ASSERT_LEQ(bitoffset(), 31);
      return uint32_t(1) << bitoffset();
    }
    void lock() {
      uint32_t l = word();
      do {
        l &= ~bit();
      } while (!atomic().compare_exchange_weak(l, l | bit()));
    }
    void unlock() {
      atomic().exchange(word() & ~bit());
    }
    bool locked() {
      return atomic().load() & bit();
    }
  };
};

template <int O, typename... Args>
struct BitAccess;

template <int O>
struct BitAccess<O> {
  static const int total = 0;
};

template <int O, typename T, typename... Args>
struct BitAccess<O, T, Args...> {
  static constexpr int offset = O;
  static constexpr int width = T::bitwidth;
  typedef typename T::Virtual Head;
  typedef BitAccess<offset + T::bitwidth, Args...> Tail;
  static const int total = width + Tail::total;
};

template <typename BA, int I>
struct _AccessAt : _AccessAt<typename BA::Tail, I - 1> {};

template <typename BA>
struct _AccessAt<BA, 0> {
  using T = BA;
};

template <typename... Args>
struct _BitTuple {
  using Access = BitAccess<0, Args...>;
  static constexpr int bitwidth = Access::total;
  template <int I>
  using AccessAt = _AccessAt<Access, I>;
  template <int I>
  static int offset() {
    return AccessAt<I>::T::offset;
  }
};

template <typename... Args>
struct BitTuple : _BitTuple<Args...> {
  struct Virtual : BitPointer, _BitTuple<Args...> {};
  char storage[align(Virtual::bitwidth, 32) / 8];
  BitTuple() {
    std::fill(storage, storage + sizeof(storage), 0);
  }
  operator BitPointer() {
    return BitPointer(storage);
  }

  bool operator<(const BitTuple& o) const {
    return std::lexicographical_compare(storage, storage + sizeof(storage),
                                        o.storage, o.storage + sizeof(storage));
  }

  bool operator==(const BitTuple& o) const {
    return std::equal(storage, storage + sizeof(storage), o.storage,
                      o.storage + sizeof(storage));
  }
};

template <int I, typename BT>
typename BT::template AccessAt<I>::T::Head get(BT& bt) {
  typename BT::template AccessAt<I>::T::Head t;
  t.fromReference(bt);
  t.shift(BT::template offset<I>());
  return t;
}

} // namespace brick::bitlevel

namespace brick::t_bitlevel {

using namespace ::brick::bitlevel;

struct BitTupleTest {
  using U10 = BitField<unsigned, 10>;
  using T10_10 = BitTuple<U10, U10>;

  int bitcount(uint32_t word) {
    int i = 0;
    while (word) {
      if (word & 1)
        ++i;
      word >>= 1;
    }
    return i;
  }

  TEST(mask) {
    /* only works on little endian machines ... */
    ASSERT_EQ(0xFF00u, bitlevel::mask(8, 8));
    ASSERT_EQ(0xF000u, bitlevel::mask(12, 4));
    ASSERT_EQ(0x0F00u, bitlevel::mask(8, 4));
    ASSERT_EQ(60u, bitlevel::mask(2, 4)); // 0b111100
    ASSERT_EQ(28u, bitlevel::mask(2, 3)); // 0b11100
  }

  TEST(bitcopy) {
    uint32_t a = 42, b = 11;
    bitlevel::bitcopy(BitPointer(&a), BitPointer(&b), 32);
    ASSERT_EQ(a, b);
    a = 0xFF00;
    bitlevel::bitcopy(BitPointer(&a), BitPointer(&b, 8), 24);
    ASSERT_EQ(b, 0xFF0000u | 42u);
    a = 0;
    bitlevel::bitcopy(BitPointer(&b, 8), BitPointer(&a), 24);
    ASSERT_EQ(a, 0xFF00u);
    bitlevel::bitcopy(BitPointer(&a, 8), BitPointer(&b, 8), 8);

    a = 0x3FF;
    b = 0;
    bitlevel::bitcopy(BitPointer(&a, 0), BitPointer(&b, 0), 10);
    ASSERT_EQ(b, 0x3FFu);

    unsigned char from[32], to[32];
    std::memset(from, 0, 32);
    std::memset(to, 0, 32);
    from[0] = 1 << 7;
    bitlevel::bitcopy(BitPointer(from, 7), BitPointer(to, 7), 1);
    ASSERT_EQ(int(to[0]), int(from[0]));
    from[0] = 1;
    to[0] = 0;
    bitlevel::bitcopy(BitPointer(from, 0), BitPointer(to, 7), 1);
    ASSERT_EQ(int(to[0]), 1 << 7);

    from[0] = 13;
    from[1] = 63;
    bitlevel::bitcopy(BitPointer(from, 0), BitPointer(to, 32), 16);
    ASSERT_EQ(int(to[4]), int(from[0]));
    ASSERT_EQ(int(to[5]), int(from[1]));

    from[0] = 2;
    from[1] = 2;
    std::memset(to, 0, 32);
    bitlevel::bitcopy(BitPointer(from, 1), BitPointer(to, 32), 16);
    ASSERT_EQ(int(to[4]), 1);
    ASSERT_EQ(int(to[5]), 1);

    from[0] = 1;
    from[1] = 1;
    std::memset(to, 0, 32);
    bitlevel::bitcopy(BitPointer(from, 0), BitPointer(to, 33), 16);
    ASSERT_EQ(int(to[4]), 2);
    ASSERT_EQ(int(to[5]), 2);

    from[0] = 1;
    from[1] = 1;
    std::memset(to, 0, 32);
    for (int i = 0; i < 16; ++i)
      bitlevel::bitcopy(BitPointer(from, i), BitPointer(to, 33 + i), 1);
    ASSERT_EQ(int(to[4]), 2);
    ASSERT_EQ(int(to[5]), 2);

    for (int i = 0; i < 16; ++i)
      from[i] = 2;
    std::memset(to, 0, 32);
    bitlevel::bitcopy(BitPointer(from, 1), BitPointer(to, 3), 128);
    for (int i = 0; i < 16; ++i)
      ASSERT_EQ(int(to[i]), 8);
  }

  TEST(field) {
    int a = 42, b = 0;
    typedef BitField<int, 10> F;
    F::Virtual f;
    f.fromReference(BitPointer(&b));
    f.set(a);
    ASSERT_EQ(a, 42);
    ASSERT_EQ(a, f);
  }

  TEST(basic) {
    T10_10 x;
    ASSERT_EQ(T10_10::bitwidth, 20);
    ASSERT_EQ(T10_10::offset<0>(), 0);
    ASSERT_EQ(T10_10::offset<1>(), 10);
    auto a = get<0>(x);
    auto b = get<1>(x);
    a.set(5);
    b.set(7);
    ASSERT_EQ(a, 5u);
    ASSERT_EQ(b, 7u);
  }

  TEST(big) {
    bitlevel::BitTuple<BitField<uint64_t, 63>, BitField<uint64_t, 63>> x;
    ASSERT_EQ(x.bitwidth, 126);
    ASSERT_EQ(x.offset<0>(), 0);
    ASSERT_EQ(x.offset<1>(), 63);
    get<0>(x).set((1ull << 62) + 7);
    ASSERT_EQ(get<0>(x), (1ull << 62) + 7);
    ASSERT_EQ(get<1>(x), 0u);
    get<0>(x).set(0);
    get<1>(x).set((1ull << 62) + 7);
    ASSERT_EQ(get<0>(x), 0u);
    ASSERT_EQ(get<1>(x), (1ull << 62) + 7);
    get<0>(x).set((1ull << 62) + 11);
    ASSERT_EQ(get<0>(x), (1ull << 62) + 11);
    ASSERT_EQ(get<1>(x), (1ull << 62) + 7);
  }

  TEST(structure) {
    bitlevel::BitTuple<BitField<std::pair<uint64_t, uint64_t>, 120>,
                       BitField<uint64_t, 63>>
        x;
    auto v = std::make_pair((uint64_t(1) << 62) + 7, uint64_t(33));
    ASSERT_EQ(x.bitwidth, 183);
    ASSERT_EQ(x.offset<0>(), 0);
    ASSERT_EQ(x.offset<1>(), 120);
    get<1>(x).set(333);
    ASSERT_EQ(get<1>(x), 333u);
    get<0>(x).set(v);
    ASSERT_EQ(get<1>(x), 333u);
    ASSERT(get<0>(x).get() == v);
  }

  TEST(nested) {
    typedef bitlevel::BitTuple<T10_10, T10_10, BitField<unsigned, 3>> X;
    X x;
    ASSERT_EQ(X::bitwidth, 43);
    ASSERT_EQ(X::offset<0>(), 0);
    ASSERT_EQ(X::offset<1>(), 20);
    ASSERT_EQ(X::offset<2>(), 40);
    auto a = get<0>(x);
    auto b = get<1>(x);
    get<0>(a).set(5);
    get<1>(a).set(7);
    get<0>(b).set(13);
    get<1>(b).set(533);
    get<2>(x).set(15); /* we expect to lose the MSB */
    ASSERT_EQ(get<0>(a), 5u);
    ASSERT_EQ(get<1>(a), 7u);
    ASSERT_EQ(get<0>(b), 13u);
    ASSERT_EQ(get<1>(b), 533u);
    ASSERT_EQ(get<2>(x), 7u);
  }

  TEST(locked) {
    bitlevel::BitTuple<BitField<int, 15>, BitLock, BitField<int, 16>> bt;

    get<1>(bt).lock();

    ASSERT_EQ(get<0>(bt), 0);
    ASSERT_EQ(get<2>(bt), 0);
    ASSERT(get<1>(bt).locked());
    ASSERT(get<0>(bt).word());

    get<0>(bt) = 1;
    get<2>(bt) = 1;

    ASSERT_EQ(get<0>(bt), 1);
    ASSERT_EQ(get<2>(bt), 1);

    ASSERT_EQ(bitcount(get<0>(bt).word()), 3);

    get<1>(bt).unlock();
    ASSERT_EQ(get<0>(bt), 1);
    ASSERT_EQ(get<2>(bt), 1);
    ASSERT(!get<1>(bt).locked());

    ASSERT_EQ(bitcount(get<0>(bt).word()), 2);

    get<0>(bt) = 0;
    get<2>(bt) = 0;
    ASSERT(!get<0>(bt).word());
  }

  TEST(assign) /* TODO fails in DIVINE */
  {
    bitlevel::BitTuple<BitField<bool, 1>, BitField<int, 6>, BitField<bool, 1>>
        tuple;

    get<0>(tuple) = true;
    get<2>(tuple) = get<0>(tuple);
    ASSERT(get<2>(tuple).get());
  }

  struct OperatorTester {
    int value;
    int expected;
    OperatorTester& operator++() {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester operator++(int) {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester& operator--() {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester& operator--(int) {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester& operator+=(int) {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester& operator-=(int) {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester& operator*=(int) {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester& operator/=(int) {
      UNREACHABLE("fell through");
      return *this;
    }
    OperatorTester& operator%=(int) {
      UNREACHABLE("fell through");
      return *this;
    }
    void test() {
      ASSERT_EQ(value, expected);
    }
    void set(int v, int e) {
      value = v;
      expected = e;
    }
  };
  struct TPrI : OperatorTester {
    TPrI& operator++() {
      ++value;
      return *this;
    }
  };
  struct TPoI : OperatorTester {
    TPoI operator++(int) {
      auto r = *this;
      value++;
      return r;
    }
  };
  struct TPrD : OperatorTester {
    TPrD& operator--() {
      --value;
      return *this;
    }
  };
  struct TPoD : OperatorTester {
    TPoD operator--(int) {
      auto r = *this;
      value--;
      return r;
    }
  };
  struct TPlO : OperatorTester {
    TPlO& operator+=(int v) {
      value += v;
      return *this;
    }
  };
  struct TMO : OperatorTester {
    TMO& operator-=(int v) {
      value -= v;
      return *this;
    }
  };
  struct TPoO : OperatorTester {
    TPoO& operator*=(int v) {
      value *= v;
      return *this;
    }
  };
  struct TSO : OperatorTester {
    TSO& operator/=(int v) {
      value /= v;
      return *this;
    }
  };
  struct TPrO : OperatorTester {
    TPrO& operator%=(int v) {
      value %= v;
      return *this;
    }
  };

  template <int N, typename BT, typename L>
  void checkOperator(BT& bt, int v, int e, L l) {
    auto t = get<N>(bt).get();
    t.set(v, e);
    get<N>(bt) = t;
    l(get<N>(bt));
    get<N>(bt).get().test();
  }

#define CHECK(N, bt, v, e, test)                                               \
  checkOperator<N>(bt, v, e, [](decltype(get<N>(bt)) item) { test; })

  TEST(operators) {
    bitlevel::BitTuple<BitField<bool, 4>,
                       BitField<TPrI>, // ++v
                       BitField<TPoI>, // v++
                       BitField<TPrD>, // --v
                       BitField<TPoD>, // v--
                       BitField<TPlO>, // v+=
                       BitField<TMO>,  // v-=
                       BitField<TPoO>, // v*=
                       BitField<TSO>,  // v/=
                       BitField<TPrO>, // v%=
                       BitField<bool, 4>>
        bt;

    CHECK(1, bt, 0, 1, ++item);
    CHECK(2, bt, 0, 1, item++);
    CHECK(3, bt, 0, -1, --item);
    CHECK(4, bt, 0, -1, item--);
    CHECK(5, bt, 0, 5, item += 5);
    CHECK(6, bt, 0, -5, item -= 5);
    CHECK(7, bt, 2, 14, item *= 7);
    CHECK(8, bt, 42, 6, item /= 7);
    CHECK(9, bt, 42, 9, item %= 11);
  }

#undef CHECK

  TEST(ones) {
    ASSERT_EQ(bitlevel::ones<uint32_t>(0), 0);
    ASSERT_EQ(bitlevel::ones<uint32_t>(1), 1);
    ASSERT_EQ(bitlevel::ones<uint32_t>(2), 3);
    ASSERT_EQ(bitlevel::ones<uint32_t>(31),
              std::numeric_limits<uint32_t>::max() >> 1);
    ASSERT_EQ(bitlevel::ones<uint32_t>(32),
              std::numeric_limits<uint32_t>::max());
    ASSERT_EQ(bitlevel::ones<uint32_t>(33),
              std::numeric_limits<uint32_t>::max());
  }
};

struct BitVecTest {
  TEST(bvpair_shiftl) {
    using bvp32 = bitlevel::bvpair<uint16_t, uint16_t>;
    union {
      bvp32 bvp;
      uint32_t val;
    };
    bvp = bvp32(23, 13);
    uint32_t check = (13u << 16) | 23u;
    ASSERT_EQ(val, check);
    bvp = bvp << 7;
    check = check << 7;
    ASSERT_EQ(val, check);
    bvp = bvp << 18;
    check = check << 18;
    ASSERT_EQ(val, check);
    bvp = bvp32(0xFF, 0xFF);
    check = (0xFF << 16) | 0xFF;
    bvp = bvp << 20;
    check = check << 20;
    ASSERT_EQ(val, check);
  }

  TEST(bvpair_shiftr) {
    using bvp32 = bitlevel::bvpair<uint16_t, uint16_t>;
    union {
      bvp32 bvp;
      uint32_t val;
    };
    bvp = bvp32(23, 13);
    uint32_t check = (13u << 16) | 23u;
    ASSERT_EQ(val, check);
    bvp = bvp >> 7;
    check = check >> 7;
    ASSERT_EQ(val, check);
    bvp = bvp >> 18;
    check = check >> 18;
    ASSERT_EQ(val, check);
    bvp = bvp32(0xFF, 0xFF);
    check = (0xFF << 16) | 0xFF;
    bvp = bvp >> 20;
    check = check >> 20;
    ASSERT_EQ(val, check);
  }
};

} // namespace brick::t_bitlevel

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
