#include "caffeine/Interpreter/StackFrame.h"

namespace caffeine {

class CaffeineAssertFunc : public ExternalStackFrame {
public:
  CaffeineAssertFunc(uint64_t id) : ExternalStackFrame(id){};
  std::unique_ptr<ExternalStackFrame> clone() const override;
  ExternalStackFrame::CoroutineExecutionResult
  step(InterpreterContext& context,
       const std::vector<LLVMValue>& args) override;
};

} // namespace caffeine
