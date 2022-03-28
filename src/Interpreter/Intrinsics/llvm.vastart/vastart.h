#pragma once

#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/StackFrame.h"

/**
 * Implementing va_start
 * =====================
 * While LLVM has a va_arg instruction, clang almost never uses in favour of
 * having each target directly implement the logic to read the current argument
 * from the platform-specific __va_list_tag struct instance. Unfortunately, this
 * means that for every ABI we want to support within caffeine we have to
 * correctly set up the arguments so that the code emitted by clang will be
 * read the arguments correctly.
 *
 * Note that this doesn't mean we have to exactly follow what the calling
 * convention says to do, instead we just need to do something similar enough so
 * that the code works as expected.
 *
 * Unfortunately, this implementation means that it is impossible for caffeine
 * to verify that the right argument types are being read from the va_list
 * (since there's nowhere to inject the check).
 */

namespace caffeine::intrin::vastart {
llvm::StructType* getListTagType(llvm::Module* module);

// Implements
class x86_64VaStart : public ExternalStackFrameMixin<x86_64VaStart> {
public:
  x86_64VaStart(std::vector<LLVMValue>&& args, llvm::Function* func,
                llvm::CallBase* callinst)
      : ExternalStackFrameMixin<x86_64VaStart>(std::move(args), func),
        callinst(callinst) {}

  void step(InterpreterContext& ctx);

private:
  static void do_call(llvm::Function* func, InterpreterContext& ctx,
                   Span<LLVMValue> args);
  static IRStackFrame& caller(InterpreterContext& ctx);

private:
  size_t state = 0;
  llvm::CallBase* callinst;
};
} // namespace caffeine::intrin::vastart
