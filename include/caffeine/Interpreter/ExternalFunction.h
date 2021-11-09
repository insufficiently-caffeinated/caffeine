#pragma once

#include "caffeine/ADT/Span.h"

namespace caffeine {
class InterpreterContext;
class LLVMValue;

/**
 * Interface for an external (non-LLVM-IR) function.
 *
 * To implement a new external function all that is needed is to derive from
 * this class and then register that instance with the interpreter at startup
 * time.
 */
class ExternalFunction {
public:
  /**
   * @brief Call the external function this class implements.
   *
   * This method is responsible for carrying out the behaviour of the external
   * function. For simple functions, all that this may involve is computing the
   * result of the function (possibly forking along the way) and placing the
   * result on the stack of all the forks. More complicated functions can create
   * a custom external stack frame and place that on the stack for whatever
   * behaviours are needed.
   *
   * This function should be thread-safe as it may be called concurrently from
   * multiple threads.
   *
   * @param ctx An InterpreterContext which represents the current thread of
   *            execution.
   * @param args The arguments to the current function.
   */
  virtual void call(InterpreterContext& ctx, Span<LLVMValue> args) const = 0;

  ExternalFunction() = default;
  virtual ~ExternalFunction() = default;

protected:
  ExternalFunction(const ExternalFunction&) = default;
  ExternalFunction(ExternalFunction&&) = default;

  ExternalFunction& operator=(const ExternalFunction&) = default;
  ExternalFunction& operator=(ExternalFunction&&) = default;
};

} // namespace caffeine
