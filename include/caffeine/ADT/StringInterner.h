#pragma once

#include <memory>
#include <string_view>
#include <utility>

namespace llvm {
struct hash_code;
}

namespace caffeine {

class StringInterner;

class InternedString : public std::string_view {
public:
  constexpr InternedString() : std::string_view(&empty_string_char, 0) {}

  const char* c_str() const noexcept {
    // By construction we're guaranteed that the view is null-terminated.
    return this->data();
  }

  bool operator==(const InternedString& s) const noexcept {
    return data() == s.data();
  }
  bool operator!=(const InternedString& s) const noexcept {
    return !(*this == s);
  }

  bool starts_with(std::string_view prefix) {
    if (prefix.size() > size())
      return false;
    return substr(0, prefix.size()) == prefix;
  }
  bool ends_with(std::string_view suffix) {
    if (suffix.size() > size())
      return false;
    return substr(size() - suffix.size()) == suffix;
  }

private:
  InternedString(const char* str, size_t size);

  // All empty interned strings point to this character
  static const char empty_string_char;

  friend class StringInterner;
};

class StringInterner {
private:
  class Impl;
  std::unique_ptr<Impl> impl;

public:
  StringInterner();
  ~StringInterner();

  StringInterner(StringInterner&& o);
  StringInterner& operator=(StringInterner&& o);

  InternedString intern(std::string_view str);
  InternedString intern(const std::string& str);
  InternedString intern(std::string&& str);

  /**
   * Delete all interned strings. This means that any remaining interned strings
   * will be left with dangling pointers. It should only be called when it is
   * known that all interned strings have been destroyed.
   */
  void clear();

  static StringInterner& default_interner();
};

llvm::hash_code hash_value(InternedString str);

} // namespace caffeine

namespace std {
template <>
struct hash<caffeine::InternedString> {
  size_t operator()(const caffeine::InternedString& s) const noexcept {
    return hash<const char*>()(s.data());
  }
};
} // namespace std
