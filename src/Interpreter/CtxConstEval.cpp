#include "caffeine/Interpreter/Context.h"

#include "caffeine/Support/Assert.h"

#include <llvm/IR/Constant.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

namespace caffeine {

static ContextValue evaluate(Context* ctx, llvm::Constant* constant);
static ref<Operation> evaluate_global_data(Context* ctx,
                                           llvm::Constant* constant);

static ContextValue evaluate_undef(Context* ctx, llvm::UndefValue* undef) {
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

static ContextValue evaluate_const_vector(Context* ctx,
                                          llvm::ConstantVector* vec) {
  auto type = vec->getType();

  CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                  "scalable vectors are not supported");

  size_t count = type->getVectorNumElements();
  std::vector<ContextValue> result;
  result.reserve(count);

  for (size_t i = 0; i < count; ++i)
    result.push_back(evaluate(ctx, vec->getOperand(i)));

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
  const auto& array = llvm::cast<ConstantArray>(*data);

  const llvm::DataLayout& layout = ctx->module_->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();
  unsigned alignment = global->getAlignment();

  auto alloc = ctx->heap_.allocate(
      ConstantInt::Create(llvm::APInt(bitwidth, array.data().size())),
      ConstantInt::Create(llvm::APInt(bitwidth, alignment)), data, *ctx);

  auto pointer = ContextValue(
      Pointer(alloc, ConstantInt::Create(llvm::APInt(bitwidth, 0))));

  ctx->globals_.emplace(global, pointer);

  return pointer;
}

/**
 * Evaluate the initializer of a global variable to a byte array.
 */
static ref<Operation> evaluate_global_data(Context* ctx,
                                           llvm::Constant* constant) {
  if (auto* data = llvm::dyn_cast<llvm::ConstantDataSequential>(constant)) {
    auto raw = data->getRawDataValues();
    auto idxty = Type::int_ty(
        ctx->llvm_module()->getDataLayout().getPointerSizeInBits());

    return ConstantArray::Create(idxty, SharedArray(raw.data(), raw.size()));
  }

  std::string s = "Unsupported global value initializer: ";
  llvm::raw_string_ostream os(s);
  constant->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(s);
}

static ContextValue evaluate(Context* ctx, llvm::Constant* constant) {

  if (auto* cnst = llvm::dyn_cast<llvm::ConstantInt>(constant))
    return ContextValue(ConstantInt::Create(cnst->getValue()));

  if (auto* cnst = llvm::dyn_cast<llvm::ConstantFP>(constant))
    return ContextValue(ConstantFloat::Create(cnst->getValueAPF()));

  if (auto* vec = llvm::dyn_cast<llvm::ConstantVector>(constant))
    return evaluate_const_vector(ctx, vec);

  if (auto* undef = llvm::dyn_cast<llvm::UndefValue>(constant))
    return evaluate_undef(ctx, undef);

  if (auto* global = llvm::dyn_cast<llvm::GlobalVariable>(constant))
    return evaluate_global(ctx, global);

  if (auto* vec = llvm::dyn_cast<llvm::ConstantDataVector>(constant)) {
    CAFFEINE_ASSERT(!vec->getType()->getVectorIsScalable(),
                    "scalable vectors are not supported");

    auto type = vec->getType();
    auto count = type->getVectorNumElements();

    std::vector<ContextValue> result;
    result.reserve(count);

    // TODO: This is inefficient, should be directly converting for known
    //       element types.
    for (size_t i = 0; i < count; ++i)
      result.push_back(evaluate(ctx, vec->getElementAsConstant(i)));

    return ContextValue(std::move(result));
  }

  if (auto* zero = llvm::dyn_cast<llvm::ConstantAggregateZero>(constant)) {
    auto type = zero->getType();

    if (type->isVectorTy()) {
      CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                      "scalable vectors are not supported");

      size_t count = type->getVectorNumElements();
      std::vector<ContextValue> result;
      result.reserve(count);

      for (size_t i = 0; i < count; ++i)
        result.push_back(evaluate(ctx, zero->getElementValue(i)));

      return ContextValue(std::move(result));
    }
  }

  std::string s = "Unsupported constant operand: ";
  llvm::raw_string_ostream os(s);
  constant->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(s);
}

ContextValue Context::evaluate_constant(llvm::Constant* constant) {
  return evaluate(this, constant);
}

} // namespace caffeine
