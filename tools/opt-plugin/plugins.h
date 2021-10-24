#pragma once

#include <llvm/IR/PassManager.h>
#include <llvm/Pass.h>
#include <llvm/Passes/PassPlugin.h>

namespace caffeine {

/**
 * Pass to generate code for various LLVM builtins that we handle outside the
 * main caffeine binary.
 */
class GenBuiltinsPass : public llvm::PassInfoMixin<GenBuiltinsPass> {
public:
  static constexpr const char* Name = "caffeine-gen-builtins";

  llvm::PreservedAnalyses run(llvm::Module& M, llvm::ModuleAnalysisManager&);
  bool runOnModule(llvm::Module& m);
};

class GenTestMainPass : public llvm::PassInfoMixin<GenTestMainPass> {
public:
  static constexpr const char* Name = "caffeine-gen-test-main";

  llvm::PreservedAnalyses run(llvm::Module& M, llvm::ModuleAnalysisManager&);
  bool runOnModule(llvm::Module& m);
};

class StripFunctionsPass : public llvm::PassInfoMixin<StripFunctionsPass> {
public:
  static constexpr const char* Name = "caffeine-strip-functions";

  llvm::PreservedAnalyses run(llvm::Module& M, llvm::ModuleAnalysisManager&);
  bool runOnModule(llvm::Module& m);
};

template <typename T>
class LegacyModulePassAdapter : public llvm::ModulePass {
private:
  T pass;

public:
  LegacyModulePassAdapter() : llvm::ModulePass(ID) {}

  bool runOnModule(llvm::Module& M) override {
    return pass.runOnModule(M);
  }

  static char ID;
};

} // namespace caffeine
