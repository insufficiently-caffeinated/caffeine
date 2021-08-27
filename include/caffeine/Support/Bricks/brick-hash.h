// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * (c) 2019 Petr Ročkai <code@fixp.eu>
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
#include "brick-trace.h"
#include <array>
#include <cstdint>

namespace brq::impl {
/* constants and elementary operations by Leonid Yuriev <leo@yuriev.ru> */

static const uint64_t prime_0 = UINT64_C(0xEC99BF0D8372CAAB);
static const uint64_t prime_1 = UINT64_C(0x82434FE90EDCEF39);
static const uint64_t prime_2 = UINT64_C(0xD4F06DB99D67BE4B);
static const uint64_t prime_3 = UINT64_C(0xBD9CACC22C6E9571);
static const uint64_t prime_4 = UINT64_C(0x9C06FAF4D023E3AB);
static const uint64_t prime_5 = UINT64_C(0xC060724A8424F345);
static const uint64_t prime_6 = UINT64_C(0xCB5AF53AE3AAAC31);

[[gnu::always_inline]] static uint64_t rot64(uint64_t v, unsigned s) {
  return (v >> s) | (v << (64 - s));
}

[[gnu::always_inline]] static uint64_t mux64(uint64_t v, uint64_t prime) {
  __uint128_t r = __uint128_t(v) * __uint128_t(prime);
  return uint64_t(r >> 64) ^ uint64_t(r);
}

[[gnu::always_inline]] static uint64_t mix64(uint64_t v,
                                             uint64_t p) /* xor-mul-xor */
{
  v *= p;
  return v ^ rot64(v, 41);
}

template <bool strict>
static inline uint64_t tail(const uint64_t* v, unsigned count) {
  ASSERT(count);
  if constexpr (strict) {
    uint64_t r = 0;
    auto i = reinterpret_cast<const uint8_t*>(v);
    switch (count) {
#if __BYTE_ORDER == __ORDER_BIG_ENDIAN__
    default:
      NOT_IMPLEMENTED();
#else
    case 8:
      return *v;
    case 7:
      r += i[6];
      r <<= 8;
    case 6:
      r += i[5];
      r <<= 8;
    case 5:
      r += i[4];
      r <<= 32;
    case 4:
      return r + *reinterpret_cast<const uint32_t*>(v);
    case 3:
      r += i[2];
      r <<= 16;
    case 2:
      return r + *reinterpret_cast<const uint16_t*>(v);
    case 1:
      return r + i[0];
    default:
      __builtin_unreachable();
#endif
    }
  } else {
    const unsigned shift = ((8 - count) & 7) << 3;
    return *v & (~uint64_t(0) >> shift);
  }
}
} // namespace brq::impl

namespace brq {
using hash64_t = uint64_t;
using hash32_t = uint32_t;

/* a fast, high-quality (according to smhasher) streaming hash function
 * based on the t1ha design ; however, this design compromises maximum
 * throughput for a few other design criteria: simplicity, portability,
 * fast word-at-once (streaming) mode and reduced register pressure when
 * interleaved with other code */

struct hash_state {
  std::array<uint64_t, 4> state;
  uint64_t counter = 0;

  /* the order of lines in the mixers matters to the optimizer... the
   * ordering used here is what seems to work best with clang 7 ; gcc 8.2
   * doesn't seem to care much
   *
   * unfortunately, clang still takes 40 cycles for messages <= 32 bytes
   * and 2.6 bytes/cycle for longer stuff; gcc beats both at 32 cycles
   * and 3 bytes/cycle respectively (all on Xeon E5-2630v2) */

  void mix() {
    const uint64_t u = state[0], v = state[1], w = state[2],
                   x = state[3] + counter;
    state[1] ^= impl::mux64(w, impl::prime_2);
    state[2] ^= impl::mux64(x, impl::prime_1);
    state[0] ^= impl::mux64(v, impl::prime_3);
    state[3] ^= impl::mux64(u, impl::prime_0);
  }

  [[gnu::always_inline]] void mix_if_needed() {
    if (counter && counter % 32 == 0)
      mix();
  }

