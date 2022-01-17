#include "caffeine/IR/Symbol.h"

namespace caffeine {

Symbol::Symbol(const std::string& name)
    : value_(StringInterner::default_interner().intern(name)) {}
Symbol::Symbol(std::string&& name)
    : value_(StringInterner::default_interner().intern(std::move(name))) {}
Symbol::Symbol(std::string_view name)
    : value_(StringInterner::default_interner().intern(name)) {}
Symbol::Symbol(uint64_t number) : value_(number) {}

std::ostream& operator<<(std::ostream& os, const Symbol& symbol) {
  if (symbol.is_named())
    return os << symbol.name();
  return os << symbol.number();
}

} // namespace caffeine