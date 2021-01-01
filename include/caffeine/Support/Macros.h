#ifndef CAFFEINE_SUPPORT_MACROS_H
#define CAFFEINE_SUPPORT_MACROS_H

#ifdef _MSC_VER
#define CAFFEINE_MSVC_PRAGMA(x) __pragma(x)
#else
#define CAFFEINE_MSVC_PRAGMA(x)
#endif

/**
 * Support library for doing macro tricks.
 */

#define CAFFEINE_CONCAT_(x, y) x##y
#define CAFFEINE_CONCAT(x, y) CAFFEINE_CONCAT_(x, y)

#define CAFFEINE_EXPAND(x) x

#define CAFFEINE_FIRST(x, ...) x

#define CAFFEINE_INVOKE_NUMBERED_(x, _1, _2, _3, _4, _5, _6, _7, _8, _9, FUNC, \
                                  ...)                                         \
  FUNC

/**
 * Invoke a macro with a conditional number of arguments
 *
 * Based off of https://stackoverflow.com/a/8814003/4821282
 */
#define CAFFEINE_INVOKE_NUMBERED(macro, ...)                                   \
  CAFFEINE_EXPAND(CAFFEINE_INVOKE_NUMBERED_(                                   \
      , ##__VA_ARGS__ /* this comment makes the autoformatter work better */,  \
      CAFFEINE_CONCAT(macro, 9)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 8)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 7)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 6)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 5)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 4)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 3)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 2)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 1)(__VA_ARGS__),                                  \
      CAFFEINE_CONCAT(macro, 0)(__VA_ARGS__)))

#endif
