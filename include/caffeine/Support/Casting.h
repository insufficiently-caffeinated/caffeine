#pragma once

#include <cstdio>
#include <type_traits>

#if defined(__clang__)
#if __has_feature(cxx_rtti)
#define CAFFEINE_RTTI_ENABLED 1
#endif
#elif defined(__GNUC__)
#if defined(__GXX_RTTI)
#define CAFFEINE_RTTI_ENABLED 1
#endif
#elif defined(_MSC_VER)
#if defined(_CPPRTTI)
#define CAFFEINE_RTTI_ENABLED 1
#endif
#endif

#ifndef CAFFEINE_RTTI_ENABLED
#define CAFFEINE_RTTI_ENABLED 0
#endif

namespace caffeine {

/**
 * Performs a dynamic_cast if RTTI is enabled, otherwise just does
 * a static_cast.
 *
 * Both T and U must be pointer types.
 */
template <typename T, typename U>
T dynamic_cast_if_supported(U value) {
  static_assert(std::is_pointer_v<T>);
  static_assert(std::is_pointer_v<U>);

#if CAFFEINE_RTTI_ENABLED
  return dynamic_cast<T>(value);
#else
  return static_cast<T>(value);
#endif
}

} // namespace caffeine
