#pragma once

#include "caffeine/ADT/StringInterner.h"
#include <iosfwd>
#include <string>
#include <variant>

namespace caffeine {

/**
 * Identifier for a symbolic constant.
 *
 * It can be either a string or a number as required. Numeric symbol names are
 * usually used for internal symbolic values such as allocations. String ones
 * are usually used for user-specified symbolic values.
 */
class Symbol {
private:
  enum {
    Named = 0,
    Numbered = 1,
  };

  std::variant<InternedString, uint64_t> value_;

public:
  Symbol(const std::string& name);
  Symbol(std::string&& name);
  Symbol(std::string_view name);
  Symbol(uint64_t number);

  template <size_t N>
  Symbol(const char (&name)[N]);

  bool is_named() const;
  bool is_numbered() const;

  InternedString name() const;
  uint64_t number() const;

  bool operator==(const Symbol& symbol) const;
  bool operator!=(const Symbol& symbol) const;

  friend llvm::hash_code hash_value(const Symbol& symbol);
};

std::ostream& operator<<(std::ostream& os, const Symbol& symbol);

} // namespace caffeine
