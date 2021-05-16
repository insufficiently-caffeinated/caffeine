#include "caffeine/Support/DiagnosticHandler.h"

#include <llvm/IR/DiagnosticInfo.h>
#include <llvm/IR/DiagnosticPrinter.h>

using namespace llvm;

namespace caffeine {
bool DecafDiagnosticHandler::handleDiagnostics(const DiagnosticInfo& di) {
  unsigned severity = di.getSeverity();
  switch (severity) {
  case DS_Error:
    WithColor::error();
    break;
  case DS_Warning:
    WithColor::warning();
    break;
  case DS_Remark:
    WithColor::remark();
    break;
  case DS_Note:
    WithColor::note();
    break;
  default:
    llvm_unreachable("DiagnosticInfo had unknown severity level");
  }

  DiagnosticPrinterRawOStream dp(errs());
  di.print(dp);
  errs() << '\n';

  return true;
}
} // namespace caffeine
