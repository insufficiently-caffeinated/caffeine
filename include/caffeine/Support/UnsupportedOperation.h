#pragma once

#include "caffeine/Support/Assert.h"
#include <atomic>
#include <stdexcept>

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
  public:
    ContextGuard(Context* context) {
      CAFFEINE_ASSERT(context != nullptr,
                      "Cannot set a null context as current");
      UnsupportedOperation::CurrentContext = context;
    }
    ~ContextGuard() {
      CurrentContext = nullptr;
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
