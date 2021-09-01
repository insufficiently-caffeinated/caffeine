#include <llvm/IR/PassManager.h>

namespace divine {

class AddCppLSDA : public llvm::PassInfoMixin<AddCppLSDA> {
public:
  llvm::PreservedAnalyses run(llvm::Module& mod,
                              llvm::ModuleAnalysisManager& AM);
  static bool isRequired() {
    return true;
  }
};

} // namespace divine
