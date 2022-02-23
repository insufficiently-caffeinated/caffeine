#pragma once

#include <type_traits>
#include <utility>

namespace caffeine {

template <typename Sig>
class function_view;

/**
 * A non-owning reference to a function or other callable object.
 *
 * This is meant to be used as a function pointer in cases where the code
 * calling the function doesn't need to own the function. This mainly comes up
 * in function arguments.
 *
 * The implementation here is mainly based off of [1] although it doesn't make
 * the same design decisions as described in the blog post. The idea is also
 * inspired by [2] and, as there is no corresponding implementation within
 * boost, here's a new one.
 *
 * [1]: https://www.foonathan.net/2017/01/function-ref-implementation/
 * [2]: http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0792r2.html
 */
template <typename Ret, typename... Args>
class function_view<Ret(Args...)> {
private:
  using callable = Ret (*)(Args...);
  using internal = Ret (*)(void* data, Args&&... args);

  void* data;
  internal cb;

private:
  function_view(void* data, internal cb) : data(data), cb(cb) {}

public:
  function_view(callable func) {
    data = reinterpret_cast<void*>(func);
    cb = [](void* data, Args&&... args) -> Ret {
      auto func = reinterpret_cast<callable>(data);
      return static_cast<Ret>(func(std::forward<Args>(args)...));
    };
  }

  template <typename T>
  function_view(const T& func) {
    data = const_cast<void*>(static_cast<const void*>(&func));
    cb = [](void* data, Args&&... args) -> Ret {
      const auto& func = *static_cast<const T*>(data);
      return static_cast<Ret>(func(std::forward<Args>(args)...));
    };
  }

  template <typename T>
  function_view(T& func) {
    data = static_cast<void*>(&func);
    cb = [](void* data, Args&&... args) -> Ret {
      auto& func = *static_cast<T*>(data);
      return static_cast<Ret>(func(std::forward<Args>(args)...));
    };
  }

  template <typename T>
  function_view(T&& func) {
    static_assert(!std::is_reference_v<T>);

    data = static_cast<void*>(&func);
    cb = [](void* data, Args&&... args) -> Ret {
      auto& func = *static_cast<T*>(data);
      return static_cast<Ret>(std::move(func)(std::forward<Args>(args)...));
    };
  }

  Ret operator()(Args&&... args) const {
    return cb(data, std::forward<Args>(args)...);
  }
};

} // namespace caffeine
