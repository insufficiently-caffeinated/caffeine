
#include "builtins.h"
#include "caffeine/Support/Assert.h"
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <iostream>
#include <llvm/IR/Constants.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Support/raw_ostream.h>

namespace caffeine {

/**
 * In C-ish pseudocode, the most basic equivalent to LLVM's memcpy looks
 * somewhat like this (including the volatile parameter but leaving it unused):
 *
 * void llvm.memcpy.p0i8.p0i8.i32(i8* dst, i8* src, i32 len, ii isvolatile) {
 *   while (len > 0) {
 *     *dst = *src;
 *     dst += 1;
 *     src += 1;
 *     len -= 1;
 *   }
 * }
 *
 * However, that version is rather inefficient since it effectively ends up
 * requring a solver call on each load and store. To avoid this I'll end up
 * using a few builtin functions that I'll define after this implementation.
 *
 * So here's version 2:
 *
 * void llvm.memcpy.p0i8.p0i8.i32(i8* dst_, i8* src_, i32 len, i1 _) {
 *   caffeine.assert(dst_ + len <= src_ || src_ + len <= dst_);
 *
 *   i8* dst = caffeine.resolve.p0i8.i32(dst_, len);
 *   i8* src = caffeine.resolve.p0i8.i32(src_, len);
 *
 *   while (len > 0) {
 *     *dst = *src;
 *     dst += 1;
 *     src += 1;
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
 * The last extra thing is the assert call. This verifies that the input memory
 * ranges do not overlap as required by memset's specification.
 *
 * Now, we can't use this C code in place of LLVM IR. We could compile it, but
 * we actually need to generate a whole bunch of different implementations. So
 * instead we'll effectively stamp out the relevant function here for each (data
 * type, address space, size bitwidth) tuple that we find in an input source
 * file. For that reason, we need to turn it into LLVM IR ourselves. So here
 * goes (note that iptr is pseudocode for a pointer-sized int type):
 *
 * define void @caffeine.memcpy.p0i8.p0i8.i32(
 *     i8* %arg_dst, i8* %arg_src, i32 %arg_len, i1 %isvolatile) {
 * entry:
 *   %res_dst = call void @caffeine.resolve.p0i8.i32(i8* %arg_dst, i32 %arg_len)
 *   %res_src = call void @caffeine.resolve.p0i8.i32(i8* %arg_src, i32 %arg_len)
 *
 *   %off_dst = getelementptr i8, i8* %res_dst, i32 %arg_len
 *   %off_src = getelementptr i8, i8* %res_src, i32 %arg_len
 *
 *   %dst_int_lo = ptrtoint i8* %res_dst to iptr
 *   %dst_int_hi = ptrtoint i8* %off_dst to iptr
 *   %src_int_lo = ptrtoint i8* %res_src to iptr
 *   %src_int_hi = ptrtoint i8* %off_src to iptr
 *   %cmp1 = icmp ule i32 %dst_int_hi, %src_int_lo
 *   %cmp2 = icmp ule i32 %src_int_hi, %dst_int_lo
 *   %cmp_sum = or i1 %cmp1, %cmp2
 *   call void @caffeine_assert(i1 %cmp_sum)
 *
 *   br label %head
 *
 * head:
 *   %dst = phi i8* [ %entry, %res_dst ],
 *   %src = phi i8* [ %entry, %res_src ],
 *   %len = phi i8* [ %entry, %arg_len ],
 *   %cond = icmp ne i32 %len, 0
 *   br i1 %cond, label %exit, label %body
 *
 * body:
 *   %val = load i8, i8* %src, align 1
 *   store i8 %val, i8* %dst, align 1
 *
 *   %next_dst = getelementptr i8, i8* %dst, i32 1
 *   %next_src = getelemetnptr i8, i8* %src, i32 1
 *   %next_len = sub i32 %len, 1
 *   br label %head
 *
 * exit:
 *   ret void
 * }
 */

llvm::Function* generateMemcpy(llvm::Module* m, llvm::Function* decl) {
  using namespace llvm;

  CAFFEINE_ASSERT(decl->arg_size() == 4);
  CAFFEINE_ASSERT(decl->getBasicBlockList().empty());
  CAFFEINE_ASSERT(decl->getArg(0)->getType()->getPointerElementType() ==
                  decl->getArg(1)->getType()->getPointerElementType());

  const DataLayout& layout = m->getDataLayout();

  auto arg_dst = decl->getArg(0);
  auto arg_src = decl->getArg(1);
  auto arg_len = decl->getArg(2);

  std::string func_name = fmt::format(
      "caffeine.memcpy.p{}i{}.p{}i{}.i{}",
      arg_dst->getType()->getPointerAddressSpace(),
      arg_dst->getType()->getPointerElementType()->getIntegerBitWidth(),
      arg_src->getType()->getPointerAddressSpace(),
      arg_src->getType()->getPointerElementType()->getIntegerBitWidth(),
      arg_len->getType()->getIntegerBitWidth());
  if (llvm::Function* func = m->getFunction(func_name)) {
    decl->replaceAllUsesWith(func);
    return func;
  }

  auto entry_ = BasicBlock::Create(m->getContext(), "entry", decl);
  auto head_ = BasicBlock::Create(m->getContext(), "head", decl);
  auto body_ = BasicBlock::Create(m->getContext(), "body", decl);
  auto exit_ = BasicBlock::Create(m->getContext(), "exit", decl);

  auto entry = IRBuilder{entry_};
  auto head = IRBuilder{head_};
  auto body = IRBuilder{body_};
  auto exit = IRBuilder{exit_};

  // Entry block
  auto resolve_dst = generateResolve(m, arg_dst->getType(), arg_len->getType());
  auto resolve_src = generateResolve(m, arg_src->getType(), arg_len->getType());
  auto res_src =
      entry.CreateCall(resolve_dst, ArrayRef<Value*>{arg_src, arg_len});
  auto res_dst =
      entry.CreateCall(resolve_src, ArrayRef<Value*>{arg_dst, arg_len});

  // We only need to generate this comparison if the pointers are in the same
  // address space. Otherwise they're guaranteed not to overlap.
  if (arg_dst->getType()->getPointerAddressSpace() ==
          arg_src->getType()->getPointerAddressSpace() &&
      false) {
    auto iptr = layout.getIntPtrType(arg_dst->getType());
    auto off_dst = entry.CreateGEP(res_dst, ArrayRef<Value*>{arg_len});
    auto off_src = entry.CreateGEP(res_src, ArrayRef<Value*>{arg_len});

    auto dst_int_lo = entry.CreatePtrToInt(res_dst, iptr);
    auto dst_int_hi = entry.CreatePtrToInt(off_dst, iptr);
    auto src_int_lo = entry.CreatePtrToInt(res_src, iptr);
    auto src_int_hi = entry.CreatePtrToInt(off_src, iptr);

    auto cmp1 = entry.CreateICmpULE(dst_int_hi, src_int_lo);
    auto cmp2 = entry.CreateICmpULE(src_int_hi, dst_int_lo);
    auto cond = entry.CreateOr(cmp1, cmp2);
    auto caffeine_assert = generateAssert(m);
    entry.CreateCall(caffeine_assert, ArrayRef<Value*>{cond});
  }

  entry.CreateBr(head_);

  // Now we build the loop header
  auto dst = head.CreatePHI(arg_dst->getType(), 2);
  auto src = head.CreatePHI(arg_src->getType(), 2);
  auto len = head.CreatePHI(arg_len->getType(), 2);
  auto cond = head.CreateICmpNE(len, ConstantInt::get(arg_len->getType(), 0));
  head.CreateCondBr(cond, body_, exit_);

  // Next the loop body
  auto val = body.CreateLoad(src);
  body.CreateStore(val, dst);

  auto next_dst = body.CreateInBoundsGEP(
      dst, ArrayRef<Value*>{ConstantInt::get(arg_len->getType(), 1)});
  auto next_src = body.CreateInBoundsGEP(
      src, ArrayRef<Value*>{ConstantInt::get(arg_len->getType(), 1)});
  auto next_len = body.CreateSub(len, ConstantInt::get(arg_len->getType(), 1));
  body.CreateBr(head_);

  // And lastly, the exit block
  exit.CreateRetVoid();

  // Now fix up the PHI nodes
  dst->addIncoming(res_dst, entry_);
  dst->addIncoming(next_dst, body_);
  src->addIncoming(res_src, entry_);
  src->addIncoming(next_src, body_);
  len->addIncoming(arg_len, entry_);
  len->addIncoming(next_len, body_);

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
