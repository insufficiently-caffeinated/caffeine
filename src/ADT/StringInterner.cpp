#include "caffeine/ADT/StringInterner.h"
#include "caffeine/Support/Assert.h"
#include <llvm/ADT/Hashing.h>
#include <mutex>
#include <string>
#include <unordered_set>

namespace caffeine {

const char InternedString::empty_string_char = '\0';

InternedString::InternedString(const char* str, size_t size)
    : std::string_view(str, size) {
  CAFFEINE_ASSERT(str[size] == '\0',
                  "Interned string was not null-terminated.");
  CAFFEINE_ASSERT(size != 0, "Wrong constructor for empty interned string");
}

class StringInterner::Impl {
public:
  std::mutex mutex;
  std::unordered_set<std::string> interned;
};

StringInterner::StringInterner() : impl(std::make_unique<Impl>()) {}
StringInterner::~StringInterner() {}

StringInterner::StringInterner(StringInterner&& o) : impl(std::move(o.impl)) {}
StringInterner& StringInterner::operator=(StringInterner&& o) {
  impl = std::move(o.impl);
  return *this;
}

InternedString StringInterner::intern(std::string_view str) {
  if (str.empty())
    return InternedString();

  return intern(std::string(str));
}
InternedString StringInterner::intern(std::string&& str) {
  if (str.empty())
    return InternedString();

  auto lock = std::unique_lock(impl->mutex);
  auto [it, found] = impl->interned.insert(std::move(str));

  return InternedString(it->c_str(), it->size());
}
InternedString StringInterner::intern(const std::string& str) {
  if (str.empty())
    return InternedString();

  auto lock = std::unique_lock(impl->mutex);
  auto [it, found] = impl->interned.insert(str);

  return InternedString(it->c_str(), it->size());
}

void StringInterner::clear() {
  auto lock = std::unique_lock(impl->mutex);
  impl->interned.clear();
}

StringInterner& StringInterner::default_interner() {
  static StringInterner interner;
  return interner;
}

llvm::hash_code hash_value(InternedString str) {
  return llvm::hash_combine_range(str.begin(), str.end());
}

} // namespace caffeine
