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
#include <functional>
#include <iomanip>
#include <tuple>
#include <variant>
#include <vector>

namespace brq {
template <int i = 0, typename... T>
auto& operator<<(string_builder& b, const std::tuple<T...>& t) noexcept {
  if (i == 0)
    b << "[";
  if constexpr (i < sizeof...(T)) {
    b << (i > 0 ? ", " : " ") << std::get<i>(t);
    return operator<<<i + 1>(b, t);
  } else
    return b << (i == 0 ? "]" : " ]");
}

template <typename... T>
auto& operator<<(string_builder& b, const std::variant<T...>& v) noexcept {
  return std::visit(
      [&](const auto& val) -> auto& { return b << val; }, v);
}

template <typename A, typename B>
auto operator<<(string_builder& b, const std::pair<A, B>& p) noexcept
    -> decltype(b << p.first << p.second) {
  return b << "[ " << p.first << ", " << p.second << " ]";
}

struct mark_t {
  string_builder* b = nullptr;
  int32_t mark;

  mark_t() = default;
  explicit mark_t(string_builder& b) : b(&b), mark(b._offset) {}
  template <typename T>
  mark_t operator<<(T&& v) {
    *b << std::forward<T>(v);
    return *this;
  }
};

struct pad {
  mark_t mark;
  int width;
  char ch;
  pad(int w, char ch = ' ') : width(w), ch(ch) {}
  pad(string_builder& b, pad p) : mark(b), width(p.width), ch(p.ch) {}

  template <typename T>
  pad operator<<(T&& v) {
    mark << std::forward<T>(v);
    return *this;
  }
  static string_builder& write(string_builder& b, int width, int from, char ch,
                               bool left) {
    int output_width = b._offset - from;
    if (int pad = width - output_width; pad > 0 && b._make_space(pad)) {
      if (left)
        std::memmove(b._buffer + from + pad, b._buffer + from,
                     output_width + 1);
      else
        b._buffer[b._offset + pad] = 0;
      std::memset(b._buffer + (left ? from : b._offset), ch, pad);
      b._offset += pad;
    }
    return b;
  }
};

static mark_t mark;

template <typename transform_t, typename stream_t>
struct string_transform {
  using self_t = string_transform<transform_t, stream_t>;
  transform_t _transform;
  stream_t& _stream;
  int _mark;

  string_transform(transform_t t, stream_t& s)
      : _transform(t), _stream(s), _mark(_stream.size()) {}

  int size() {
    return _stream.size();
  }

  template <typename T>
  auto process(const T& v, primary_t)
      -> decltype(_transform.process(*this, v)) {
    return _transform.process(_stream, v);
  }

  template <typename T>
  auto process(const T& v, fallback) {
    int start = _stream.size();
    _stream << v;
    size_t count = _stream.size() - start;
    _stream.size() = start;
    char buf[count];
    std::memcpy(buf, _stream.buffer() + start, count);
    _transform.process(_stream, std::string_view(buf, count));
  }

  template <typename T>
  self_t& operator<<(const T& v) {
    if (_mark != _stream.size())
      _transform.reset();
    _mark = _stream.size();
    process(v, primary);
    return *this;
  }
};

struct string_window {
  const char* _start;
  int _split, _end;

  template <typename T>
  string_window(const T& sv)
      : _start(sv.data()), _split(0), _end(sv.end() - sv.begin()) {}

  std::string_view flush() {
    std::string_view rv(_start, _split);
    _start += _split;
    _end -= _split;
    _split = 0;
    return rv;
  }

  char shift() {
    return _start[_split++];
  }
  char peek() {
    return _start[_split];
  }
  bool empty() {
    return _split == _end;
  }
  bool pending() {
    return _split > 0;
  }
};

template <typename gen_t, typename state_t>
struct generator {
  using value_type = std::tuple_element_t<0, std::result_of_t<gen_t(state_t)>>;
  gen_t _gen;
  state_t _initial;

  struct proxy {
    value_type v;
    value_type* operator->() {
      return &v;
    }
  };

  struct iterator {
    gen_t _gen;
    state_t _state;

    iterator(gen_t g, state_t s) : _gen(g), _state(s) {}
    iterator& operator=(const iterator&) = default;
    iterator& operator++() {
      _state = std::get<1>(_gen(_state));
      return *this;
    }
    iterator operator++(int) {
      auto x = *this;
      ++*this;
      return x;
    }
    value_type operator*() {
      return std::get<0>(_gen(_state));
    }
    proxy operator->() {
      return {**this};
    }
    bool operator==(const iterator& o) const {
      return _state == o._state;
    }
    bool operator!=(const iterator& o) const {
      return _state != o._state;
    }
  };

