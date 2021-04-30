#include "builtins.h"
#include "caffeine/Support/Assert.h"
#include <fmt/format.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/IRBuilder.h>

namespace caffeine {

/**
 * In C-ish pseudocode the version of LLVM's memmove that we're generating here
 * looks somewhat like this (ignoring the isvolatile parameter):
 *
 * void llvm.memmove.p0i8.p0i8.i32(i8* dst_, i8* src_, i32 len, i1 isvolatile) {
 *   i8* dst = caffeine.resolve.p0i8.i32(dst_, len);
 *   i8* src = caffeine.resolve.p0i8.i32(src_, len);
 *
 *   if (dst < src) {
 *     while (len > 0) {
 *       *dst = *src;
 *       dst += 1;
 *       src += 1;
 *       len -= 1;
 *     }
 *   } else {
 *     while (len > 0) {
 *       len -= 1;
 *       dst[len] = src[len];
 *     }
 *   }
 * }
 */

using namespace llvm;

static llvm::BasicBlock*
buildForward(llvm::Module* m, llvm::Function* decl, llvm::BasicBlock* entry,
             llvm::BasicBlock* exit, llvm::Value* res_dst, llvm::Value* res_src,
             llvm::Value* arg_len) {

  auto head = IRBuilder{BasicBlock::Create(m->getContext(), "fwd_head", decl)};
  auto body = IRBuilder{BasicBlock::Create(m->getContext(), "fwd_body", decl)};

  // Now we build the loop header
  auto dst = head.CreatePHI(res_dst->getType(), 2);
  auto src = head.CreatePHI(res_src->getType(), 2);
  auto len = head.CreatePHI(arg_len->getType(), 2);
  auto cond = head.CreateICmpNE(len, ConstantInt::get(arg_len->getType(), 0));
  head.CreateCondBr(cond, body.GetInsertBlock(), exit);

  // Next the loop body
  auto val = body.CreateLoad(src);
  body.CreateStore(val, dst);

  auto next_dst = body.CreateInBoundsGEP(
      dst, ArrayRef<Value*>{ConstantInt::get(arg_len->getType(), 1)});
  auto next_src = body.CreateInBoundsGEP(
      src, ArrayRef<Value*>{ConstantInt::get(arg_len->getType(), 1)});
  auto next_len = body.CreateSub(len, ConstantInt::get(arg_len->getType(), 1));
  body.CreateBr(head.GetInsertBlock());

  // Now fix up the PHI nodes
  dst->addIncoming(res_dst, entry);
  src->addIncoming(res_src, entry);
  len->addIncoming(arg_len, entry);
  dst->addIncoming(next_dst, body.GetInsertBlock());
  src->addIncoming(next_src, body.GetInsertBlock());
  len->addIncoming(next_len, body.GetInsertBlock());

  return head.GetInsertBlock();
}

static llvm::BasicBlock*
buildBackwards(llvm::Module* m, llvm::Function* decl, llvm::BasicBlock* entry,
               llvm::BasicBlock* exit, llvm::Value* res_dst,
               llvm::Value* res_src, llvm::Value* arg_len) {

  auto head = IRBuilder{BasicBlock::Create(m->getContext(), "bwd_head", decl)};
  auto body = IRBuilder{BasicBlock::Create(m->getContext(), "bwd_body", decl)};

  // Now we build the loop header
  auto len = head.CreatePHI(arg_len->getType(), 2);
  auto cond = head.CreateICmpNE(len, ConstantInt::get(arg_len->getType(), 0));
  head.CreateCondBr(cond, body.GetInsertBlock(), exit);

  // And now the loop body
  auto next_len = body.CreateSub(len, ConstantInt::get(arg_len->getType(), 1));
  auto dst = body.CreateInBoundsGEP(res_dst, ArrayRef<Value*>{next_len});
  auto src = body.CreateInBoundsGEP(res_src, ArrayRef<Value*>{next_len});
  auto val = body.CreateLoad(src);
  body.CreateStore(val, dst);
  body.CreateBr(head.GetInsertBlock());

  // Now fix up the PHI nodes
  len->addIncoming(arg_len, entry);
  len->addIncoming(next_len, body.GetInsertBlock());

  return head.GetInsertBlock();
}

llvm::Function* generateMemmove(llvm::Module* m, llvm::Function* decl) {
  using namespace llvm;

  CAFFEINE_ASSERT(decl->arg_size() == 4);
  CAFFEINE_ASSERT(decl->getBasicBlockList().empty());
  CAFFEINE_ASSERT(decl->getArg(0)->getType()->getPointerElementType() ==
                  decl->getArg(1)->getType()->getPointerElementType());

  // If the arguments are in different address spaces then memmove is equivalent
  // to a memcpy.
  if (decl->getArg(0)->getType()->getPointerAddressSpace() !=
      decl->getArg(1)->getType()->getPointerAddressSpace()) {
    return generateMemcpy(m, decl);
  }

  const DataLayout& layout = m->getDataLayout();

  auto arg_dst = decl->getArg(0);
  auto arg_src = decl->getArg(1);
  auto arg_len = decl->getArg(2);

  std::string func_name = fmt::format(
      "caffeine.memmove.p{}i{}.p{}i{}.i{}",
      arg_dst->getType()->getPointerAddressSpace(),
      arg_dst->getType()->getPointerElementType()->getIntegerBitWidth(),
      arg_src->getType()->getPointerAddressSpace(),
      arg_src->getType()->getPointerElementType()->getIntegerBitWidth(),
      arg_len->getType()->getIntegerBitWidth());
  if (llvm::Function* func = m->getFunction(func_name)) {
    decl->replaceAllUsesWith(func);
    return func;
  }

  auto iptr = llvm::Type::getIntNTy(
      m->getContext(), layout.getPointerTypeSizeInBits(arg_dst->getType()));

  auto entry = IRBuilder{BasicBlock::Create(m->getContext(), "entry", decl)};
  auto exit = IRBuilder{BasicBlock::Create(m->getContext(), "exit", decl)};

  // Entry block
  auto resolve_dst = generateResolve(m, arg_dst->getType(), arg_len->getType());
  auto resolve_src = generateResolve(m, arg_src->getType(), arg_len->getType());
  auto res_src =
      entry.CreateCall(resolve_dst, ArrayRef<Value*>{arg_src, arg_len});
  auto res_dst =
      entry.CreateCall(resolve_src, ArrayRef<Value*>{arg_dst, arg_len});

  auto int_src = entry.CreatePtrToInt(res_src, iptr);
  auto int_dst = entry.CreatePtrToInt(res_dst, iptr);
  auto cond = entry.CreateICmpULT(int_src, int_dst);

  auto fwd = buildForward(m, decl, entry.GetInsertBlock(),
                          exit.GetInsertBlock(), res_dst, res_src, arg_len);
  auto bwd = buildBackwards(m, decl, entry.GetInsertBlock(),
                            exit.GetInsertBlock(), res_dst, res_src, arg_len);

  entry.CreateCondBr(cond, bwd, fwd);

  // And lastly, the exit block
  exit.CreateRetVoid();

  // And now add attributes to the function
  llvm::AttrBuilder builder;
  // Prevent any future optimizations from touching the internals of this
  // function. Otherwise it's likely to get optimized to a memset call
  builder.addAttribute(Attribute::OptimizeNone);
  builder.addAttribute(Attribute::NoInline);

  // Other attributes that seem to apply.
  builder.addAttribute(Attribute::NoRecurse);
  builder.addAttribute(Attribute::NoBuiltin);
  builder.addAttribute(Attribute::NoRecurse);
  builder.addAttribute(Attribute::NoUnwind);
  builder.addAttribute(Attribute::ArgMemOnly);
  builder.addAttribute(Attribute::NoFree);

  decl->setAttributes(llvm::AttributeList::get(
      m->getContext(), llvm::AttributeList::FunctionIndex, builder));
  decl->setName(func_name);

  // These are what clang sets on the dst argument to memcpy. Copying them
  // here since they're probably useful.
  decl->addAttribute(1, Attribute::WriteOnly);
  decl->addAttribute(1, Attribute::NoCapture);

  // These are what clang sets on the src argument to memcpy. Copying them
  // here since they're probably useful.
  decl->addAttribute(2, Attribute::ReadOnly);
  decl->addAttribute(2, Attribute::NoCapture);

  // Ensure that if we try to link multiple modules with a builtin definition
  // then the linker just picks one of them.
  decl->setLinkage(llvm::Function::LinkOnceAnyLinkage);

  return decl;
}

} // namespace caffeine
