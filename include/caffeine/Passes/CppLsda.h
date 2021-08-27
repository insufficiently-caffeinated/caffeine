#include <llvm/Pass.h>

namespace caffeine {

struct AddCppLSDA : llvm::ModulePass {

  bool runOnModule(llvm::Module& mod) override;
};

} // namespace caffeine
