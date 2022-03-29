#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Support/LLVMFmt.h"
#include "vastart.h"
#include <llvm/IR/Module.h>

/**
 * For the AMD64 ABI spec, the va_list type looks like this
 * typedef struct {
 *   unsigned int gp_offset;
 *   unsigned int fp_offset;
 *   void *overflow_arg_area;
 *   void *reg_save_area;
 * } va_list[1];
 *
 * There is a somewhat complicated algorithm for reading from this struct but
 * the summary is that the first few register arguments get placed in the
 * reg_save_area and then the rest of the arguments are put in the
 * overflow_arg_area. There's some things to worry about WRT to alignment but
 * otherwise setting it up isn't _too_ difficult.
 *
 * For the details of how this is supposed to work checkout the System V ABI
 * AMD64 Architecture Processor Supplement document, section 3.5.7.
 */

namespace caffeine::intrin::vastart {

namespace {
  static const size_t NUM_GP_REGS = 6;
  // Note that this doesn't agree with the AMD64 ABI spec but the LLVM codegen
  // seems to be using this instead of the value of 16 specified by the spec so
  // I've chosen to go with this instead.
  static const size_t NUM_FP_REGS = 8;
} // namespace

static bool is_fp_reg(llvm::Type* ty, const llvm::DataLayout& layout) {
  if (ty->isFloatingPointTy()) {
    return ty->isDoubleTy() || ty->isFloatTy();
  } else if (ty->isVectorTy()) {
    return layout.getTypeStoreSize(ty) <= 16;
  } else {
    return false;
  }
}

static bool is_gp_reg(llvm::Type* ty) {
  if (!ty->isIntegerTy())
    return false;

  return ty->getIntegerBitWidth() <= 64;
}

static std::pair<size_t, size_t>
consumed_registers(llvm::Function* func, const llvm::DataLayout& layout) {
  size_t gp = 0;
  size_t fp = 0;

  for (const auto& arg : func->args()) {
    llvm::Type* ty = arg.getType();

    if (is_gp_reg(ty))
      gp += 1;
    else if (is_fp_reg(ty, layout))
      fp += 1;
  }

  return {std::min(gp, NUM_GP_REGS), std::min(fp, NUM_FP_REGS)};
}

static uint64_t round_up(uint64_t x, uint64_t m) {
  uint64_t r = x % m;
  return r == 0 ? x : x + (m - r);
}

IRStackFrame& x86_64VaStart::caller(InterpreterContext& ctx, size_t step) {
  auto& context = ctx.context();
  CAFFEINE_ASSERT(context.stack.size() > step);

  return context.stack.at(context.stack.size() - (1 + step)).get_regular();
}

void x86_64VaStart::step(InterpreterContext& ctx) {
  const auto& c_varargs = caller(ctx).varargs;
  const auto& layout = ctx.getModule()->getDataLayout();

  auto* func = callinst->getCalledFunction();
  auto* call =
      llvm::cast<llvm::CallBase>(caller(ctx, 2).get_current_instruction());
  size_t baseargs = func->arg_size();

  for (; state < c_varargs.size(); state++) {
    auto* type = c_varargs[state].first;
    auto& val = c_varargs[state].second;
    unsigned align = call->getParamAlign(baseargs + state)
                         .getValueOr(layout.getABITypeAlign(type))
                         .value();

    if (auto ty = call->getParamByValType(baseargs + state)) {
      auto resolved =
          ctx.resolve_ptr(val.scalar().pointer(), layout.getTypeStoreSize(ty),
                          "invalid pointer read");

      ctx.fork_external<x86_64VaStart>(
          resolved,
          [&](InterpreterContext& ctx, x86_64VaStart* frame, Pointer& ptr) {
            ctx.add_assertion(ctx.createICmpEQ(ptr, val.scalar().pointer()));
            frame->varargs.push_back({ty, ctx.mem_read(ptr, ty), align});
            frame->state = state + 1;
          });
      return;
    } else {
      varargs.push_back({type, val, align});
    }
  }

  std::vector<LLVMValue> args = std::move(this->args);
  auto varargs = std::move(this->varargs);
  ctx.function_return();

  do_call(callinst->getCaller(), ctx, args, varargs);
}

void x86_64VaStart::do_call(llvm::Function* func, InterpreterContext& ctx,
                            Span<LLVMValue> args, const varargs_t& varargs) {
  const auto& layout = ctx.getModule()->getDataLayout();
  const auto& unresolved = args[0].scalar().pointer();
  llvm::StructType* list_tag = getListTagType(ctx.getModule());

  std::vector<llvm::Type*> tys;
  auto [gpc, fpc] = consumed_registers(func, layout);
  size_t gp = gpc;
  size_t fp = fpc;

  uint64_t bufsize = 0;
  for (const auto& [arg, _, tyalign] : varargs) {
    uint64_t tysize = layout.getTypeStoreSize(arg);

    if (is_gp_reg(arg) && gp < NUM_GP_REGS) {
      gp += 1;
    } else if (is_fp_reg(arg, layout) && fp < NUM_FP_REGS) {
      fp += 1;
    } else {
      bufsize = round_up(bufsize, tyalign <= 8 ? 8 : 16);
      bufsize += tysize;
    }
  }

  unsigned address_space =
      list_tag->getStructElementType(2)->getPointerAddressSpace();
  unsigned ptrwidth = layout.getPointerSizeInBits(address_space);
  auto size = ctx.createConstantInt(ptrwidth, bufsize);
  auto align = ctx.createConstantInt(ptrwidth, 16);
  auto regsz =
      ctx.createConstantInt(ptrwidth, NUM_GP_REGS * 8 + NUM_FP_REGS * 16);

  auto overflow =
      bufsize == 0
          ? Pointer::null(ptrwidth, address_space)
          : ctx.allocate(size, align,
                         ctx.createAlloc(size, ctx.createConstantZero(8)),
                         address_space, AllocationKind::Alloca,
                         AllocationPermissions::ReadWrite);
  auto regs =
      gp == gpc && fp == fpc
          ? Pointer::null(ptrwidth, address_space)
          : ctx.allocate(regsz, align,
                         ctx.createAlloc(regsz, ctx.createConstantZero(8)),
                         address_space, AllocationKind::Alloca,
                         AllocationPermissions::ReadWrite);

  gp = gpc;
  fp = fpc;

  uint64_t offset = 0;
  for (const auto& [arg, val, tyalign] : varargs) {
    uint64_t tysize = layout.getTypeStoreSize(arg);

    if (is_gp_reg(arg) && gp < NUM_GP_REGS) {
      Pointer ptr{regs.alloc(), ctx.createAdd(regs.offset(), gp * 8),
                  regs.heap()};
      ctx.mem_write(ptr, arg, val);
      gp += 1;
    } else if (is_fp_reg(arg, layout) && fp < NUM_FP_REGS) {
      Pointer ptr{regs.alloc(),
                  ctx.createAdd(regs.offset(), NUM_GP_REGS * 8 + fp * 16),
                  regs.heap()};
      ctx.mem_write(ptr, arg, val);
      fp += 1;
    } else {
      offset = round_up(offset, tyalign <= 8 ? 8 : 16);

      Pointer offptr{overflow.alloc(), ctx.createAdd(overflow.offset(), offset),
                     overflow.heap()};
      ctx.mem_write(offptr, arg, val);

      offset += tysize;
    }
  }

  LLVMValue initial = LLVMValue(std::vector<LLVMValue>{
      LLVMValue(ctx.createConstantInt(32, gpc * 8)),
      LLVMValue(ctx.createConstantInt(32, NUM_GP_REGS * 8 + fpc * 16)),
      // Now we have the overflow_arg_area
      LLVMValue(overflow),
      // and the reg_save_area, it's not used so set it to null
      LLVMValue(regs)});

  auto resolved = ctx.resolve_ptr(unresolved, layout.getTypeStoreSize(list_tag),
                                  "invalid pointer write");

  ctx.kill();
  for (auto& ptr : resolved) {
    auto fork = ctx.fork();
    fork.add_assertion(ctx.createICmpEQ(ptr, unresolved));
    fork.mem_write(ptr, list_tag, initial);
  }
}
} // namespace caffeine::intrin::vastart
