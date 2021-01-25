#include "caffeine/Interpreter/CtxConstEval.h"
#include "caffeine/Interpreter/Context.h"

#include "caffeine/IR/Operation.h"
#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constant.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/GetElementPtrTypeIterator.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

using llvm::Instruction;

namespace caffeine {

static ref<Operation> evaluate_global_data(const Context* ctx,
                                           llvm::Constant* constant);

static ContextValue evaluate_undef(const Context* ctx,
                                   llvm::UndefValue* undef) {
  auto type = undef->getType();

  if (type->isVectorTy()) {
    CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                    "scalable vectors are not supported");
    size_t count = type->getVectorNumElements();

    std::vector<ContextValue> result;
    result.reserve(count);

    auto inner = llvm::UndefValue::get(type->getVectorElementType());

    for (size_t i = 0; i < count; ++i)
      result.push_back(evaluate_undef(ctx, inner));

    return ContextValue(std::move(result));
  } else {
    return ContextValue(Undef::Create(Type::from_llvm(type)));
  }
}

static ContextValue evaluate_const_vector(const Context* ctx,
                                          llvm::ConstantVector* vec) {
  auto type = vec->getType();

  CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                  "scalable vectors are not supported");

  size_t count = type->getVectorNumElements();
  std::vector<ContextValue> result;
  result.reserve(count);

  for (size_t i = 0; i < count; ++i) {
    if (auto optional = evaluate<const Context*>(ctx, vec->getOperand(i))) {
      result.push_back(*optional);
    }
  }

  return ContextValue(std::move(result));
}

// Note: This method should always return a pointer. (At least I think that's
//       how LLVM globals work)
// Note: Needs to be non-static so that the friend declaration within Context
//       applies.
ContextValue evaluate_global(Context* ctx, llvm::GlobalVariable* global) {
  auto it = ctx->globals_.find(global);
  if (it != ctx->globals_.end())
    return it->second;

  CAFFEINE_ASSERT(global->hasInitializer(),
                  "tried to evaluate global with no initializer");

  auto data = evaluate_global_data(ctx, global->getInitializer());
  const auto& array = llvm::cast<ArrayBase>(*data);

  const llvm::DataLayout& layout = ctx->module_->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();
  unsigned alignment = global->getAlignment();

  auto alloc = ctx->heap_.allocate(
      array.size(), ConstantInt::Create(llvm::APInt(bitwidth, alignment)), data,
      AllocationKind::Global, *ctx);

  auto pointer = ContextValue(
      Pointer(alloc, ConstantInt::Create(llvm::APInt(bitwidth, 0))));

  ctx->globals_.emplace(global, pointer);

  return pointer;
}

std::optional<ContextValue> evaluate_global(const Context* ctx,
                                            llvm::GlobalVariable* global) {
  auto it = ctx->globals_.find(global);
  if (it != ctx->globals_.end())
    return it->second;

  return std::nullopt;
}

/**
 * Evaluate the initializer of a global variable to a byte array.
 */
static ref<Operation> evaluate_global_data(const Context* ctx,
                                           llvm::Constant* constant) {
  const llvm::DataLayout& layout = ctx->llvm_module()->getDataLayout();

  if (auto* data = llvm::dyn_cast<llvm::ConstantDataSequential>(constant)) {
    auto raw = data->getRawDataValues();
    auto idxty = Type::int_ty(layout.getPointerSizeInBits());

    return ConstantArray::Create(idxty, SharedArray(raw.data(), raw.size()));
  }

  auto eval = evaluate(ctx, constant);

  // TODO: Support vectors.
  if (eval.is_scalar() || eval.is_pointer()) {
    auto zero =
        ConstantInt::Create(llvm::APInt(layout.getPointerSizeInBits(), 0));
    auto size = ConstantInt::Create(
        llvm::APInt(layout.getPointerSizeInBits(),
                    layout.getTypeStoreSize(constant->getType())));
    auto data = AllocOp::Create(size, ConstantInt::Create(llvm::APInt(8, 0)));

    Allocation alloc{zero, size, data, AllocationKind::Global};

    if (eval.is_scalar()) {
      alloc.write(zero, eval.scalar(), layout);
    } else {
      alloc.write(zero, eval.pointer().value(ctx->heap()), layout);
    }

    return alloc.data();
  }

  std::string s = "Unsupported global value initializer: ";
  llvm::raw_string_ostream os(s);
  constant->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(s);
}

std::optional<ContextValue>
Context::evaluate_constant(llvm::Constant* constant) const {
  return evaluate<const Context*>(this, constant);
}

ContextValue Context::evaluate_constant(llvm::Constant* constant) {
  auto tmp = evaluate<Context*>(this, constant);
  CAFFEINE_ASSERT(
      tmp, "non const evaluate method should never return an empty optional");
  return *tmp;
}

} // namespace caffeine
