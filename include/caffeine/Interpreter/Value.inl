#ifndef CAFFEINE_INTERP_VALUE_INL
#define CAFFEINE_INTERP_VALUE_INL

#include "caffeine/Interpreter/Value.h"

#include <tuple>

namespace caffeine {

/***************************************************
 * LLVMScalar                                      *
 ***************************************************/

inline LLVMScalar::LLVMScalar(const OpRef& value) : inner_(value) {}
inline LLVMScalar::LLVMScalar(const caffeine::Pointer& value) : inner_(value) {}

inline LLVMScalar::Kind LLVMScalar::kind() const {
  return static_cast<Kind>(inner_.index());
}

inline bool LLVMScalar::is_expr() const {
  return kind() == Expr;
}
inline bool LLVMScalar::is_pointer() const {
  return kind() == Pointer;
}

inline const OpRef& LLVMScalar::expr() const {
  CAFFEINE_ASSERT(is_expr());
  return std::get<Expr>(inner_);
}
inline const Pointer& LLVMScalar::pointer() const {
  CAFFEINE_ASSERT(is_pointer());
  return std::get<Pointer>(inner_);
}

/***************************************************
 * LLVMValue                                       *
 ***************************************************/

inline LLVMValue::LLVMValue(const LLVMScalar& value)
    : LLVMValue(OpVector{value}) {}
inline LLVMValue::LLVMValue(OpVector&& values) : inner_(std::move(values)) {}
inline LLVMValue::LLVMValue(llvm::ArrayRef<LLVMScalar> values)
    : LLVMValue(OpVector(values.begin(), values.end())) {}
inline LLVMValue::LLVMValue(llvm::ArrayRef<LLVMValue> values)
    : LLVMValue(values.vec()) {}
inline LLVMValue::LLVMValue(std::vector<LLVMValue>&& values)
    : inner_(std::move(values)) {}

inline bool LLVMValue::is_scalar() const {
  return is_vector() && vector().size() == 1;
}
inline bool LLVMValue::is_vector() const {
  return inner_.index() == Vector;
}
inline bool LLVMValue::is_aggregate() const {
  return inner_.index() == Aggregate;
}

inline const LLVMScalar& LLVMValue::scalar() const {
  CAFFEINE_ASSERT(is_scalar());
  return vector()[0];
}
inline llvm::ArrayRef<LLVMScalar> LLVMValue::vector() const {
  CAFFEINE_ASSERT(is_vector());
  return std::get<Vector>(inner_);
}
inline llvm::ArrayRef<LLVMValue> LLVMValue::aggregate() const {
  CAFFEINE_ASSERT(is_aggregate());
  return std::get<Aggregate>(inner_);
}

inline size_t LLVMValue::num_elements() const {
  return vector().size();
}
inline const LLVMScalar& LLVMValue::element(size_t idx) const {
  return vector()[idx];
}
inline llvm::ArrayRef<LLVMScalar> LLVMValue::elements() const {
  return vector();
}

inline size_t LLVMValue::num_members() const {
  return aggregate().size();
}
inline const LLVMValue& LLVMValue::member(size_t idx) const {
  return aggregate()[idx];
}
inline llvm::ArrayRef<LLVMValue> LLVMValue::members() const {
  return aggregate();
}

inline bool ContextValue::is_vector() const {
  return kind() == Vector;
}
inline bool ContextValue::is_scalar() const {
  return kind() == Scalar;
}
inline bool ContextValue::is_pointer() const {
  return kind() == Ptr;
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
inline LLVMValue transform_elements(F&& func, const Vs&... values) {
  static_assert((... && std::is_same_v<Vs, LLVMValue>),
                "transform_elements may only be called with LLVMValue");
  static_assert(
      sizeof...(Vs) > 0,
      "transform_elements must be called with at least one LLVMValue");

  const LLVMValue& v1 = detail::first(values...);

  CAFFEINE_ASSERT((... && values.is_vector()));
  CAFFEINE_ASSERT((... && (v1.num_elements() == values.num_elements())));

  auto its = std::make_tuple(std::begin(values.elements())...);
  auto ends = std::make_tuple(std::end(values.elements())...);

  LLVMValue::OpVector results;
  results.reserve(v1.num_elements());

  while (std::apply(
      [](auto... v) { return (... && v); },
      detail::tuple_combine([](const auto& a, const auto& b) { return a != b; },
                            its, ends))) {

    results.push_back(std::apply(
        func, detail::tuple_foreach([](auto& it) { return *it; }, its)));

    detail::tuple_foreach([](auto& it) { return ++it, 0; }, its);
  }

  return LLVMValue(std::move(results));
}

template<typename F, typename... Vs>
inline LLVMValue transform_exprs(F&& func, const Vs&... values) {
  return transform_elements([&](const auto&... args) {
    return LLVMScalar(func(args.expr()...));
  }, values...);
}

} // namespace caffeine

#endif
