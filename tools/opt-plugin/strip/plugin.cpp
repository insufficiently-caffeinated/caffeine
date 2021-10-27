#include "plugins.h"
#include <llvm/Support/CommandLine.h>

using namespace llvm;

namespace caffeine {

cl::list<std::string> stripFunctions{
    "strip-function", cl::ZeroOrMore,
    cl::desc("Functions to strip from the bitcode module"),
    cl::value_desc("function")};

bool StripFunctionsPass::runOnModule(llvm::Module& M) {
  bool preserved = true;

  for (const std::string& name : stripFunctions) {
    auto func = M.getFunction(name);
    if (!func)
      continue;

    func->deleteBody();
    preserved = false;
  }

  return preserved;
}

template <>
char LegacyModulePassAdapter<StripFunctionsPass>::ID = 0;

namespace {
  static RegisterPass<LegacyModulePassAdapter<StripFunctionsPass>>
      X(/* PassArg = */ StripFunctionsPass::Name,
        /* Name    = */ "Remove the bodies of functions",
        /* CFGonly = */ false,
        /* isAnalysis = */ false);
}

} // namespace caffeine
