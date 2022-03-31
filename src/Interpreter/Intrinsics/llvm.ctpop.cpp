#include "caffeine/IR/Value.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

namespace {
  class CtlzIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const {
      CAFFEINE_ASSERT(args.size() == 1);

      unsigned bitwidth =
          func->getReturnType()->getScalarType()->getIntegerBitWidth();

      const auto& arg = args[0];
      auto count =
          broadcast(arg.num_elements(), ctx.createConstantZero(bitwidth));

      for (unsigned bit = 0; bit <= bitwidth; bit++) {
        auto bval =
            ctx.createZExt(Type::int_ty(bitwidth), ctx.createExtract(arg, bit));
        count = ctx.createAdd(count, bval);
      }

      ctx.jump_return(count);
    }

    static LLVMValue broadcast(size_t n, const LLVMScalar& scalar) {
      return LLVMValue(LLVMValue::OpVector(n, scalar));
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::ctpop() {
  return std::make_unique<CtlzIntrinsic>();
}

} // namespace caffeine
