#include "caffeine/Support/Assert.h"

#include <boost/core/demangle.hpp>

#include <cstdlib>
#include <iostream>
#include <sstream>

namespace caffeine::detail {

[[noreturn]] void assert_fail(const char* condition, const char* function,
                              unsigned int line, const char* file,
                              message message) {
  auto demangled = boost::core::demangle(function);

  std::cerr << "Assertion failed: " << condition << "\n"
            << "  location: " << file << ":" << line << "\n"
            << "  function: " << demangled << "\n";

  if (message.has_value) {
    std::cerr << "  message: " << message.msg << "\n";
  }

  std::abort();
}

[[noreturn]] void abort(const char* function, unsigned int line,
                        const char* file, message message) {
  auto demangled = boost::core::demangle(function);

  if (message.has_value) {
    std::cerr << "Aborted with message: " << message.msg << "\n"
              << "  location: " << file << ":" << line << "\n";
  } else {
    std::cerr << "Aborted at " << file << ":" << line << "\n";
  }

  std::cerr << "  function: " << demangled << "\n";

  std::abort();
}

} // namespace caffeine::detail
