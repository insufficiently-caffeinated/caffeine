#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/StackFrame.h"

namespace caffeine {

class CaffeineAssertFunction : public ExternalFunction {
public:
  void call(InterpreterContext& ctx, Span<LLVMValue> args) const override;
};

class CaffeineAssertFunc : public ExternalStackFrame {
public:
  using ExternalStackFrame::ExternalStackFrame;

  std::unique_ptr<ExternalStackFrame> clone() const override;
  void step(InterpreterContext& context) override;
};

} // namespace caffeine
