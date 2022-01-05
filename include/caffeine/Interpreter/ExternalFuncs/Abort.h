#include "caffeine/Interpreter/ExternalFunction.h"

namespace caffeine {

class AbortFunction : public ExternalFunction {
public:
  void call(llvm::Function* cb, InterpreterContext& ctx,
            Span<LLVMValue> args) const override;
};

} // namespace caffeine
