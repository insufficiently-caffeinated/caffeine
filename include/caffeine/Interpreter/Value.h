#ifndef CAFFEINE_INTERP_VALUE_H
#define CAFFEINE_INTERP_VALUE_H

#include "caffeine/ADT/Span.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/Memory/MemHeap.h"

#include <llvm/ADT/ArrayRef.h>

#include <iosfwd>
#include <variant>
#include <vector>

namespace caffeine {

class ContextValue;
class LLVMValue;
/**
 * A LLVM value that is not an aggregate or a vector.
 *
 * Currently, this can be either
 * - a scalar expression, or
 * - a pointer
 */
class LLVMScalar {
public:
  enum Kind { Expr, Pointer };

private:
  std::variant<OpRef, caffeine::Pointer> inner_;

public:
  LLVMScalar(const OpRef& value);
  LLVMScalar(const caffeine::Pointer& value);

  Kind kind() const;

  bool is_expr() const;
  bool is_pointer() const;

  const OpRef& expr() const;
  const caffeine::Pointer& pointer() const;

  // Create a vector consisting of n copies of this scalar.
  LLVMValue broadcast(size_t width) const;

public:
  explicit operator ContextValue() const;
};

/**
 * A general LLVM value.
 *
 * This can be any one of:
 * - A scalar or pointer, or
 * - A vector of scalars or pointers, or
 * - An aggregate structure containing nested LLVMValues
 *
 * In terms of implementation, this is implemented by having a vector of either
 * LLVMValues (for aggregates) and LLVMScalars (for vectors and scalars). A
 * scalar is logically a vector of size 1 and this class follows that
 * convention.
 */
class LLVMValue {
public:
  using OpVector = llvm::SmallVector<LLVMScalar, 4>;

private:
  enum { Vector, Aggregate };

  std::variant<OpVector, std::vector<LLVMValue>> inner_;

public:
  explicit LLVMValue(const LLVMScalar& value);
  explicit LLVMValue(OpVector&& values);
  explicit LLVMValue(llvm::ArrayRef<LLVMScalar> values);
  explicit LLVMValue(llvm::ArrayRef<LLVMValue> values);
  explicit LLVMValue(std::vector<LLVMValue>&& values);

  bool is_scalar() const;
  bool is_vector() const;
  bool is_aggregate() const;

  LLVMScalar& scalar();
  Span<LLVMScalar> vector();
  Span<LLVMValue> aggregate();
  const LLVMScalar& scalar() const;
  llvm::ArrayRef<LLVMScalar> vector() const;
  llvm::ArrayRef<LLVMValue> aggregate() const;

  size_t num_elements() const;
  LLVMScalar& element(size_t idx);
  const LLVMScalar& element(size_t idx) const;
  llvm::ArrayRef<LLVMScalar> elements() const;
  Span<LLVMScalar> elements();

  size_t num_members() const;
  LLVMValue& member(size_t idx);
  const LLVMValue& member(size_t idx) const;
  llvm::ArrayRef<LLVMValue> members() const;
  Span<LLVMValue> members();

public:
  explicit operator ContextValue() const;
};

/**
 * Map the elements composing any number of vectors to a new vector with the
 * same length. For this to work all vectors must have the same length otherwise
 * an assertion will fire.
 *
 * This is generally meant to match the semantics needed when implementing LLVM
 * opcodes.
 */
template <typename F, typename... Vals>
LLVMValue transform_elements(F&& func, const Vals&... values);

template <typename F, typename... Vals>
LLVMValue transform_exprs(F&& func, const Vals&... values);

std::ostream& operator<<(std::ostream& os, const LLVMScalar& value);
std::ostream& operator<<(std::ostream& os, const LLVMValue& value);

} // namespace caffeine

#include "caffeine/Interpreter/Value.inl"

#endif
