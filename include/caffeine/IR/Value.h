#ifndef CAFFEINE_IR_VALUE_H
#define CAFFEINE_IR_VALUE_H

#include "caffeine/ADT/SharedArray.h"

#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>

#include <cstdint>
#include <iosfwd>
#include <variant>

namespace caffeine {

class Type;
class ConstantInt;
class ConstantFloat;

/**
 * A concrete value that may be the result of an expression.
 *
 * This class is meant to be used anywhere it's needed to evaluate an expression
 * to a concrete value. This includes evaluating models and as a utility within
 * optimizations.
 *
 * A value can either be
 * - A fixed-width (with arbitrary width) integer (via llvm::APInt)
 * - A floating-point type (via llvm::APFloat)
 * - A byte array (via SharedArray)
 * - An empty value
 *
 * Each of these representations have a set of operations that are valid on them
 * (e.g. bvxxx for integers, fxxx for floats). All operations assert that their
 * operands have the correct type class and should only be used with operations
 * which have the same bitwidths.
 */
class Value {
public:
  // Note: These correspond to the variant indices.
  enum Kind { Empty, Int, Float, Array, NestedArray };

private:
  template <typename T>
  struct ArrayData {
    T data;
    uint32_t index_bitwidth;

    ArrayData(const T& data, uint32_t idx_width)
        : data(data), index_bitwidth(idx_width){};
    ArrayData(T&& data, uint32_t idx_width)
        : data(data), index_bitwidth(idx_width){};
  };

  using Inner =
      std::variant<std::monostate, llvm::APInt, llvm::APFloat,
                   ArrayData<SharedArray>, ArrayData<std::vector<Value>>>;

  Inner inner_;

public:
  Value() = default;

  Value(const llvm::APInt& apint);
  Value(llvm::APInt&& apint);

  Value(const llvm::APFloat& apfloat);
  Value(llvm::APFloat&& apfloat);

  Value(const SharedArray& array, Type index_ty);
  Value(SharedArray&& array, Type index_ty);

  Value(const std::vector<Value>& array, Type index_ty);
  Value(std::vector<Value>&& array, Type index_ty);

  Value(const ConstantInt& constant);
  Value(const ConstantFloat& constant);

  // clang-format off
  bool is_int()   const { return inner_.index() == Int;   }
  bool is_float() const { return inner_.index() == Float; }
  bool is_empty() const { return inner_.index() == Empty; }
  bool is_array() const { return inner_.index() == Array; }
  bool is_nested_array() const { return inner_.index() == NestedArray; }

  Kind kind() const { return static_cast<Kind>(inner_.index()); }
  Type type() const;
  // clang-format on

  // Note: floating-point values are compared using bitwise equality. *NOT* the
  //       IEEE-754 equality predicate.
  bool operator==(const Value& v) const;
  bool operator!=(const Value& v) const;

  llvm::APInt& apint();
  const llvm::APInt& apint() const;

  llvm::APFloat& apfloat();
  const llvm::APFloat& apfloat() const;

  SharedArray& array();
  const SharedArray& array() const;

  std::vector<Value>& nested_array();
  const std::vector<Value>& nested_array() const;

  // Value operations
  static Value bvadd(const Value& lhs, const Value& rhs);
  static Value bvsub(const Value& lhs, const Value& rhs);
  static Value bvmul(const Value& lhs, const Value& rhs);
  static Value bvudiv(const Value& lhs, const Value& rhs);
  static Value bvsdiv(const Value& lhs, const Value& rhs);
  static Value bvurem(const Value& lhs, const Value& rhs);
  static Value bvsrem(const Value& lhs, const Value& rhs);

  static Value bvand(const Value& lhs, const Value& rhs);
  static Value bvor(const Value& lhs, const Value& rhs);
  static Value bvxor(const Value& lhs, const Value& rhs);
  static Value bvshl(const Value& lhs, const Value& rhs);
  static Value bvlshr(const Value& lhs, const Value& rhs);
  static Value bvashr(const Value& lhs, const Value& rhs);
  static Value bvnot(const Value& v);

  static Value fadd(const Value& lhs, const Value& rhs);
  static Value fsub(const Value& lhs, const Value& rhs);
  static Value fmul(const Value& lhs, const Value& rhs);
  static Value fdiv(const Value& lhs, const Value& rhs);
  static Value frem(const Value& lhs, const Value& rhs);
  static Value fneg(const Value& v);
  static Value FIsNaN(const Value& v);

  static Value select(const Value& cond, const Value& t, const Value& f);

  static Value trunc(const Value& v, uint32_t bitwidth);
  static Value sext(const Value& v, uint32_t bitwidth);
  static Value zext(const Value& v, uint32_t bitwidth);
  static Value bitcast(const Value& v, const Type& tgt);

  static Value load(const Value& data, const Value& index);
  static Value store(const Value& data, const Value& index, const Value& byte);

  Value(const Value&) = default;
  Value(Value&&) = default;
  Value& operator=(const Value&) = default;
  Value& operator=(Value&&) = default;

  ~Value() = default;

  friend std::ostream& operator<<(std::ostream& os, const Value& v);
};

std::ostream& operator<<(std::ostream& os, const Value& v);

} // namespace caffeine

#endif