  uint64_t hash() const {
    const uint64_t u = state[0], v = state[1], w = state[2],
                   x = state[3] + counter;
    uint64_t a_ = state[0], b_ = state[1], c_ = state[2], d_ = state[3];
    b_ ^= impl::mux64(w, impl::prime_2);
    c_ ^= impl::mux64(x, impl::prime_1);
    a_ ^= impl::mux64(v, impl::prime_3);
    d_ ^= impl::mux64(u, impl::prime_0);
    return impl::mix64(a_ + c_, impl::prime_4) +
           impl::mix64(b_ + d_, impl::prime_5);
  }

  /* updates: aligned access is aligned with respect to the hash state,
   * not to the address of the hashed data ... update_aligned() may only
   * be called after a whole number of items of the given type have been
   * hashed; as a special case, update_aligned of variable-sized data
   * uses 32-byte blocks and assumes 32-byte alignment; the size of the
   * data can be arbitrary though */

  [[gnu::always_inline]] void update(const uint8_t* bytes, int count) {
    while (counter % 8 && count)
      update_aligned(*bytes++), count -= 1;

    const uint64_t* d64 = reinterpret_cast<const uint64_t*>(bytes);
    while (counter % 32 && count >= 8)
      update_aligned(*d64++), count -= 8;

    bytes = reinterpret_cast<const uint8_t*>(d64);
    while (counter % 32 && count)
      update_aligned(*bytes++), count -= 1;

    if (count) {
      mix_if_needed();
      update_aligned(bytes, count);
    }
  }

  /* segments: when hashing multiple independent blocks of data into a
   * single hash, it is often beneficial to realign() between the blocks
   * (segments) so that update_aligned can be used even if the previous
   * block(s) were not even multiples of 32 bytes ; NB. this affects the
   * value of the hash, i.e. it is not the same as getting a hash of the
   * blocks concatenated after each other! */

  void realign() {
    mix();
    counter = counter + 32 - counter % 32;
  }

  template <bool strict = false>
  [[gnu::always_inline]] void update_aligned(const uint8_t* data, int count) {
    ASSERT_EQ(counter % 32, 0);
    const uint64_t* d64 = reinterpret_cast<const uint64_t*>(data);

    while (count > 32) {
      state[0] ^= *d64++;
      state[1] ^= *d64++;
      state[2] ^= *d64++;
      state[3] ^= *d64++;
      __builtin_prefetch(d64);
      counter += 32;
      mix();
      count -= 32;
    }

    counter += count;

    switch (count) {
    default:
      state[0] ^= *d64++;
      count -= 8;
      state[1] ^= *d64++;
      count -= 8;
      state[2] ^= *d64++;
      count -= 8;
      state[3] ^= impl::tail<strict>(d64++, count);
      break;
    case 24:
    case 23:
    case 22:
    case 21:
    case 20:
    case 19:
    case 18:
    case 17:
      state[0] ^= *d64++;
      count -= 8;
      state[1] ^= *d64++;
      count -= 8;
      state[2] ^= impl::tail<strict>(d64++, count);
      break;
    case 16:
    case 15:
    case 14:
    case 13:
    case 12:
    case 11:
    case 10:
    case 9:
      state[0] ^= *d64++;
      count -= 8;
      state[1] ^= impl::tail<strict>(d64++, count);
      break;
    case 8:
    case 7:
    case 6:
    case 5:
    case 4:
    case 3:
    case 2:
    case 1:
      state[0] ^= impl::tail<strict>(d64++, count);
      break;
    case 0:;
    }
  }

  template <typename T>
  std::enable_if_t<std::is_integral_v<T> && sizeof(T) <= 8>
  update_aligned(T v) {
    ASSERT_EQ(counter % sizeof(T), 0);
    mix_if_needed();
    unsigned word = (counter / 8) % 4;
    unsigned byte = 8 * (counter % 8);
    state[word] ^= uint64_t(v) << byte;
    counter += sizeof(T);
  }

