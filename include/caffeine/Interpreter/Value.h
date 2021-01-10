#ifndef CAFFEINE_INTERP_VALUE_H
#define CAFFEINE_INTERP_VALUE_H

#include "caffeine/IR/Operation.h"
#include "caffeine/Memory/MemHeap.h"

#include <llvm/ADT/ArrayRef.h>
#include <llvm/IR/Constant.h>

#include <iosfwd>
#include <variant>
#include <vector>

namespace caffeine {

/**
 * An LLVM value as represented within a stack frame.
 *
 * Can be either
 * - a single value (scalar), or
 * - a recursive array of values (vector)
 */
class ContextValue {
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

  std::variant<ref<Operation>, std::vector<ContextValue>, slice, Pointer>
      inner_;

public:
  explicit ContextValue(llvm::Constant* constant);
  explicit ContextValue(const ref<Operation>& op);
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

  const ref<Operation>& scalar() const;
  llvm::ArrayRef<ContextValue> vector() const;
  const Pointer& pointer() const;
};

/**
 * Map the ref<Operation> elements of any number of ContextValues
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

} // namespace caffeine

#include "caffeine/Interpreter/Value.inl"

#endif
