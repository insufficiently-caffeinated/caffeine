#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "vastart.h"
#include <fmt/format.h>
#include <fmt/ostream.h>
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
 * the important part is that if gp_offset and fp_offset are large enough then
 * we will just read directly from the overflow_arg_area in which the arguments
 * are placed with some specific alignment guarantees.
 *
 * So, to implement this, we just write out the arguments (as stored in a hidden
 * argument type with its value key being the function itself) out to a
 * newly-created alloca with the right alignment for each element.
 *
 * For the details of how this is supposed to work checkout the System V ABI
 * AMD64 Architecture Processor Supplement document, section 3.5.7.
 */

namespace caffeine::intrin::vastart {

static uint64_t round_up(uint64_t x, uint64_t m) {
  uint64_t r = x % m;
  return r == 0 ? x : x + (m - r);
}

void x86_64VaStart::call(llvm::Function*, InterpreterContext& ctx,
                         Span<LLVMValue> args) const {
  const auto& layout = ctx.getModule()->getDataLayout();
  const auto& unresolved = args[0].scalar().pointer();
  const auto& varargs = ctx.context().stack_top().get_regular().varargs;
  llvm::StructType* list_tag = getListTagType(ctx.getModule());

  uint64_t bufsize = 0;
  for (const auto& [ty, _] : varargs) {
    uint64_t tysize = layout.getTypeStoreSize(ty);
    uint64_t tyalign = layout.getABITypeAlign(ty).value();

    bufsize = round_up(bufsize, tyalign <= 8 ? 8 : 16);
    bufsize += tysize;
  }

  unsigned address_space =
      list_tag->getStructElementType(2)->getPointerAddressSpace();
  unsigned ptrwidth = layout.getPointerSizeInBits(address_space);
  auto size = ctx.createConstantInt(ptrwidth, bufsize);

  auto overflow = ctx.allocate(size, ctx.createConstantInt(ptrwidth, 16),
                               ctx.createAlloc(size, ctx.createConstantZero(8)),
                               address_space, AllocationKind::Alloca,
                               AllocationPermissions::ReadWrite);

  uint64_t offset = 0;
  for (const auto& [ty, arg] : varargs) {
    uint64_t tysize = layout.getTypeStoreSize(ty);
    uint64_t tyalign = layout.getABITypeAlign(ty).value();

    offset = round_up(offset, tyalign <= 8 ? 8 : 16);

    Pointer offptr{overflow.alloc(), ctx.createAdd(overflow.offset(), offset),
                   overflow.heap()};
    ctx.mem_write(offptr, ty, arg);

    offset += tysize;
  }

  LLVMValue initial = LLVMValue(std::vector<LLVMValue>{
      // set gp_offset and fp_offset to 48 and 304 respectively so that the
      // generated va_arg code goes straight to the overflow_arg_area pointer.
      LLVMValue(ctx.createConstantInt(32, 48)),
      LLVMValue(ctx.createConstantInt(32, 304)),
      // Now we have the overflow_arg_area
      LLVMValue(overflow),
      // and the reg_save_area, it's not used so set it to null
      LLVMValue(Pointer(ctx.createConstantZero(ptrwidth), overflow.heap()))});

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
