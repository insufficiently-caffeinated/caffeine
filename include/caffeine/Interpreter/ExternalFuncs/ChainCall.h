#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Support/LLVMFmt.h"
#include <boost/range/algorithm/find_if.hpp>
#include <fmt/format.h>
#include <iterator>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <iostream>

#include "unwind.h"

namespace caffeine {

class ChainCall final : public ExternalStackFrameMixin<ChainCall> {
public:
  using ExternalStackFrameMixin<ChainCall>::ExternalStackFrameMixin;

  ChainCall(std::vector<llvm::Function*>&& funcs);
  void step(InterpreterContext& ctx) override;

private:
  size_t currFunction = 0;
  std::vector<llvm::Function*> funcs;
};

} // namespace caffeine
