#pragma once

#include <llvm/IR/Module.h>

namespace caffeine {

struct DecafDiagnosticHandler : public llvm::DiagnosticHandler {
  bool handleDiagnostics(const llvm::DiagnosticInfo& di) override;
};

} // namespace caffeine
