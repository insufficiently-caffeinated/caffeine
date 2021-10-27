#include "plugins.h"
#include <llvm/ADT/ArrayRef.h>
#include <llvm/Passes/PassBuilder.h>

using namespace llvm;
using namespace caffeine;

namespace {

template <typename Pass>
void registerPass(llvm::PassBuilder& PB) {
  PB.registerPipelineParsingCallback(
      [](StringRef Name, ModulePassManager& FPM,
         ArrayRef<PassBuilder::PipelineElement>) {
        if (Name != Pass::Name)
          return false;
        FPM.addPass(Pass());
        return true;
      });
}

void RegisterPlugins(llvm::PassBuilder& PB) {
  registerPass<GenBuiltinsPass>(PB);
  registerPass<GenTestMainPass>(PB);
  registerPass<StripFunctionsPass>(PB);
  registerPass<SetSourcePass>(PB);
}
} // namespace

extern "C" PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo() {
  PassPluginLibraryInfo info;
  info.APIVersion = LLVM_PLUGIN_API_VERSION;
  info.PluginName = "caffeine-opt-plugin";
  info.PluginVersion = "0.0.0-alpha";
  info.RegisterPassBuilderCallbacks = &RegisterPlugins;
  return info;
}
