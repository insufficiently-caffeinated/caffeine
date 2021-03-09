#ifndef CAFFEINE_INTERP_VALUE_H
#define CAFFEINE_INTERP_VALUE_H

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
  LLVMValue(const LLVMScalar& value);
  LLVMValue(OpVector&& values);
  LLVMValue(llvm::ArrayRef<LLVMScalar> values);
  LLVMValue(llvm::ArrayRef<LLVMValue> values);
  LLVMValue(std::vector<LLVMValue>&& values);

  bool is_scalar() const;
  bool is_vector() const;
  bool is_aggregate() const;

  const LLVMScalar& scalar() const;
  llvm::ArrayRef<LLVMScalar> vector() const;
  llvm::ArrayRef<LLVMValue> aggregate() const;

  size_t num_elements() const;
  const LLVMScalar& element(size_t idx) const;
  llvm::ArrayRef<LLVMScalar> elements() const;

  size_t num_members() const;
  const LLVMValue& member(size_t idx) const;
  llvm::ArrayRef<LLVMValue> members() const;

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

/**
 * An LLVM value as represented within a stack frame.
 *
 * Can be either
 * - a single value (scalar), or
 * - a recursive array of values (vector)
 */
class /* [[deprecated]] */ ContextValue {
public:
  enum Kind { Scalar, Vector, Ptr };

private:
  struct slice {
    const ContextValue* data;
    size_t size;

    constexpr slice() : data(nullptr), size(0) {}
    constexpr slice(const ContextValue* data, size_t size)
        : data(data), size(size) {}
  };

  std::variant<OpRef, std::vector<ContextValue>, slice, Pointer> inner_;

public:
  explicit ContextValue(const OpRef& op);
  explicit ContextValue(const std::vector<ContextValue>& data);
  explicit ContextValue(std::vector<ContextValue>&& data);
  explicit ContextValue(const Pointer& ptr);
  ContextValue(const ContextValue* data, size_t size);

  ContextValue(const ContextValue&) = default;
  ContextValue(ContextValue&&) = default;

  ContextValue& operator=(const ContextValue&) = default;
  ContextValue& operator=(ContextValue&&) = default;

  ContextValue to_ref() const;
  ContextValue into_owned() &&;

  bool is_vector() const;
  bool is_scalar() const;
  bool is_pointer() const;

  Kind kind() const;

  const OpRef& scalar() const;
  llvm::ArrayRef<ContextValue> vector() const;
  const Pointer& pointer() const;

public:
  explicit operator LLVMScalar() const;
  explicit operator LLVMValue() const;
};

/**
 * Map the OpRef elements of any number of ContextValues
 * to form a new ContextValue with the same shape.
 *
 * For this to work all ContextValues must have the same "shape"
 * (i.e. scalars cannot be combined with vectors, vectors must have
 * the same size) recursively.
 *
 * This generally is meant to match the semantics needed when implementing
 * LLVM opcodes.
 */
template <typename F, typename... Vs>
ContextValue transform(F&& func, const Vs&... values);

/**
 * Map the non-vector elements of any number of ContextValues to form a
 * new ContextValue with the same shape. This is a more general version
 * of transform that supports non-scalar context values (e.g. ones that
 * contain allocations).
 *
 * For this to work all ContextValues must have the same "shape"
 * (i.e. scalars cannot be combined with vectors, vectors must have
 * the same size) recursively.
 *
 * This generally is meant to match the semantics needed when implementing
 * LLVM opcodes.
 */
template <typename F, typename... Vs>
ContextValue transform_value(F&& func, const Vs&... values);

std::ostream& operator<<(std::ostream& os, const ContextValue& value);
std::ostream& operator<<(std::ostream& os, const LLVMScalar& value);
std::ostream& operator<<(std::ostream& os, const LLVMValue& value);

} // namespace caffeine

#include "caffeine/Interpreter/Value.inl"

#endif
