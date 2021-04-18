#include "plugins.h"
#include <llvm/Passes/PassBuilder.h>

using namespace llvm;

namespace {

void RegisterPlugins(llvm::PassBuilder& PB) {
  using namespace caffeine;

  PB.registerPipelineParsingCallback(
      [](StringRef Name, ModulePassManager& FPM,
         ArrayRef<PassBuilder::PipelineElement>) {
        if (Name != GenBuiltinsPass::Name)
          return false;
        FPM.addPass(GenBuiltinsPass());
        return true;
      });

  PB.registerPipelineParsingCallback(
      [](StringRef Name, ModulePassManager& FPM,
         ArrayRef<PassBuilder::PipelineElement>) {
        if (Name != GenTestMainPass::Name)
          return false;
        FPM.addPass(GenTestMainPass());
        return true;
      });
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
