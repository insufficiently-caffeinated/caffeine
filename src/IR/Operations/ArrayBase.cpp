#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationData.h"
#include <caffeine/Support/Assert.h>

namespace caffeine {

OpRef ArrayBase::size() const {
  switch (opcode()) {
  case Alloc:
  case ConstantArray:
    return operand_at(0);
  case Store:
    return llvm::cast<ArrayBase>(*operand_at(0)).size();
  case FixedArray:
    return ConstantInt::Create(
        llvm::APInt(type().bitwidth(), operands_.size()));
  }

  CAFFEINE_UNIMPLEMENTED("unexpected ArrayBase opcode");
}

} // namespace caffeine
