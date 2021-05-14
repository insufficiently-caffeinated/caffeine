#ifndef CAFFEINE_MACROS_H
#define CAFFEINE_MACROS_H

#include "caffeine/Support/Macros.h"
#include <string_view>

namespace caffeine::detail {

/** Optional-like type for use in message creation.
 *
 * I'm trying to keep this header lightweight so that including it
 * everywhere is less of an issue.
 *
 * This struct should not usually be used directly. Use one of the
 * assertion or abortion macros instead.
 */
struct message {
  bool has_value;
  std::string_view msg;

  message() : has_value(false) {}
  message(std::string_view msg) : has_value(true), msg(msg) {}

  message set_default(std::string_view defaultmsg) {
    if (!has_value)
      return message(defaultmsg);
    return *this;
  }
};

/**
 * Exit the process with an "assertion failed" message and print a
 * backtrace of where the assertion failed.
 *
 * Usually, this function should not be called directly. Use
 * CAFFEINE_ASSERT instead.
 */
[[noreturn]] void assert_fail(const char* condition, const char* function,
                              unsigned int line, const char* file,
                              message message);

/**
 * Exit the process with an abort message and print a backtrace of
 * where the process aborted.
 *
 * Usually, this function should not be called directly. Use CAFFEINE_ABORT
 * or one of the other abortion macros such as CAFFEINE_UNIMPLEMENTED or
 * CAFFEINE_UNREACHABLE instead.
 */
[[noreturn]] void abort(const char* function, unsigned int line,
                        const char* file, message message);

} // namespace caffeine::detail

/**
 * Abort the process if the condition is not true.
 *
 * There are two valid forms for this assertion macro.
 * ```
 * CAFFEINE_ASSERT(cond);
 * CAFFEINE_ASSERT(cond, "some message");
 * ```
 *
 * The only difference is that the first one uses a default message and
 * the second one uses the provided message when it fails.
 *
 * Note that the message is only evaluated if the assertion fails.
 */

#define CAFFEINE_ASSERT(cond, ...)                                             \
  do {                                                                         \
    if (!(cond)) {                                                             \
      ::caffeine::detail::assert_fail(                                         \
          #cond, CAFFEINE_FUNCTION, __LINE__, __FILE__,                        \
          ::caffeine::detail::message(__VA_ARGS__));                           \
    }                                                                          \
  } while (false)

/**
 * Abort the process with an optional message.
 */
#define CAFFEINE_ABORT(...)                                                    \
  ::caffeine::detail::abort(CAFFEINE_FUNCTION, __LINE__, __FILE__,             \
                            ::caffeine::detail::message(__VA_ARGS__))
#define CAFFEINE_ABORT_DEFAULT(defaultmsg, ...)                                \
  ::caffeine::detail::abort(                                                   \
      CAFFEINE_FUNCTION, __LINE__, __FILE__,                                   \
      ::caffeine::detail::message(__VA_ARGS__).set_default(defaultmsg))

#define CAFFEINE_UNREACHABLE(...)                                              \
  CAFFEINE_ABORT_DEFAULT("entered unreachable code", __VA_ARGS__)
#define CAFFEINE_UNIMPLEMENTED(...)                                            \
  CAFFEINE_ABORT_DEFAULT("not implemented", __VA_ARGS__)

#endif
