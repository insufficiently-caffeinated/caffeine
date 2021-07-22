#pragma once

#include <utility>
#include <type_traits>

namespace caffeine {
namespace detail {
  /**
   * RAII class that calls a user-provided function during its destructor.
   *
   * This is useful for ensuring that code is executed even if an exception is
   * thrown (i.e. it can be used to emulate a try/finally statenent).
   *
   * The design is based off of folly's ScopeGuard class.
   */
  template <typename F>
  class ScopeGuard : F {
  private:
    bool dismissed = false;

  public:
    constexpr ScopeGuard(F&& func) : F(std::move(func)) {}
    constexpr ScopeGuard(const F& func) : F(func) {}

    ~ScopeGuard() noexcept(false) {
      if (!dismissed) {
        (*this)();
      }
    }

    constexpr void dismiss() noexcept {
      dismissed = true;
    }
  };
} // namespace detail

template <typename F>
constexpr detail::ScopeGuard<std::decay_t<F>> make_guard(F&& func) {
  return detail::ScopeGuard<std::decay_t<F>>(std::forward<F>(func));
}

} // namespace caffeine
