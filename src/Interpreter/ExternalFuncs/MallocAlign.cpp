#include "caffeine/Interpreter/ExternalFuncs/MallocAlign.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {

void MallocAlignFunction::call(InterpreterContext& ctx,
                               Span<LLVMValue> args) const {
  if (args.size() != 2) {
    ctx.fail("invalid malloc_align signature (invalid number of arguments)");
    return;
  }

  auto inst = ctx.getCurrentInstruction();
  if (!inst->getType()->isPointerTy()) {
    ctx.fail("invalid malloc_align signature (invalid return type)");
    return;
  }

  const llvm::DataLayout& layout = ctx.getModule()->getDataLayout();
  unsigned address_space = inst->getType()->getPointerAddressSpace();
  auto ptr_width = layout.getPointerTypeSizeInBits(inst->getType());

  auto call = llvm::dyn_cast<llvm::CallBase>(inst);
  CAFFEINE_ASSERT(call);

  auto size_ty = call->getArgOperand(0)->getType();
  auto align_ty = call->getArgOperand(1)->getType();

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
        LLVMValue(Pointer(ConstantInt::CreateZero(ptr_width), address_space)));
  }

  auto size = args[0].scalar().expr();
  auto align = args[1].scalar().expr();

  auto size_op = UnaryOp::CreateTruncOrZExt(Type::int_ty(ptr_width), size);
  auto alloc = ctx.context().heaps[address_space].allocate(
      size_op, align,
      AllocOp::Create(size_op, ConstantInt::Create(llvm::APInt(8, 0xDD))),
      AllocationKind::Malloc, AllocationPermissions::ReadWrite, ctx.context());

  ctx.jump_return(LLVMValue(
      Pointer(alloc, ConstantInt::CreateZero(ptr_width), address_space)));
}

} // namespace caffeine
