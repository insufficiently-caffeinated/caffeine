#pragma once

#include "caffeine/Support/Assert.h"
#include <atomic>
#include <stdexcept>
#include <string>

namespace caffeine {

class Context;

class UnsupportedOperationException : public std::exception {
private:
  std::string message;

public:
  UnsupportedOperationException(std::string&& message)
      : message(std::move(message)) {}

  const char* what() const noexcept override {
    return message.c_str();
  }
};

class UnsupportedOperation {
private:
  static thread_local const Context* CurrentContext;
  static std::atomic<bool> RecoverFailures;

public:
  class ContextGuard;
  friend class ContextGuard;

  static const Context* CurrentContextUnsafe() noexcept {
    return CurrentContext;
  }

  [[noreturn]] static void Abort(const char* condition, const char* function,
                                 unsigned int line, const char* file,
                                 std::string_view message);

  static void SetRecoverable(bool recoverable) {
    RecoverFailures.store(recoverable);
  }
  static ContextGuard SetCurrentContext(Context* current) {
    return ContextGuard(current);
  }

  class ContextGuard {
    const Context* saved;

  public:
    ContextGuard(const Context* context)
        : saved(UnsupportedOperation::CurrentContext) {
      CAFFEINE_ASSERT(context != nullptr,
                      "Cannot set a null context as current");
      UnsupportedOperation::CurrentContext = context;
    }
    ~ContextGuard() {
      CurrentContext = saved;
    }

    void update(Context* next) {
      CAFFEINE_ASSERT(next != nullptr, "Cannot set a null context as current");
      UnsupportedOperation::CurrentContext = next;
    }

    ContextGuard(ContextGuard&&) = delete;
    ContextGuard(const ContextGuard&) = delete;
    ContextGuard& operator=(ContextGuard&&) = delete;
    ContextGuard& operator=(const ContextGuard&) = delete;
  };
};

#define CAFFEINE_UNSUPPORTED(message)                                          \
  ::caffeine::UnsupportedOperation::Abort(nullptr, CAFFEINE_FUNCTION,          \
                                          __LINE__, __FILE__, message)
#define CAFFEINE_UASSERT(condition, message)                                   \
  do {                                                                         \
    if (!(condition))                                                          \
      ::caffeine::UnsupportedOperation::Abort(#condition, CAFFEINE_FUNCTION,   \
                                              __LINE__, __FILE__, message);    \
  } while (false)

} // namespace caffeine
