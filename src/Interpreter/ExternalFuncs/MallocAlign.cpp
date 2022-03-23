#include "caffeine/Interpreter/ExternalFuncs/MallocAlign.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {

void MallocAlignFunction::call(llvm::Function* func, InterpreterContext& ctx,
                               Span<LLVMValue> args) const {
  if (args.size() != 2) {
    ctx.fail("invalid malloc_align signature (invalid number of arguments)");
    return;
  }

  llvm::Type* ret_ty = func->getReturnType();

  if (!ret_ty->isPointerTy()) {
    ctx.fail("invalid malloc_align signature (invalid return type)");
    return;
  }

  const llvm::DataLayout& layout = ctx.getModule()->getDataLayout();
  unsigned address_space = ret_ty->getPointerAddressSpace();
  auto ptr_width = layout.getPointerTypeSizeInBits(ret_ty);

  auto size_ty = func->getArg(0)->getType();
  auto align_ty = func->getArg(1)->getType();

  if (!size_ty->isIntegerTy() || size_ty->getIntegerBitWidth() !=
                                     layout.getIndexSizeInBits(address_space)) {
    ctx.fail("invalid malloc_align signature (invalid first argument)");
    return;
  }

  if (!align_ty->isIntegerTy() ||
      align_ty->getIntegerBitWidth() !=
          layout.getIndexSizeInBits(address_space)) {
    ctx.fail("invalid malloc_align signature (invalid second argument)");
    return;
  }

  if (ctx.caffeine().options().malloc_can_return_null) {
    auto fork = ctx.fork();
    fork.jump_return(
        LLVMValue(Pointer(ctx.createConstantZero(ptr_width), address_space)));
  }

  auto size = args[0].scalar().expr();
  auto align = args[1].scalar().expr();

  auto size_op = ctx.createTruncOrZExt(Type::int_ty(ptr_width), size);
  auto ptr = ctx.allocate(
      size_op, align,
      ctx.createAlloc(size_op, ctx.createConstantInt(llvm::APInt(8, 0xDD))),
      address_space, AllocationKind::Malloc, AllocationPermissions::ReadWrite);

  ctx.jump_return(LLVMValue(ptr));
}

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_malloc_aligned() {
  return std::make_unique<MallocAlignFunction>();
}

} // namespace caffeine
