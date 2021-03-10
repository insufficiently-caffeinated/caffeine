#include "caffeine/Interpreter/Value.h"
#include "caffeine/IR/Operation.h"

#include <type_traits>

namespace caffeine {

LLVMScalar::operator ContextValue() const {
  if (is_expr())
    return ContextValue(expr());
  return ContextValue(pointer());
}
LLVMValue::operator ContextValue() const {
  CAFFEINE_ASSERT(!is_aggregate(),
                  "Cannot convert an aggregate LLVMValue to a ContextValue");

  if (is_scalar())
    return (ContextValue)scalar();

  std::vector<ContextValue> values;
  for (const auto& elem : elements()) {
    values.push_back((ContextValue)elem);
  }
  return ContextValue(std::move(values));
}

LLVMValue LLVMScalar::broadcast(size_t width) const {
  return LLVMValue(LLVMValue::OpVector(width, *this));
}

ContextValue::operator LLVMScalar() const {
  if (is_scalar())
    return LLVMScalar(scalar());
  if (is_pointer())
    return LLVMScalar(pointer());

  CAFFEINE_ABORT("Cannot convert a vector ContextValue to a LLVMScalar value");
}
ContextValue::operator LLVMValue() const {
  if (is_scalar() || is_pointer())
    return LLVMValue((LLVMScalar) * this);

  LLVMValue::OpVector vec;
  for (const auto& elem : vector()) {
    vec.push_back((LLVMScalar)elem);
  }
  return LLVMValue(std::move(vec));
}

ContextValue::ContextValue(const OpRef& op) : inner_(op) {}
ContextValue::ContextValue(const Pointer& ptr) : inner_(ptr) {}

ContextValue::ContextValue(const std::vector<ContextValue>& data)
    : inner_(data) {}
ContextValue::ContextValue(std::vector<ContextValue>&& data)
    : inner_(std::move(data)) {}

ContextValue::ContextValue(const ContextValue* data, size_t size)
    : inner_(slice(data, size)) {}

ContextValue::Kind ContextValue::kind() const {
  switch (inner_.index()) {
  case 0:
    return Scalar;
  case 1:
  case 2:
    return Vector;
  case 3:
    return Ptr;
  default:
    CAFFEINE_UNREACHABLE();
  }
}

ContextValue ContextValue::to_ref() const {
  if (const auto* vec = std::get_if<std::vector<ContextValue>>(&inner_))
    return ContextValue(vec->data(), vec->size());

  return *this;
}
ContextValue ContextValue::into_owned() && {
  if (const auto* val = std::get_if<slice>(&inner_))
    return ContextValue(
        std::vector<ContextValue>(val->data, val->data + val->size));
  return *this;
}

const OpRef& ContextValue::scalar() const {
  const auto* val = std::get_if<OpRef>(&inner_);
  CAFFEINE_ASSERT(val, "ContextValue was not a scalar");
  return *val;
}
llvm::ArrayRef<ContextValue> ContextValue::vector() const {
  auto [data, size] = std::visit(
      [&](const auto& val) -> std::pair<const ContextValue*, size_t> {
        using type = std::decay_t<decltype(val)>;

        if constexpr (std::is_same_v<type, slice>) {
          return std::make_pair(val.data, val.size);
        } else if constexpr (std::is_same_v<type, std::vector<ContextValue>>) {
          return std::make_pair(val.data(), val.size());
        } else {
          CAFFEINE_ABORT("ContextValue was not a vector");
        }
      },
      inner_);

  return llvm::ArrayRef<ContextValue>(data, size);
}
const Pointer& ContextValue::pointer() const {
  const auto* val = std::get_if<Pointer>(&inner_);
  CAFFEINE_ASSERT(val, "ContextValue was not a pointer");
  return *val;
}

std::ostream& operator<<(std::ostream& os, const ContextValue& value) {
  if (value.is_scalar())
    return os << *value.scalar();

  if (value.is_pointer()) {
    auto ptr = value.pointer();

    if (ptr.is_resolved())
      return os << "[" << ptr.alloc().first << " offset " << *ptr.offset()
                << "]";
    return os << *ptr.offset();
  }

  os << "<";
  bool is_first = true;

  for (const auto& val : value.vector()) {
    if (is_first)
      is_first = false;
    else
      os << ",\n ";

    os << val;
  }

  return os << ">";
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
