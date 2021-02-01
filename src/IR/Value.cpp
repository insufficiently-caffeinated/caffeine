#include "caffeine/IR/Value.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

#include <llvm/ADT/SmallString.h>

#include <iostream>
#include <string_view>

using llvm::APFloat;
using llvm::APInt;

namespace caffeine {

Value::Value(const APInt& apint) : inner_(apint) {}
Value::Value(APInt&& apint) : inner_(std::move(apint)) {}

Value::Value(const APFloat& apfloat) : inner_(apfloat) {}
Value::Value(APFloat&& apfloat) : inner_(std::move(apfloat)) {}

Value::Value(const SharedArray& array, Type index_ty)
    : inner_([&]() -> ArrayData<SharedArray> {
        CAFFEINE_ASSERT(index_ty.is_int(), "index type was not an integer");
        return ArrayData(array, index_ty.bitwidth());
      }()) {}
Value::Value(SharedArray&& array, Type index_ty)
    : inner_([&]() -> ArrayData<SharedArray> {
        CAFFEINE_ASSERT(index_ty.is_int(), "index type was not an integer");
        return ArrayData(std::move(array), index_ty.bitwidth());
      }()) {}

Value::Value(const std::vector<Value>& array, Type index_ty)
    : inner_([&]() -> ArrayData<std::vector<Value>> {
        CAFFEINE_ASSERT(index_ty.is_int(), "index type was not an integer");
        return ArrayData(array, index_ty.bitwidth());
      }()) {}
Value::Value(std::vector<Value>&& array, Type index_ty)
    : inner_([&]() -> ArrayData<std::vector<Value>> {
        CAFFEINE_ASSERT(index_ty.is_int(), "index type was not an integer");
        return ArrayData(std::move(array), index_ty.bitwidth());
      }()) {}

Value::Value(const ConstantInt& constant) : Value(constant.value()) {}
Value::Value(const ConstantFloat& constant) : Value(constant.value()) {}

Type Value::type() const {
  switch (kind()) {
  case Empty:
    return Type::void_ty();
  case Int:
    return Type::type_of(apint());
  case Float:
    return Type::type_of(apfloat());
  case Array:
    return Type::array_ty(
        std::get<ArrayData<SharedArray>>(inner_).index_bitwidth);
  case NestedArray:
    return Type::array_ty(
        std::get<ArrayData<std::vector<Value>>>(inner_).index_bitwidth);
  }

  CAFFEINE_UNREACHABLE();
}

APInt& Value::apint() {
  CAFFEINE_ASSERT(is_int());
  return std::get<llvm::APInt>(inner_);
}
const APInt& Value::apint() const {
  CAFFEINE_ASSERT(is_int());
  return std::get<llvm::APInt>(inner_);
}

APFloat& Value::apfloat() {
  CAFFEINE_ASSERT(is_float());
  return std::get<llvm::APFloat>(inner_);
}
const APFloat& Value::apfloat() const {
  CAFFEINE_ASSERT(is_float());
  return std::get<llvm::APFloat>(inner_);
}

SharedArray& Value::array() {
  CAFFEINE_ASSERT(is_array());
  return std::get<ArrayData<SharedArray>>(inner_).data;
}
const SharedArray& Value::array() const {
  CAFFEINE_ASSERT(is_array());
  return std::get<ArrayData<SharedArray>>(inner_).data;
}

std::vector<Value>& Value::nested_array() {
  CAFFEINE_ASSERT(is_nested_array());
  return std::get<ArrayData<std::vector<Value>>>(inner_).data;
}
const std::vector<Value>& Value::nested_array() const {
  CAFFEINE_ASSERT(is_nested_array());
  return std::get<ArrayData<std::vector<Value>>>(inner_).data;
}

bool Value::operator==(const Value& v) const {
  if (kind() != v.kind())
    return false;

  switch (kind()) {
  case Empty:
    return true;
  case Int:
    return apint() == v.apint();
  case Float:
    return apfloat().bitwiseIsEqual(v.apfloat());
  case Array:
    return array() == v.array();
  case NestedArray:
    return nested_array() == v.nested_array();
  }

  CAFFEINE_UNREACHABLE();
}
bool Value::operator!=(const Value& v) const {
  return !(*this == v);
}

Value Value::bvadd(const Value& lhs, const Value& rhs) {
  return lhs.apint() + rhs.apint();
}
Value Value::bvsub(const Value& lhs, const Value& rhs) {
  return lhs.apint() - rhs.apint();
}
Value Value::bvmul(const Value& lhs, const Value& rhs) {
  return lhs.apint() * rhs.apint();
}
Value Value::bvudiv(const Value& lhs, const Value& rhs) {
  return lhs.apint().udiv(rhs.apint());
}
Value Value::bvsdiv(const Value& lhs, const Value& rhs) {
  return lhs.apint().sdiv(rhs.apint());
}
Value Value::bvurem(const Value& lhs, const Value& rhs) {
  return lhs.apint().urem(rhs.apint());
}
Value Value::bvsrem(const Value& lhs, const Value& rhs) {
  return lhs.apint().srem(rhs.apint());
}

Value Value::bvand(const Value& lhs, const Value& rhs) {
  return lhs.apint() & rhs.apint();
}
Value Value::bvor(const Value& lhs, const Value& rhs) {
  return lhs.apint() | rhs.apint();
}
Value Value::bvxor(const Value& lhs, const Value& rhs) {
  return lhs.apint() ^ rhs.apint();
}
Value Value::bvshl(const Value& lhs, const Value& rhs) {
  return lhs.apint() << rhs.apint();
}
Value Value::bvlshr(const Value& lhs, const Value& rhs) {
  return lhs.apint().lshr(rhs.apint());
}
Value Value::bvashr(const Value& lhs, const Value& rhs) {
  return lhs.apint().ashr(rhs.apint());
}
Value Value::bvnot(const Value& v) {
  return ~v.apint();
}

Value Value::fadd(const Value& lhs, const Value& rhs) {
  return lhs.apfloat() + rhs.apfloat();
}
Value Value::fsub(const Value& lhs, const Value& rhs) {
  return lhs.apfloat() - rhs.apfloat();
}
Value Value::fmul(const Value& lhs, const Value& rhs) {
  return lhs.apfloat() * rhs.apfloat();
}
Value Value::fdiv(const Value& lhs, const Value& rhs) {
  return lhs.apfloat() / rhs.apfloat();
}
Value Value::frem(const Value& lhs, const Value& rhs) {
  auto value = lhs.apfloat();
  value.remainder(rhs.apfloat());
  return value;
}
Value Value::fneg(const Value& v) {
  CAFFEINE_ASSERT(v.is_float());

  return APFloat::getZero(v.apfloat().getSemantics()) - v.apfloat();
}
Value Value::FIsNaN(const Value& v) {
  CAFFEINE_ASSERT(v.is_float());

  return Value(llvm::APInt(1, v.apfloat().isNaN()));
}

Value Value::select(const Value& cond, const Value& t, const Value& f) {
  CAFFEINE_ASSERT(cond.type() == Type::bool_ty());
  CAFFEINE_ASSERT(t.type() == f.type());

  return cond.apint() == 1 ? t : f;
}

Value Value::trunc(const Value& v, uint32_t bitwidth) {
  CAFFEINE_ASSERT(v.is_int());
  CAFFEINE_ASSERT(v.type().bitwidth() > bitwidth);

  return v.apint().trunc(bitwidth);
}
Value Value::sext(const Value& v, uint32_t bitwidth) {
  CAFFEINE_ASSERT(v.is_int());
  CAFFEINE_ASSERT(v.type().bitwidth() < bitwidth);

  return v.apint().sext(bitwidth);
}
Value Value::zext(const Value& v, uint32_t bitwidth) {
  CAFFEINE_ASSERT(v.is_int());
  CAFFEINE_ASSERT(v.type().bitwidth() < bitwidth);

  return v.apint().zext(bitwidth);
}
Value Value::bitcast(const Value& v, const Type& tgt) {
  if (v.is_int()) {
    CAFFEINE_ASSERT(tgt.is_float());
    CAFFEINE_ASSERT(v.type().bitwidth() ==
                    tgt.mantissa_bits() + tgt.exponent_bits());

    if (tgt == Type::type_of<float>())
      return APFloat(v.apint().bitsToFloat());
    if (tgt == Type::type_of<double>())
      return APFloat(v.apint().bitsToDouble());
    if (tgt == Type::float_ty(5, 11))
      return APFloat(APFloat::EnumToSemantics(APFloat::S_IEEEhalf), v.apint());
    if (tgt == Type::float_ty(15, 113))
      return APFloat(APFloat::EnumToSemantics(APFloat::S_IEEEquad), v.apint());
    if (tgt == Type::float_ty(15, 64))
      return APFloat(APFloat::EnumToSemantics(APFloat::S_x87DoubleExtended),
                     v.apint());

    CAFFEINE_UNIMPLEMENTED();
  } else {
    CAFFEINE_ASSERT(tgt.is_int());
    CAFFEINE_ASSERT(tgt.bitwidth() ==
                    v.type().mantissa_bits() + v.type().exponent_bits());

    return v.apfloat().bitcastToAPInt();
  }
}

Value Value::load(const Value& data, const Value& index) {
  CAFFEINE_ASSERT(data.is_array());
  CAFFEINE_ASSERT(index.is_int());
  CAFFEINE_ASSERT(data.type().bitwidth() == index.type().bitwidth());
  CAFFEINE_ASSERT(index.apint().ult(data.array().size()),
                  "attempted to load from out of bounds index");

  return Value(
      llvm::APInt(8, (uint8_t)data.array()[index.apint().getLimitedValue()]));
}
Value Value::store(const Value& data, const Value& index, const Value& byte) {
  CAFFEINE_ASSERT(data.is_array());
  CAFFEINE_ASSERT(index.is_int());
  CAFFEINE_ASSERT(data.type().bitwidth() == index.type().bitwidth());
  CAFFEINE_ASSERT(byte.type() == Type::int_ty(8));
  CAFFEINE_ASSERT(index.apint().ult(data.array().size()),
                  "attempted to load from out of bounds index");

  auto array = data.array();
  array.store(index.apint().getLimitedValue(),
              (char)byte.apint().getLimitedValue());
  return Value(std::move(array), index.type());
}

std::ostream& operator<<(std::ostream& os, const Value& v) {
  if (v.is_int())
    return os << v.apint().toString(10, false);
  else if (v.is_float()) {
    llvm::SmallString<256> str;
    v.apfloat().toString(str);

    return os << std::string_view(str.data(), str.size());
  } else if (v.is_array()) {
    // TODO: Pretty print values
    return os << "<array>";
  } else if (v.is_nested_array()) {
    // TODO: Pretty print values
    return os << "<nested-array>";
  } else if (v.is_empty()) {
    return os << "<empty>";
  }

  // If this was reached, it's an indication that more types were added without
  // modifying the printing logic
  CAFFEINE_UNREACHABLE();
}

} // namespace caffeine
