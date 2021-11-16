#include "caffeine/Interpreter/StackFrame.h"

namespace caffeine {

class CaffeineAssertFunc : public ExternalStackFrame {
public:
  using ExternalStackFrame::ExternalStackFrame;

  std::unique_ptr<ExternalStackFrame> clone() const override;
  void step(InterpreterContext& context) override;
};

} // namespace caffeine
