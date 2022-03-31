#include "caffeine/IR/Value.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/Interpreter.h"

namespace caffeine {

namespace {
  class CtlzIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const {
      CAFFEINE_ASSERT(args.size() == 2);

      unsigned bitwidth =
          func->getReturnType()->getScalarType()->getIntegerBitWidth();

      const auto& arg = args[0];
      auto zeros =
          broadcast(arg.num_elements(), ctx.createConstantZero(bitwidth));
      auto val = broadcast(arg.num_elements(),
                           ctx.createConstantInt(bitwidth, bitwidth));

      for (unsigned bit = 0; bit < bitwidth; bit++) {
        unsigned width = bitwidth - bit - 1;

        auto ext = ctx.createExtract(arg, bit);
        auto count = broadcast(arg.num_elements(),
                               ctx.createConstantInt(bitwidth, width));
        val = ctx.createSelect(ext, count, val);
      }

      ctx.jump_return(val);
    }

    static LLVMValue broadcast(size_t n, const LLVMScalar& scalar) {
      return LLVMValue(LLVMValue::OpVector(n, scalar));
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::ctlz() {
  return std::make_unique<CtlzIntrinsic>();
}

} // namespace caffeine
