#ifndef CAFFEINE_ADT_REF_H
#define CAFFEINE_ADT_REF_H

#include <atomic>
#include <memory>
#include <type_traits>

namespace caffeine {
template <typename T>
using ref = std::shared_ptr<T>;

} // namespace caffeine

#endif
