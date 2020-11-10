#ifndef CAFFEINE_MACROS_H
#define CAFFEINE_MACROS_H

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
};

/**
 * Exit the process with an "assertion failed" message and print a
 * backtrace of where the assertion failed.
 *
 * Usually, this function should not be called directly. Use
 * DECAF_ASSERT instead.
 */
[[noreturn]] void assert_fail(const char *condition, const char *function, unsigned int line,
                              const char *file, message message);

/**
 * Exit the process with an abort message and print a backtrace of
 * where the process aborted.
 *
 * Usually, this function should not be called directly. Use DECAF_ABORT
 * or one of the other abortion macros such as DECAF_UNIMPLEMENTED or
 * DECAF_UNREACHABLE instead.
 */
[[noreturn]] void abort(const char *function, unsigned int line, const char *file, message message);

} // namespace caffeine::detail

#ifdef __PRETTY_FUNCTION__
#define CAFFEINE_FUNCTION __PRETTY_FUNCTION__
#else
#define CAFFEINE_FUNCTION __FUNCTION__
#endif

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

#define CAFFEINE_ASSERT(cond, ...)                                                                 \
  do {                                                                                             \
    if (!(cond)) {                                                                                 \
      ::caffeine::detail::assert_fail(#cond, CAFFEINE_FUNCTION, __LINE__, __FILE__,                \
                                      ::caffeine::detail::message(__VA_ARGS__));                   \
    }                                                                                              \
  } while (false)

/**
 * Abort the process with an optional message.
 */
#define CAFFEINE_ABORT(...)                                                                        \
  ::caffeine::detail::abort(CAFFEINE_FUNCTION, __LINE__, __FILE__,                                 \
                            ::caffeine::detail::message(__VA_ARGS__))

#define CAFFEINE_UNREACHABLE() CAFFEINE_ABORT("entered unreachable code")
#define CAFFEINE_UNIMPLEMENTED() CAFFEINE_ABORT("not implemented")

#endif
