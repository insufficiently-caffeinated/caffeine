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

bool Symbol::is_named() const {
  return value_.index() == Named;
}
bool Symbol::is_numbered() const {
  return value_.index() == Numbered;
}

InternedString Symbol::name() const {
  return std::get<Named>(value_);
}
uint64_t Symbol::number() const {
  return std::get<Numbered>(value_);
}

bool Symbol::operator==(const Symbol& symbol) const {
  return value_ == symbol.value_;
}
bool Symbol::operator!=(const Symbol& symbol) const {
  return !(*this == symbol);
}

} // namespace caffeine