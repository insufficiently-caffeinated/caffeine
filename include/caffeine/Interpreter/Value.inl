#ifndef CAFFEINE_INTERP_VALUE_INL
#define CAFFEINE_INTERP_VALUE_INL

#include "caffeine/Interpreter/Value.h"

#include <tuple>

namespace caffeine {

inline bool ContextValue::is_vector() const {
  return kind() == Vector;
}
inline bool ContextValue::is_scalar() const {
  return kind() == Scalar;
}

namespace detail {
  template <typename F, typename... Ts, size_t... Idxs>
  auto tuple_foreach_(F&& func, std::tuple<Ts...>& tuple,
                      std::index_sequence<Idxs...>) {
    static_assert(sizeof...(Idxs) == sizeof...(Ts));

    return std::make_tuple(func(std::get<Idxs>(tuple))...);
  }

  template <typename F, typename... Ts>
  auto tuple_foreach(F&& func, std::tuple<Ts...>& tuple) {
    return tuple_foreach_(func, tuple, std::index_sequence_for<Ts...>());
  }

  template <typename F, typename... T1s, typename... T2s, size_t... Idxs>
  auto tuple_combine_(F&& func, std::tuple<T1s...>& t1, std::tuple<T2s...>& t2,
                      std::index_sequence<Idxs...>) {
    static_assert(sizeof...(T1s) == sizeof...(Idxs));
    static_assert(sizeof...(T2s) == sizeof...(Idxs));

    return std::make_tuple(func(std::get<Idxs>(t1), std::get<Idxs>(t2))...);
  }

  template <typename F, typename... T1s, typename... T2s>
  auto tuple_combine(F&& func, std::tuple<T1s...>& t1, std::tuple<T2s...>& t2) {
    return tuple_combine_(func, t1, t2, std::index_sequence_for<T1s...>());
  }

  template <typename... Ts>
  bool all(Ts... values) {
    return (... && values);
  }

  template <typename T, typename... Ts>
  const T& first(const T& first, const Ts&...) {
    return first;
  }
} // namespace detail

template <typename F, typename... Vs>
inline ContextValue transform(F&& func, const Vs&... values) {
  static_assert((... && std::is_same_v<Vs, ContextValue>),
                "transform may only be called with ContextValues");

  const ContextValue& v1 = detail::first(values...);

  CAFFEINE_ASSERT((... && (v1.kind() == values.kind())));

  if (v1.is_scalar())
    return ContextValue(func(values.scalar()...));

  auto vecs = std::make_tuple(values.vector()...);

  CAFFEINE_ASSERT(std::apply(
                      [&](const auto&... values) -> bool {
                        const auto& v1 = detail::first(values...);
                        return (... && (v1.size() == values.size()));
                      },
                      vecs),
                  "transform arguments must all have the same size");

  auto its =
      detail::tuple_foreach([](const auto& v) { return std::begin(v); }, vecs);
  auto ends =
      detail::tuple_foreach([](const auto& v) { return std::end(v); }, vecs);

  std::vector<ContextValue> result;
  result.reserve(std::get<0>(vecs).size());

  while (std::apply(
      [](auto... v) { return (... && v); },
      detail::tuple_combine([](const auto& a, const auto& b) { return a != b; },
                            its, ends))) {
    result.push_back(std::apply(
        [&](const auto&... values) { return transform(func, values...); },
        detail::tuple_foreach([](const auto& it) { return *it; }, its)));

    detail::tuple_foreach([](auto& it) { return ++it, 0; }, its);
  }

  return ContextValue(std::move(result));
}

} // namespace caffeine

#endif
