#include "caffeine/Interpreter/ExternalFuncs/ChainCall.h"
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

ChainCall::ChainCall(std::vector<llvm::Function*>&& funcs)
    : ExternalStackFrameMixin({}, nullptr), funcs(std::move(funcs)) {}
void ChainCall::step(InterpreterContext& ctx) {
  if (currFunction >= funcs.size()) {
    ctx.context().stack.pop_back();
    return;
  }
  CAFFEINE_ASSERT(funcs.at(currFunction)->getFunctionType()->getNumParams() ==
                      0,
                  "function in chaincall needs operands");

  ctx.context().stack.push_back(
      StackFrame::RegularFrame(funcs.at(currFunction)));
  currFunction++;
}

} // namespace caffeine
