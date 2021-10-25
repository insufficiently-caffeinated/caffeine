#pragma once

#include "llvm/IR/PassManager.h"
#include <llvm/IR/PassManager.h>
#include <llvm/Pass.h>
#include <llvm/Passes/PassPlugin.h>

namespace caffeine {

template <typename Pass>
class CaffeinePassMixin : public llvm::PassInfoMixin<Pass> {
public:
  llvm::PreservedAnalyses run(llvm::Module& M, llvm::ModuleAnalysisManager&) {
    return static_cast<Pass*>(this)->runOnModule(M)
               ? llvm::PreservedAnalyses::all()
               : llvm::PreservedAnalyses::none();
  }
};

/**
 * Pass to generate code for various LLVM builtins that we handle outside the
 * main caffeine binary.
 */
class GenBuiltinsPass : public CaffeinePassMixin<GenBuiltinsPass> {
public:
  static constexpr const char* Name = "caffeine-gen-builtins";

  bool runOnModule(llvm::Module& m);
};

class GenTestMainPass : public CaffeinePassMixin<GenTestMainPass> {
public:
  static constexpr const char* Name = "caffeine-gen-test-main";

  bool runOnModule(llvm::Module& m);
};

class StripFunctionsPass : public CaffeinePassMixin<StripFunctionsPass> {
public:
  static constexpr const char* Name = "caffeine-strip-functions";

  bool runOnModule(llvm::Module& m);
};

class SetSourcePass : public CaffeinePassMixin<SetSourcePass> {
public:
  static constexpr const char* Name = "caffeine-override-source-filename";

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
