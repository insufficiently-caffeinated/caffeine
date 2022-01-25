#pragma once

#include <llvm/ADT/Hashing.h>

namespace caffeine {

/**
 * Hasher that wraps llvm::hash_value in a hash implementation that can be used
 * for types like std::unordered_map.
 */
struct LLVMHasher {
  LLVMHasher() = default;

  template <typename T>
  size_t operator()(const T& value) const {
    using llvm::hash_value;

    llvm::hash_code code = hash_value(value);
    return static_cast<size_t>(code);
  }
};

#define CAFFEINE_DECL_LLVM_HASHER(type)                                        \
  template <>                                                                  \
  struct ::std::hash<type> {                                                   \
  private:                                                                     \
    using value_t = type;                                                      \
                                                                               \
  public:                                                                      \
    ::std::size_t operator()(const value_t& op) const;                         \
  }

/**
 * Define a std::hash specialization for the given type that forwards to the
 * LLVM-style hash_value function of the type.
 *
 * This macro must be used within the global namespace scope otherwise it will
 * error.
 */
#define CAFFEINE_DEF_LLVM_HASHER(type)                                         \
  inline ::std::size_t std::hash<type>::operator()(const type& op) const {     \
    using ::llvm::hash_value;                                                  \
    return static_cast<::std::size_t>(hash_value(op));                         \
  }

} // namespace caffeine
