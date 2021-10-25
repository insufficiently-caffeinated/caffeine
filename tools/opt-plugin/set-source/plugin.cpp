#include "plugins.h"
#include <llvm/Support/CommandLine.h>

using namespace llvm;

namespace caffeine {

cl::opt<std::string> newSourceFilename{
    "new-source-filename", cl::desc("Override the name of the module")};

bool SetSourcePass::runOnModule(llvm::Module &M) {
  if (newSourceFilename != "")
    return true;

  M.setSourceFileName(newSourceFilename);
  return true;
}

template<>
char LegacyModulePassAdapter<SetSourcePass>::ID = 0;

namespace {
  static RegisterPass<LegacyModulePassAdapter<SetSourcePass>>
      X(/* PassArg = */ SetSourcePass::Name,
        /* Name    = */ "Override module source_filename",
        /* CFGonly = */ false,
        /* isAnalysis = */ false);
}

}
