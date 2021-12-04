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
 *
 * Note that this is different from an ExternalStackFrame instance. An external
 * stack frame allows for more easily dealing with forking and is necessary if
 * an external function wants to call out to other functions. An external
 * function _may_ create an external stack frame and put it on the stack but
 * this is not necessary and most external functions will likely not need to do
 * so.
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

/**
 * @brief Builder methods for all external function instances.
 *
 * This class is basically just a namespace for static builder functions so that
 * downstream users (i.e. pretty much just CaffeineContext) don't need to
 * include all the respective headers.
 *
 * The naming convention I've chosen to take here is that the function name in
 * this class is exactly the same as whatever external function is modelling.
 */
class ExternalFunctions {
public:
  static std::unique_ptr<ExternalFunction> caffeine_assert();
  static std::unique_ptr<ExternalFunction> caffeine_assume();
  static std::unique_ptr<ExternalFunction> caffeine_malloc_aligned();

private:
  ExternalFunctions() = delete;
};

/**
 * @brief Builder metrhods for all external function instances.
 *
 * This class is basically just a namespace for static builder functions so that
 * downstream users don't need to include all the relevant headers.
 *
 * The naming convention here is that functions in this class should match their
 * LLVM intrinsic ID enum name.
 */
class Intrinsics {
public:
  static std::unique_ptr<ExternalFunction> smul_with_overflow();
  static std::unique_ptr<ExternalFunction> umul_with_overflow();

private:
  Intrinsics() = delete;
};

} // namespace caffeine
