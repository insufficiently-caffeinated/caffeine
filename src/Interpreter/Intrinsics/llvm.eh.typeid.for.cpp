#include "caffeine/IR/Value.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

namespace {
  class EhTypeidForIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function*, InterpreterContext& ctx,
              Span<LLVMValue> args) const {
      CAFFEINE_ASSERT(args.size() == 1);

      // This dance has to happen because we don't have the llvm::Constant
      // being fed into this function
      auto call = llvm::dyn_cast<llvm::CallBase>(ctx.getCurrentInstruction());
      CAFFEINE_ASSERT(call,
                      "This intrinsic must have been called from somewhere");
      auto global_val = llvm::dyn_cast<llvm::Constant>(call->getArgOperand(0));
      CAFFEINE_ASSERT(global_val,
                      "The arg to llvm.typeid.for should be a constant");

      int32_t res = ctx.caffeine().typeid_db()->get_selector(global_val);

      ctx.jump_return(LLVMValue(ConstantInt::Create(llvm::APInt(32, res))));
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::eh_typeid_for() {
  return std::make_unique<EhTypeidForIntrinsic>();
}

} // namespace caffeine
