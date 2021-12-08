#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {
namespace {

  class CallocFunction : public ExternalFunction {
  public:
    void call(InterpreterContext& ctx, Span<LLVMValue> args) const {
      if (args.size() != 1) {
        ctx.fail(
            "invalid caffeine_calloc signature (invalid number of arguments)");
        return;
      }

      auto inst = ctx.getCurrentInstruction();
      CAFFEINE_ASSERT(inst, "cannot call calloc without a current instruction");

      auto call = llvm::dyn_cast<llvm::CallBase>(inst);
      CAFFEINE_ASSERT(
          call, "caffeine_calloc called from a non-call/invoke instruction?");

      if (!call->getType()->isPointerTy()) {
        ctx.fail("invalid caffeine_calloc signature (invalid return type)");
        return;
      }

      const llvm::DataLayout& layout = ctx.getModule()->getDataLayout();
      unsigned address_space = call->getType()->getPointerAddressSpace();
      unsigned ptr_width = layout.getPointerTypeSizeInBits(call->getType());

      auto size_ty = call->getArgOperand(0)->getType();
      if (!size_ty->isIntegerTy() ||
          size_ty->getIntegerBitWidth() !=
              layout.getIndexSizeInBits(address_space)) {
        ctx.fail("invalid caffeine_calloc signature (invalid first argument)");
        return;
      }

      if (ctx.caffeine().options().malloc_can_return_null) {
        auto fork = ctx.fork();
        fork.jump_return(LLVMValue(
            Pointer(ConstantInt::CreateZero(ptr_width), address_space)));
      }

      auto size = UnaryOp::CreateTruncOrZExt(Type::int_ty(ptr_width),
                                             args[0].scalar().expr());
      auto align = ConstantInt::Create(
          llvm::APInt(ptr_width, ctx.caffeine().options().malloc_alignment));
      auto alloc = ctx.allocate_repeated(
          size, align, ConstantInt::Create(llvm::APInt(8, 0x00)), address_space,
          AllocationKind::Malloc, AllocationPermissions::ReadWrite);

      ctx.jump_return(LLVMValue(alloc));
    }
  };

} // namespace

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_calloc() {
  return std::make_unique<CallocFunction>();
}

} // namespace caffeine
