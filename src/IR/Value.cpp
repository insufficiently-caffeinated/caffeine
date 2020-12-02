#include "caffeine/IR/Value.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Support/Assert.h"

#include <llvm/ADT/SmallString.h>

#include <iostream>
#include <string_view>

namespace caffeine {

Value::Value() : kind_(Empty) {}

Value::Value(const llvm::APInt& apint) : kind_(Int), apint_(apint) {}
Value::Value(llvm::APInt&& apint) : kind_(Int), apint_(std::move(apint)) {}

Value::Value(const llvm::APFloat& apfloat) : kind_(Float), apfloat_(apfloat) {}
Value::Value(llvm::APFloat&& apfloat) : kind_(Float), apfloat_(apfloat) {}

Value::Value(const ConstantInt& constant) : Value(constant.value()) {}
Value::Value(const ConstantFloat& constant) : Value(constant.value()) {}

Value::Value(const Value& v) : kind_(Empty) {
  switch (v.kind()) {
  case Empty:
    break;
  case Int:
    new (&apint_) llvm::APInt(v.apint_);
    break;
  case Float:
    new (&apfloat_) llvm::APFloat(v.apfloat_);
    break;
  }

  kind_ = v.kind();
}
Value::Value(Value&& v) : kind_(Empty) {
  switch (v.kind()) {
  case Empty:
    break;
  case Int:
    new (&apint_) llvm::APInt(std::move(v.apint_));
    break;
  case Float:
    new (&apfloat_) llvm::APFloat(std::move(v.apfloat_));
    break;
  }

  kind_ = v.kind();
}
Value& Value::operator=(const Value& v) {
  invalidate();

  switch (v.kind()) {
  case Empty:
    break;
  case Int:
    new (&apint_) llvm::APInt(v.apint_);
    break;
  case Float:
    new (&apfloat_) llvm::APFloat(v.apfloat_);
    break;
  }

  kind_ = v.kind();
  return *this;
}
Value& Value::operator=(Value&& v) {
  invalidate();

  switch (v.kind()) {
  case Empty:
    break;
  case Int:
    new (&apint_) llvm::APInt(std::move(v.apint_));
    break;
  case Float:
    new (&apfloat_) llvm::APFloat(std::move(v.apfloat_));
    break;
  }

  kind_ = v.kind();
  return *this;
}

Value::~Value() {
  invalidate();
}

void Value::invalidate() {
  auto kind = kind_;
  kind_ = Empty;

  switch (kind) {
  case Empty:
    break;
  case Int:
    apint_.~APInt();
    break;
  case Float:
    apfloat_.~APFloat();
    break;
  }
}

Type Value::type() const {
  switch (kind()) {
  case Empty:
    return Type::void_ty();
  case Int:
    return Type::type_of(apfloat_);
  case Float:
    return Type::type_of(apint_);
  }

  CAFFEINE_UNREACHABLE();
}

llvm::APInt& Value::apint() {
  CAFFEINE_ASSERT(is_int());
  return apint_;
}
const llvm::APInt& Value::apint() const {
  CAFFEINE_ASSERT(is_int());
  return apint_;
}

llvm::APFloat& Value::apfloat() {
  CAFFEINE_ASSERT(is_float());
  return apfloat_;
}
const llvm::APFloat& Value::apfloat() const {
  CAFFEINE_ASSERT(is_float());
  return apfloat_;
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
  }

  CAFFEINE_UNREACHABLE();
}
bool Value::operator!=(const Value& v) const {
  return !(*this == v);
}

Value Value::bvadd(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_ + rhs.apint_;
}
Value Value::bvsub(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_ - rhs.apint_;
}
Value Value::bvmul(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_ * rhs.apint_;
}
Value Value::bvudiv(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_.udiv(rhs.apint_);
}
Value Value::bvsdiv(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_.sdiv(rhs.apint_);
}
Value Value::bvurem(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_.urem(rhs.apint_);
}
Value Value::bvsrem(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_.srem(rhs.apint_);
}

Value Value::bvand(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_ & rhs.apint_;
}
Value Value::bvor(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_ | rhs.apint_;
}
Value Value::bvxor(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_ ^ rhs.apint_;
}
Value Value::bvshl(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_ << rhs.apint_;
}
Value Value::bvlshr(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_.lshr(rhs.apint_);
}
Value Value::bvashr(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_int());
  CAFFEINE_ASSERT(rhs.is_int());

  return lhs.apint_.ashr(rhs.apint_);
}
Value Value::bvnot(const Value& v) {
  CAFFEINE_ASSERT(v.is_int());

  return ~v.apint_;
}

Value Value::fadd(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_float());
  CAFFEINE_ASSERT(rhs.is_float());

  return lhs.apfloat_ + rhs.apfloat_;
}
Value Value::fsub(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_float());
  CAFFEINE_ASSERT(rhs.is_float());

  return lhs.apfloat_ - rhs.apfloat_;
}
Value Value::fmul(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_float());
  CAFFEINE_ASSERT(rhs.is_float());

  return lhs.apfloat_ * rhs.apfloat_;
}
Value Value::fdiv(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_float());
  CAFFEINE_ASSERT(rhs.is_float());

  return lhs.apfloat_ / rhs.apfloat_;
}
Value Value::frem(const Value& lhs, const Value& rhs) {
  CAFFEINE_ASSERT(lhs.is_float());
  CAFFEINE_ASSERT(rhs.is_float());

  auto value = lhs.apfloat_;
  value.remainder(rhs.apfloat_);
  return value;
}
Value Value::fneg(const Value& v) {
  CAFFEINE_ASSERT(v.is_float());

  return llvm::APFloat::getZero(v.apfloat_.getSemantics()) - v.apfloat_;
}

Value Value::select(const Value& cond, const Value& t, const Value& f) {
  CAFFEINE_ASSERT(cond.type() == Type::bool_ty());
  CAFFEINE_ASSERT(t.type() == f.type());

  return cond.apint() == 1 ? t : f;
}

std::ostream& operator<<(std::ostream& os, const Value& v) {
  if (v.is_int())
    return os << v.apint().toString(10, false);
  else if (v.is_float()) {
    llvm::SmallString<256> str;
    v.apfloat().toString(str);

    return os << std::string_view(str.data(), str.size());
  } else {
    return os << "<empty>";
  }
}

} // namespace caffeine