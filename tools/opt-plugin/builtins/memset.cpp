
#include "builtins.h"
#include "caffeine/Support/Assert.h"
#include <fmt/format.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/IRBuilder.h>

namespace caffeine {

/**
 * In C-ish pseudocode, the most basic equivalent to LLVM's memset looks
 * somewhat like this (including the isvolatile parameter but leaving it
 * unused):
 *
 * void llvm.memset.p0i8.i32(i8* dst, i8 val, i32 len, i1 isvolatile) {
 *   while (len > 0) {
 *     *dst = val;
 *     dst += 1;
 *     len -= 1;
 *   }
 * }
 *
 * However, this version requires that the solver perform an expensive check on
 * every single store as the index is increasing. To avoid this, I'll take
 * advantage of a caffeine builtin function. Here's version 2:
 *
 * void llvm.memset.p0i8.i32(i8* dst_, i8 val, i32 len, i1 _) {
 *   i8* dst = caffeine.resolve.p0i8.i32(dst_, len);
 *
 *   while (len > 0) {
 *     *dst = val;
 *     dst += 1;
 *     len -= 1;
 *   }
 * }
 *
 * The main new thing here is the caffeine.resolve.* calls. These effectively
 * tell the interpreter "we're going to access this range of memory" so that we
 * can get any bad accesses out of the way right away instead of having to do a
 * more expensive check on every iteration. With decent constant evaluation, it
 * should be possible to make all the following accesses without ever hitting
 * the underlying solver.
 *
 * Now, we can't use this C code directly. For one, it needs to be templated out
 * for a variety of different types. Secondly, the compiler has a tendency to
 * optimize this down to a llvm.memset call. This obviously doesn't help us
 * here. For that reason, we need to turn it into LLVM IR ourselves. So here we
 * go (roughly):
 *
 * define void @caffeine.memset.p0i8.i32(
 *     i8* %arg_dst, i8 %val, i32 %arg_len, i1* %isvolatile) {
 * entry:
 *   %resolved = call void @caffeine.resolve.p0i8.i32(i8* %arg_dst, i32
 * %arg_len) br label %head
 *
 * head:
 *   %dst = phi i8* [ %entry, %resolved ], [ %body, %next_dst ]
 *   %len = phi i32 [ %entry, %arg_len  ], [ %body, %next_len ]
 *   %cond = icmp ne i32 %len, 0
 *   br i1 %cond, label %exit, label %body
 *
 * body:
 *   store i8 %val, i8* %dst, align 1
 *   %next_dst = getelementptr i8, i8* %dst, i32 1
 *   %next_len = sub i32 %len, 1
 *   br label %head
 *
 * exit:
 *  ret void
 * }
 */

llvm::Function* generateMemset(llvm::Module* m, llvm::Function* decl) {
  using llvm::ArrayRef;
  using llvm::Attribute;
  using llvm::ConstantInt;

  CAFFEINE_ASSERT(decl->arg_size() == 4);
  CAFFEINE_ASSERT(decl->getBasicBlockList().empty());
  CAFFEINE_ASSERT(decl->getArg(0)->getType()->getPointerElementType() ==
                  decl->getArg(1)->getType());

  auto arg_dst = decl->getArg(0);
  auto arg_val = decl->getArg(1);
  auto arg_len = decl->getArg(2);

  std::string func_name =
      fmt::format("caffeine.memset.p{}i{}.i{}",
                  arg_dst->getType()->getPointerAddressSpace(),
                  arg_val->getType()->getIntegerBitWidth(),
                  arg_len->getType()->getIntegerBitWidth());
  if (llvm::Function* func = m->getFunction(func_name)) {
    decl->replaceAllUsesWith(func);
    return func;
  }

  auto entry_ = llvm::BasicBlock::Create(m->getContext(), "entry", decl);
  auto head_ = llvm::BasicBlock::Create(m->getContext(), "head", decl);
  auto body_ = llvm::BasicBlock::Create(m->getContext(), "body", decl);
  auto exit_ = llvm::BasicBlock::Create(m->getContext(), "exit", decl);

  auto entry = llvm::IRBuilder{entry_};
  auto head = llvm::IRBuilder{head_};
  auto body = llvm::IRBuilder{body_};
  auto exit = llvm::IRBuilder{exit_};

  // First build entry block
  auto resolve = generateResolve(m, arg_dst->getType(), arg_len->getType());
  auto resolved =
      entry.CreateCall(resolve, ArrayRef<llvm::Value*>{arg_dst, arg_len});
  entry.CreateBr(head_);

  // Now build the loop header. We'll fix up the PHIs at the end
  auto dst = head.CreatePHI(arg_dst->getType(), 2);
  auto len = head.CreatePHI(arg_len->getType(), 2);
  auto cond = head.CreateICmpNE(len, ConstantInt::get(arg_len->getType(), 0));
  head.CreateCondBr(cond, body_, exit_);

  // And now the loop body
  body.CreateStore(arg_val, dst);
  auto next_dst = body.CreateInBoundsGEP(
      dst, ArrayRef<llvm::Value*>{
               ConstantInt::get(llvm::Type::getInt32Ty(m->getContext()), 1)});
  auto next_len = body.CreateSub(len, ConstantInt::get(len->getType(), 1));
  body.CreateBr(head_);

  // And finally the exit block
  exit.CreateRetVoid();

  // Lastly, we fix up the PHI nodes within the loop header
  dst->addIncoming(resolved, entry_);
  dst->addIncoming(next_dst, body_);
  len->addIncoming(arg_len, entry_);
  len->addIncoming(next_len, body_);

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

  // These are what clang sets on the dst argument to memset. Copying them
  // here since they're probably useful.
  decl->addAttribute(1, Attribute::WriteOnly);
  decl->addAttribute(1, Attribute::NoCapture);

  // Ensure that if we try to link multiple modules with a builtin definition
  // then the linker just picks one of them.
  decl->setLinkage(llvm::Function::LinkOnceAnyLinkage);

  return decl;
}

} // namespace caffeine
