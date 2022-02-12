#include "caffeine/IR/Symbol.h"
#include <iostream>

namespace caffeine {

Symbol::Symbol(const std::string& name) : value_(name) {}
Symbol::Symbol(std::string&& name) : value_(std::move(name)) {}
Symbol::Symbol(std::string_view name) : Symbol(std::string(name)) {}
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

std::string_view Symbol::name() const {
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