  auto begin() const {
    return iterator(_gen, _initial);
  }
  auto end() const {
    return iterator(_gen, state_t());
  }

  generator(gen_t gen, state_t init) : _gen(gen), _initial(init) {}
};

static auto splitter(std::string_view s, char d, bool reverse = false) {
  return generator([=](auto s) { return split(s, d, reverse); }, s);
}

static inline std::string tabulate(std::string_view s) {
  std::vector<int> cols;
  std::string out;

  auto stop = [&](int t, int c) {
    if (t >= int(cols.size()))
      cols.push_back(c);
    else
      cols[t] = std::max(c, cols[t]);

    return cols[t];
  };

  for (auto line : splitter(s, '\n'))
    for (int i = 0, c = 0, t = 0; i < int(line.size()); ++i, ++c)
      if (line[i] == '\t')
        c = stop(t++, c + 1);

  for (auto line : splitter(s, '\n')) {
    for (int i = 0, c = 0, t = 0; i < int(line.size()); ++i, ++c)
      if (line[i] == '\t') {
        for (; c < cols[t]; ++c)
          out += ' ';
        ++t;
      } else
        out += line[i];
    out += '\n';
  }

  if (s.back() != '\n')
    out.pop_back();

  return out;
}

struct quote {
  std::string _prefix;
  bool _delim = true;

  void reset() {
    _delim = true;
  }
  quote(std::string p) : _prefix(p) {}

  std::string delim(bool next) {
    auto rv = _delim ? _prefix : "";
    _delim = next;
    return rv;
  }

  template <typename stream>
  void process(stream& out, brq::string_window data) {
    while (!data.empty())
      if (data.shift() == '\n')
        out << delim(true) << data.flush();

    if (data.pending())
      out << delim(false) << data.flush();
  }
};

template <typename... args_t>
string_builder format(const args_t&... t) {
  string_builder rv;
  format_args("", rv, t...);
  return rv;
}

struct parse_result {
  std::string _err_str;
  bool _err = false;
  explicit operator bool() const {
    return !_err;
  }
  parse_result& operator=(bool b) {
    _err = !b;
    _err_str.clear();
    return *this;
  }
  std::string_view error() const {
    ASSERT(_err);
    return _err_str;
  }
};

template <typename... args_t>
parse_result no_parse(args_t... args) {
  parse_result r;
  r._err = true;
  r._err_str = format(args...).data();
  return r;
}

/* The from_string machinery extracts values from strings. The parsing might
 * fail, in which case they are expected to return 'false'. An existing
 * value must be passed to `from_string` as a reference -- the original
 * content may or may not be discarded, depending on the type. If parsing
 * fails, the content of the value should be left untouched. The easiest way
 * to provide from_string is by adding a static `from_string` method to your
 * class. ADL also works, if need be. We provide some sane default
 * from_string implementations for standard types. */

template <typename arg_t>
static auto from_string(std::string_view s, arg_t& a)
    -> decltype(arg_t::from_string(s, a)) {
  return arg_t::from_string(s, a);
}

template <typename arg_t>
static std::enable_if_t<
    std::is_integral_v<arg_t> || std::is_floating_point_v<arg_t>, parse_result>
from_string(std::string_view s, arg_t& a) {
  auto begin = s.data(), end = begin + s.size();
  auto parse_end = std::from_chars(begin, end, a).ptr;
  return parse_end == end ? parse_result()
                          : no_parse("error parsing ", s, " as a number");
}

template <typename container>
auto from_string(std::string_view s, container& c)
    -> decltype(from_string(s, c.back())) {
  c.emplace_back();
  return from_string(s, c.back());
}

} // namespace brq

namespace t_brq {
struct tabulate {
  TEST(sanity) {
    std::string_view in = "hello\tworld\nsad\tworld\n";
    auto o = brq::tabulate(in);
    ASSERT_EQ(o, "hello world\n"
                 "sad   world\n");
  }

  TEST(three) {
    std::string_view in = "hello\twar\tagain\nsad\tworld\tprevails\n";
    auto o = brq::tabulate(in);
    ASSERT_EQ(o, "hello war   again\n"
                 "sad   world prevails\n");
  }
};
} // namespace t_brq

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab ft=cpp
