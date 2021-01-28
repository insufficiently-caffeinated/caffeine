#include "caffeine/ADT/PersistentArray.h"

#include <fmt/format.h>

namespace caffeine::detail {
[[noreturn]] void throw_out_of_bounds(size_t n, size_t size) {
  throw std::out_of_range(fmt::format(
      "index out of bounds: n (which is {}) >= this->size() (which is {})", n,
      size));
}
} // namespace caffeine::detail
