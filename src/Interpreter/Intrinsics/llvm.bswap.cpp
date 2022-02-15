#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Memory/MemHeap.h"
#include <llvm/IR/Module.h>

namespace caffeine {

namespace {
  class BswapIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const {
      CAFFEINE_ASSERT(args.size() == 1);

      auto ret_ty = func->getReturnType();
      auto bitwidth = ret_ty->getScalarType()->getIntegerBitWidth();
      CAFFEINE_ASSERT(bitwidth % 16 == 0);

      LLVMValue::OpVector elements;
      for (const auto& elem : args[0].elements())
        elements.push_back(LLVMScalar(swap_single(ctx, elem.expr(), bitwidth)));

      ctx.jump_return(LLVMValue(std::move(elements)));
    }

    OpRef swap_single(InterpreterContext& ctx, const OpRef& value,
                      unsigned bitwidth) const {
      llvm::SmallVector<OpRef, 8> bytes;
      unsigned byte_width = bitwidth / 8;

      for (unsigned i = 0; i < byte_width; i++) {
        bytes.push_back(
            ctx.createTrunc(Type::int_ty(8), ctx.createLShr(value, i * 8)));
      }

      std::reverse(bytes.begin(), bytes.end());

      auto result = ctx.createZExt(Type::int_ty(bitwidth), bytes[0]);
      for (unsigned i = 1; i < byte_width; ++i) {
        result = ctx.createOr(
            result,
            ctx.createShl(ctx.createZExt(Type::int_ty(bitwidth), bytes[i]),
                          i * 8));
      }
      return result;
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::bswap() {
  return std::make_unique<BswapIntrinsic>();
}

} // namespace caffeine
