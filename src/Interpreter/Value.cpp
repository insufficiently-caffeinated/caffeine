#include "caffeine/Interpreter/Value.h"
#include "caffeine/IR/Operation.h"

#include <type_traits>

namespace caffeine {

LLVMValue LLVMScalar::broadcast(size_t width) const {
  return LLVMValue(LLVMValue::OpVector(width, *this));
}

std::ostream& operator<<(std::ostream& os, const LLVMScalar& value) {
  if (value.is_pointer()) {
    const Pointer& ptr = value.pointer();

    if (ptr.is_resolved())
      return os << "[" << ptr.alloc().first << " offset " << *ptr.offset()
                << "]";
    return os << "[" << *ptr.offset() << "]";
  }

  return os << *value.expr();
}

std::ostream& operator<<(std::ostream& os, const LLVMValue& value) {
  if (value.is_scalar())
    return os << value.scalar();

  if (value.is_vector()) {
    os << "<";
    bool is_first = true;

    for (const auto& val : value.elements()) {
      if (is_first)
        is_first = false;
      else
        os << ",\n ";

      os << val;
    }

    return os << ">";
  } else {
    os << "{";
    bool is_first = true;

    for (const auto& val : value.members()) {
      if (is_first)
        is_first = false;
      else
        os << ",\n ";

      os << val;
    }

    return os << "}";
  }
}

} // namespace caffeine
