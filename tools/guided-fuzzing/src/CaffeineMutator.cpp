#include "include/CaffeineMutator.h"

#include <llvm/IR/Module.h>

#include "caffeine/Support/DiagnosticHandler.h"

namespace caffeine {
CaffeineMutator::CaffeineMutator(std::string binary_path, afl_state_t* afl) {
  this->afl = afl;

  llvm::LLVMContext context;
  context.setDiagnosticHandler(std::make_unique<DecafDiagnosticHandler>(),
                               true);
}
} // namespace caffeine
