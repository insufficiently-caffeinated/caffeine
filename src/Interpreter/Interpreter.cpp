#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Support/Assert.h"

#include <fmt/format.h>

namespace caffeine {

Interpreter::Interpreter(Executor* queue) : queue{queue} {

}

ExecutionResult Interpreter::visitInstruction(llvm::Instruction &inst) {
  CAFFEINE_ABORT(fmt::format("Instruction '{}' not implemented!", inst.getOpcodeName()));
}

}