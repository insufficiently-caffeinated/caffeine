#pragma once

#include "caffeine/Interpreter/ExternalFunction.h"

namespace caffeine {

class MallocAlignFunction : public ExternalFunction {
public:
  void call(llvm::CallBase*, InterpreterContext& ctx,
            Span<LLVMValue> args) const override;
};

} // namespace caffeine
