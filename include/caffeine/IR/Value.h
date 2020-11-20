#ifndef CAFFEINE_IR_VALUE_H
#define CAFFEINE_IR_VALUE_H

#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>

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
 * - An empty value
 *
 * Each of these representations have a set of operations that are valid on them
 * (e.g. bvxxx for integers, fxxx for floats). All operations assert that their
 * operands have the correct type class and should only be used with operations
 * which have the same bitwidths.
 */
class Value {
public:
  enum Kind { Empty, Int, Float };

private:
  Kind kind_;
  union {
    llvm::APInt apint_;
    llvm::APFloat apfloat_;
  };

public:
  Value();

  Value(const llvm::APInt& apint);
  Value(llvm::APInt&& apint);

  Value(const llvm::APFloat& apfloat);
  Value(llvm::APFloat&& apfloat);

  Value(const ConstantInt& constant);
  Value(const ConstantFloat& constant);

  // clang-format off
  bool is_int()   const { return kind_ == Int;   }
  bool is_float() const { return kind_ == Float; }
  bool is_empty() const { return kind_ == Empty; }

  Kind kind() const { return kind_; }
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

  static Value select(const Value& cond, const Value& t, const Value& f);

  // These need to be defined since Value has an internal union
  Value(const Value&);
  Value(Value&&);
  Value& operator=(const Value&);
  Value& operator=(Value&&);

  ~Value();

private:
  void invalidate();
};

} // namespace caffeine

#endif