  template <typename T>
  std::enable_if_t<std::is_integral_v<T> && sizeof(T) <= 8> update(T v) {
    auto bytes = reinterpret_cast<const uint8_t*>(&v);
    auto end = bytes + sizeof(T);
    while ((counter % sizeof(T) || end - bytes < 4) && bytes < end)
      update_aligned(*bytes++);
    if (end - bytes >= 4)
      update_aligned(*reinterpret_cast<const uint32_t*>(bytes)), bytes += 4;
    while (bytes < end)
      update_aligned(*bytes++);
  }

  hash_state(uint64_t seed = 0) {
    std::fill(state.begin(), state.end(), 0);
    state[0] = seed;
  }
};

/* convenience at-once variants of the above hash function ; integer
 * variants and string hashes <= 32 bytes should take about 35-40 cycles
 * per hash on modern, 64b superscalar processors, depending on the CPU and
 * the compiler */

static inline hash64_t hash(const uint8_t* data, size_t len,
                            hash64_t seed = 0) {
  hash_state s(seed);
  s.update_aligned(data, len);
  return s.hash();
}

template <typename T>
std::enable_if_t<std::is_integral_v<T> && sizeof(T) <= 8, hash64_t> hash(T v) {
  hash_state s;
  s.update_aligned(v);
  return s.hash();
}

} // namespace brq

namespace t_brq {
template <bool strict>
struct hash {
  static constexpr const char* const str =
      "abcdefghijklmnopABCDEFGHIJKLMNOPabcdefghijklmnopABCDEFGHIJKLMNOP_";

  TEST(bytewise) {
    for (unsigned len = 0; len < strlen(str); ++len) {
      brq::hash_state s1(len), s2(len);
      s1.update_aligned<strict>(reinterpret_cast<const uint8_t*>(str), len);
      for (unsigned i = 0; i < len; ++i)
        s2.update(str[i]);
      ASSERT_EQ(s1.hash(), s2.hash());
    }
  }

  TEST(piecewise_unaligned) {
    for (unsigned len = 0; len < strlen(str); ++len) {
      brq::hash_state s1(len), s2(len);
      s1.update_aligned<strict>(reinterpret_cast<const uint8_t*>(str), len);

      for (unsigned i = 0; i < len; ++i) {
        if (len - i > 4 && i % 3 == 0)
          s2.update(*reinterpret_cast<const uint32_t*>(str + i)), i += 3;
        else
          s2.update(str[i]);
      }

      ASSERT_EQ(s1.hash(), s2.hash());
    }
  }

  /* following two testcases are derived from Bob Jenkins's public domain code
   */

  static const int BUFSIZE = 512;

  TEST(alignment) {
    char buf[BUFSIZE];
    uint64_t hash[8];

    for (int i = 0; i < BUFSIZE - 16; ++i) {
      for (int j = 0; j < 8; ++j) {
        buf[j] = char(i + j);
        for (int k = 1; k <= i; ++k)
          buf[j + k] = k;
        buf[j + i + 1] = char(i + j);
        hash[j] =
            brq::hash(reinterpret_cast<const uint8_t*>(buf + j + 1), i, 0);
      }

      for (int j = 1; j < 8; ++j)
        ASSERT_EQ(hash[0], hash[j]);
    }
  }

  TEST(pieces) {
    uint8_t buf[BUFSIZE];

    for (int i = 0; i < BUFSIZE; ++i)
      buf[i] = i;

    for (int i = 0; i < BUFSIZE; ++i) {
      uint64_t a, c, seed = 1;

      // all as one call
      a = brq::hash(buf, i, seed);

      brq::hash_state state(seed);
      state.update_aligned<strict>(buf, i);
      c = state.hash();

      ASSERT_EQ(a, c);

      // all possible two consecutive pieces
      for (int j = 0; j < i; ++j) {
        brq::hash_state state(seed);
        state.update(buf, j);
        state.update(buf + j, i - j);
        c = state.hash();
        TRACE(j, i - j);
        ASSERT_EQ(a, c);
      }
    }
  }
};

template struct hash<false>;
template struct hash<true>;
} // namespace t_brq

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
