#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Memory/MemHeap.h"
#include "caffeine/Support/LLVMFmt.h"
#include <caffeine/IR/Operation.h>
#include <fmt/ostream.h>
#include <iostream>
#include <llvm/ADT/APInt.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {
namespace {

  // The maximum size for which a fixed-size symbolic constant will be optimized
  // to a fixed array of smaller constants.
  static uint64_t MAX_FIXED_CONSTANT_SIZE = 10 * 1024 * 1024;

  class CaffeineSymbolicAlloca : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 2) {
        ctx.fail("invalid caffeine_symbolic_alloca signature (invalid number "
                 "of arguments)");
        return;
      }

      const auto& layout = ctx.getModule()->getDataLayout();

      unsigned address_space = func->getReturnType()->getPointerAddressSpace();
      unsigned ptr_width = layout.getPointerSizeInBits(address_space);
      unsigned index_width = layout.getIndexSizeInBits(address_space);

      auto size_ty = func->getArg(0)->getType();
      auto name_ty = func->getArg(1)->getType();

      if (!size_ty->isIntegerTy() ||
          size_ty->getIntegerBitWidth() != index_width) {
        ctx.fail("invalid caffeine_symbolic_alloca signature (invalid first "
                 "argument)");
        return;
      }

      if (!name_ty->isPointerTy() ||
          !name_ty->getPointerElementType()->isIntegerTy() ||
          name_ty->getPointerElementType()->getIntegerBitWidth() != 8) {
        ctx.fail("invalid caffeine_symbolic_alloca signature (invalid second "
                 "argument)");
        return;
      }

      auto unresolved = args[1].scalar().pointer();
      auto resolved =
          ctx.resolve_ptr(unresolved,
                          ConstantInt::Create(llvm::APInt(
                              unresolved.offset()->type().bitwidth(), 1)),
                          "invalid name argument to caffeine_make_symbolic");

      if (resolved.empty()) {
        return ctx.fail(
            "caffeine_make_symbolic called with invalid name pointer");
      }
      if (resolved.size() != 1) {
        return ctx.fail("caffeine_make_symbolic called with symbolic name");
      }

      auto alloc_name = read_symbolic_name(ctx, resolved.front());
      if (!alloc_name.has_value()) {
        return ctx.fail(
            "unable to read name argument of caffeine_make_symbolic");
      }

      OpRef data;
      auto size = args[0].scalar().expr();
      auto csize = llvm::dyn_cast<ConstantInt>(size.get());
      if (csize && csize->value().getLimitedValue() < MAX_FIXED_CONSTANT_SIZE) {
        data = createFixedLengthSymbolicData(csize->value().getLimitedValue(),
                                             size->type(), ctx);
      } else {
        data = ConstantArray::Create(Symbol(*alloc_name), size);
      }

      ctx.context().constants = std::move(ctx.context().constants)
                                    .insert({std::move(*alloc_name), data});
      auto alloc_ptr =
          ctx.allocate(size, ConstantInt::Create(llvm::APInt(ptr_width, 1)),
                       data, address_space, AllocationKind::Alloca,
                       AllocationPermissions::ReadWrite);
      ctx.jump_return(LLVMValue(alloc_ptr));
    }

    std::optional<std::string> read_symbolic_name(InterpreterContext& ctx,
                                                  const Pointer& ptr) const {
      const Allocation* alloc = ctx.ptr_allocation(ptr);
      CAFFEINE_ASSERT(alloc);

      auto result = ctx.resolve();
      if (result != SolverResult::SAT) {
        ctx.kill();
        return std::nullopt;
      }

      uint64_t offset =
          result.evaluate(*ptr.offset()).apint().getLimitedValue();
      uint64_t size = result.evaluate(*alloc->size()).apint().getLimitedValue();
      auto array = std::move(result.evaluate(*alloc->data()).array());

      CAFFEINE_ASSERT(size >= offset,
                      "resolved pointer offset was outside of the allocation");
      std::string name;
      name.reserve(size - offset);

      const char* values = array.data();
      const char* start = values + offset;
      const char* end =
          (const char*)std::memchr(start, 0, array.size() - offset);

      if (!end) {
        ctx.fail("symbolic name was not null-terminated");
        return std::nullopt;
      }

      return std::string(start, end);
    }

    static OpRef createFixedLengthSymbolicData(size_t data_size,
                                               const Type& type,
                                               InterpreterContext& ctx) {

      if (data_size == 1 || data_size == 2 || data_size == 4 ||
          data_size == 8) {
        auto data =
            ctx.createAlloc(ctx.createConstantInt(type.bitwidth(), data_size),
                            ctx.createConstantZero(8));

        auto constant = Constant::Create(Type::int_ty(data_size * 8),
                                         Symbol(ctx.context().next_constant()));

        for (size_t i = 0; i < data_size; ++i) {
          auto byte =
              ctx.createTrunc(Type::int_ty(8), ctx.createLShr(constant, i * 8));
          auto index = ctx.createConstantInt(type.bitwidth(), i);

          data = ctx.createStore(data, index, byte);
        }

        return data;
      } else {
        std::vector<OpRef> constants;
        constants.reserve(data_size);

        for (size_t i = 0; i < data_size; ++i) {
          constants.push_back(Constant::Create(
              Type::int_ty(8), Symbol(ctx.context().next_constant())));
        }
        return FixedArray::Create(type, PersistentArray<OpRef>(constants));
      }
    }
  };

} // namespace

std::unique_ptr<ExternalFunction>
ExternalFunctions::caffeine_builtin_symbolic_alloca() {
  return std::make_unique<CaffeineSymbolicAlloca>();
}

} // namespace caffeine
