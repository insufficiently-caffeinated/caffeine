#pragma once

#include <llvm/IR/DiagnosticHandler.h>

namespace caffeine {

struct CaffeineDiagnosticHandler : public llvm::DiagnosticHandler {
  bool handleDiagnostics(const llvm::DiagnosticInfo& di) override;
};

} // namespace caffeine
