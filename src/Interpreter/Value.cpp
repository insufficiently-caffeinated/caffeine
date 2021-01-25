#include "caffeine/Interpreter/Value.h"

#include <type_traits>

namespace caffeine {

ContextValue::ContextValue(const ref<Operation>& op) : inner_(op) {}
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

const ref<Operation>& ContextValue::scalar() const {
  const auto* val = std::get_if<ref<Operation>>(&inner_);
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
      return os << "[" << ptr.alloc().first << " offset " << ptr.offset() << "]";
    return os << ptr.offset();
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

} // namespace caffeine
