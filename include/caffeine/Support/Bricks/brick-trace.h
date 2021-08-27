// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * Macros for run-time-configurable debug tracing.
 */

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

#include "brick-min.h"
#include <array>

#ifdef __divine__
#include <sys/cdefs.h>
#include <sys/trace.h>
#include <util/array.hpp>
#else
#include <cstring>
#include <pthread.h>
#include <vector>
#define __debugfn
#define __boring
#endif

#ifdef __unix__
#include <syslog.h>
#include <unistd.h>
#else
#include <cstdio>
#endif

/* The purpose of the TRACE macro is to allow tracing statements to be included
 * in production code, just like ASSERT macros allow for sanity checks and
 * pre/post-condition checking. If compiled with NDEBUG, it's a noop and in
 * debug builds, the output must be enabled by setting environment variables
 * BRICK_TRACE and optionally BRICK_NOTRACE, which accept either `all`, a file
 * name (without path) or a file name and a line number (formatted like
 * `file.cpp:15`). A runtime-disabled trace point compiles to a few lookups in
 * std::unordered_set.
 *
 * Normally, the formatted trace output is printed using std::cerr. The
 * formatting is done using a brq::string_builder (see below) to cut down on
 * overhead and to prevent exceptions being thrown. When built for DiOS, the
 * output is done unconditionally using the __dios_trace mechanism, and the
 * entire trace function is marked as __debugfn (i.e. it is not executed during
 * model checking, only for counter-example generation -- TRACE therefore only
 * causes very modest overhead in DIVINE). */

#define BRICK_LOCATION(stmt)                                                   \
  ::brq::trace_location {                                                      \
    __LINE__, __FILE__, stmt                                                   \
  }

#ifdef NDEBUG
#define TRACE(...) static_cast<decltype(__VA_ARGS__, void(0))>(0)
#define NOISE(...) static_cast<decltype(__VA_ARGS__, void(0))>(0)
#else
#define TRACE(...) ::brq::trace_fn<true>(3, BRICK_LOCATION(""), __VA_ARGS__)
#define NOISE(...) ::brq::trace_fn<true>(4, BRICK_LOCATION(""), __VA_ARGS__)
#endif
#define DEBUG(...) ::brq::trace_fn<false>(2, BRICK_LOCATION(""), __VA_ARGS__)
#define INFO(...) ::brq::trace_fn<false>(1, BRICK_LOCATION(""), __VA_ARGS__)
#define ERROR(...) ::brq::trace_fn<false>(0, BRICK_LOCATION(""), __VA_ARGS__)

namespace brq {
/* Wrap __FILE__ and __LINE__, optionally together with a stringified
 * assertion statement. Needs to be cheap to construct and pass around,
 * since in debug builds this happens a lot. */

struct trace_location {
  int line;
  const char *_file, *_statement;

  std::string_view filename() const noexcept {
    std::string_view r(_file);
    auto idx = r.rfind('/');
    r.remove_prefix(idx == r.npos ? 0 : idx + 1);
    return r;
  }

  std::string_view file() const noexcept {
    return _file;
  }

  const char* statement() const noexcept {
    return _statement;
  }
};

/* In debug builds, decide which traces are active at run-time. This is to
 * prevent swamping the user with irrelevant traces from library code they
 * might be using. For short programs (e.g. unit tests), it might be okay
 * to just say `env BRICK_TRACE=all program`. */

template <typename T>
[[gnu::destructor]] void
singleton_destroy(T* x) noexcept(std::is_nothrow_destructible_v<T>) {
  static bool called = false;
  static T* destroy = nullptr;

  if (called && destroy) {
    destroy->~T();
    destroy = nullptr;
  }

  if (!called)
    destroy = x;

  called = true;
}

template <typename T>
[[gnu::constructor]] T&
singleton() noexcept(std::is_nothrow_default_constructible_v<T>) {
  static char memory[sizeof(T)];
  static T* value = nullptr;
  if (!value) {
    value = new (memory) T;
    singleton_destroy(value);
  }
  return *value;
}

struct trace {
  struct rule_t {
    std::string_view suffix;
    int line, level;
  };

#ifdef __divine__
  using rules_t = __dios::Array<rule_t>;
  static constexpr bool nothrow = true;
#else
  using rules_t = std::vector<rule_t>;
  static constexpr bool nothrow = false;
#endif
  rules_t _rules;
  bool _print_tid = false, _print_location = false, _use_syslog = false;

  void use_syslog(bool s = true) {
    _use_syslog = s;
  }

  trace() noexcept(nothrow) {
    if (auto env = getenv("TRACE")) {
      add_rules(env);
      _print_location = true;
    } else
      add_rule("+", 0, 0); /* print info-level messages by default */
  }

  static constexpr std::array<const char*, 5> levels = {
      "error", "info", "debug", "trace", "noise"};

  static std::string_view level(int i) noexcept {
    return levels[i];
  }

  static int level(std::string_view name) noexcept {
    for (int i = 0; i < int(levels.size()); ++i)
      if (levels[i] == name)
        return i;
    return 3;
  }

  void add_rule(std::string_view s, std::string_view l) noexcept(nothrow) {
    add_rule(s, level(l));
  }

  void add_rule(std::string_view suffix, int level,
                int line = 0) noexcept(nothrow) {
    _rules.push_back(rule_t{suffix, line, level});
  }

  void add_rules(std::string_view str) noexcept(nothrow) {
    while (!str.empty()) {
      auto [first, rest] = split(str, ',');
      auto [spec, level_s] = split(first, '/');
      auto [filename, line_s] = split(spec, ':');

      int line = 0, lvl = level(level_s);
      if (line_s.size())
        line = strtol(line_s.begin(), nullptr, 10);

      add_rule(filename, lvl, line);
      str = rest;
    }
  }

  bool enabled(int level, const trace_location& l) noexcept {
    bool print = false;

    auto f = l.file();
    for (auto r : _rules) {
      auto s = r.suffix;
      if (s == "+" || s == "*" || ends_with(f, r.suffix)) {
        if (r.line && r.line != l.line)
          continue; /* no match */
        print = r.level >= level;
      }
    }

    return print;
  }

  bool prepare(string_builder& b, int level, trace_location location) noexcept {
    if (!enabled(level, location))
      return false;

    b << "[" << this->level(level) << "] ";
    if (_print_location)
      b << location.filename() << ":" << location.line << ": ";
    if (_print_tid)
      b << "[" << pthread_self() << "] ";

    return true;
  }

#ifdef __divine__
  void print(string_builder& b, int) noexcept {
    if (b.truncated())
      __vm_cancel();
    __dios_trace_internal(0, "%s", b.buffer());
  }
#else
  void print(string_builder& b, int level) noexcept {
    b << "\n";
#ifdef __unix__
    if (_use_syslog)
      ::syslog(level > 0 ? LOG_DEBUG : LOG_INFO, "%s", b.buffer());
    else
      ::write(2, b.buffer(), b.size());
#else
    std::fwrite(b.buffer(), 1, b.size(), stderr);
    std::fflush(stderr);
#endif
  }
#endif
};

static inline struct trace& trace() noexcept {
  return singleton<struct trace>();
}

template <bool nofail, typename... Args>
__debugfn void trace_fn(int level, trace_location location,
                        const Args&... args) noexcept {
  string_builder builder;
  if (trace().prepare(builder, level, location)) {
    format_args<nofail>(" ", builder, args...);
    trace().print(builder, level);
  }
}
} // namespace brq

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
