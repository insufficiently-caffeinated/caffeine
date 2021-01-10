#include "caffeine/Interpreter/Value.h"

#include <fmt/format.h>
#include <llvm/IR/Constants.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <type_traits>

namespace caffeine {

static ContextValue evaluate_constant(llvm::Constant* constant) {
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantInt>(constant))
    return ContextValue(ConstantInt::Create(cnst->getValue()));

  if (auto* cnst = llvm::dyn_cast<llvm::ConstantFP>(constant))
    return ContextValue(ConstantFloat::Create(cnst->getValueAPF()));

  if (auto* undef = llvm::dyn_cast<llvm::UndefValue>(constant)) {
    auto type = undef->getType();

    if (type->isVectorTy()) {
      CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                      "scalable vectors are not supported");
      size_t count = type->getVectorNumElements();

      std::vector<ContextValue> result;
      result.reserve(count);

      auto inner = llvm::UndefValue::get(type->getVectorElementType());

      for (size_t i = 0; i < count; ++i)
        result.push_back(evaluate_constant(inner));

      return ContextValue(std::move(result));
    } else {
      return ContextValue(Undef::Create(Type::from_llvm(type)));
    }
  }

  if (auto* vec = llvm::dyn_cast<llvm::ConstantDataVector>(constant)) {
    CAFFEINE_ASSERT(!vec->getType()->getVectorIsScalable(),
                    "scalable vectors are not supported");

    auto type = vec->getType();
    auto count = type->getVectorNumElements();

    std::vector<ContextValue> result;
    result.reserve(count);

    // TODO: This is inefficient, should be directly converting for known
    //       element types.
    for (size_t i = 0; i < count; ++i)
      result.push_back(evaluate_constant(vec->getElementAsConstant(i)));

    return ContextValue(std::move(result));
  }

  if (auto* zero = llvm::dyn_cast<llvm::ConstantAggregateZero>(constant)) {
    auto type = zero->getType();

    if (type->isVectorTy()) {
      CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                      "scalable vectors are not supported");

      size_t count = type->getVectorNumElements();
      std::vector<ContextValue> result;
      result.reserve(count);

      for (size_t i = 0; i < count; ++i)
        result.push_back(evaluate_constant(zero->getElementValue(i)));

      return ContextValue(std::move(result));
    }
  }

  if (auto* vec = llvm::dyn_cast<llvm::ConstantVector>(constant)) {
    auto type = vec->getType();

    CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                    "scalable vectors are not supported");

    size_t count = type->getVectorNumElements();
    std::vector<ContextValue> result;
    result.reserve(count);

    for (size_t i = 0; i < count; ++i)
      result.push_back(evaluate_constant(vec->getOperand(i)));

    return ContextValue(std::move(result));
  }

  std::string s;
  llvm::raw_string_ostream os(s);
  constant->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(fmt::format("Unsupported constant operand: {}", s));
}

ContextValue::ContextValue(llvm::Constant* constant)
    : ContextValue(evaluate_constant(constant)) {}

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
