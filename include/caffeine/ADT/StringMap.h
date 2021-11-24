#pragma once

#include <llvm/ADT/SmallString.h>
#include <llvm/ADT/StringRef.h>
#include <string>
#include <string_view>
#include <tsl/hopscotch_map.h>

namespace caffeine {

namespace detail::string_map {
  struct string_equal {
    using is_transparent = void;

  private:
    static std::string_view to_sv(const char* s) {
      return s;
    }
    static std::string_view to_sv(const std::string& s) {
      return s;
    }
    static std::string_view to_sv(std::string_view v) {
      return v;
    }
    static std::string_view to_sv(llvm::StringRef s) {
      return std::string_view(s.data(), s.size());
    }
    template <size_t N>
    static std::string_view to_sv(const llvm::SmallString<N>& s) {
      return to_sv(s.str());
    }

    friend struct string_hash;

  public:
    template <typename T, typename U>
    bool operator()(const T& a, const U& b) const {
      return to_sv(a) == to_sv(b);
    }
  };

  struct string_hash : std::hash<std::string_view> {
    template <typename T>
    std::size_t operator()(const T& x) const {
      return std::hash<std::string_view>::operator()(string_equal::to_sv(x));
    }
  };
} // namespace detail::string_map

// A instantiation of tsl::hopscotch_map that fills in the details needed to get
// transparent key comparisons when using a string map.
template <typename V>
using StringMap =
    tsl::hopscotch_map<std::string, V, detail::string_map::string_hash,
                       detail::string_map::string_equal>;

} // namespace caffeine