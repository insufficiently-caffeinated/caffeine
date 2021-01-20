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

static ContextValue evaluate_expr(Context* ctx, llvm::ConstantExpr* expr) {
#define OPERAND(expr, num)                                                     \
  evaluate(ctx, llvm::cast<llvm::Constant>((expr)->getOperand(num)))
#define UNARY_OP(expr_) transform((expr_), OPERAND(expr, 0))
#define BINARY_OP(expr_) transform((expr_), OPERAND(expr, 0), OPERAND(expr, 1))
#define CAST_OP(expr_)                                                         \
  transform(                                                                   \
      [=, type = Type::from_llvm(expr->getType())](                            \
          const ref<Operation>& value) -> ref<Operation> { return (expr_); },  \
      OPERAND(expr, 0))

#define UNARY_NAN_PROPAGATE(expr_, num)                                        \
  if ((expr_)->getOperand(num)->isNaN())                                       \
    return OPERAND(expr_, num);

#define BINARY_NAN_PROPAGATE(expr_)                                            \
  UNARY_NAN_PROPAGATE(expr_, 0)                                                \
  UNARY_NAN_PROPAGATE(expr_, 1)

  switch (expr->getOpcode()) {
  // clang-format off
  // Unary Operations
  case Instruction::FNeg: return UNARY_OP(UnaryOp::CreateFNeg);

  // Binary Operations
  case Instruction::Add:  return BINARY_OP(BinaryOp::CreateAdd);
  case Instruction::Sub:  return BINARY_OP(BinaryOp::CreateSub);
  case Instruction::Mul:  return BINARY_OP(BinaryOp::CreateMul);
  case Instruction::UDiv: return BINARY_OP(BinaryOp::CreateUDiv);
  case Instruction::SDiv: return BINARY_OP(BinaryOp::CreateSDiv);
  case Instruction::URem: return BINARY_OP(BinaryOp::CreateURem);
  case Instruction::SRem: return BINARY_OP(BinaryOp::CreateSRem);

  case Instruction::And:  return BINARY_OP(BinaryOp::CreateAnd);
  case Instruction::Or:   return BINARY_OP(BinaryOp::CreateOr);
  case Instruction::Xor:  return BINARY_OP(BinaryOp::CreateXor);
  case Instruction::Shl:  return BINARY_OP(BinaryOp::CreateShl);
  case Instruction::LShr: return BINARY_OP(BinaryOp::CreateLShr);
  case Instruction::AShr: return BINARY_OP(BinaryOp::CreateAShr);

  case Instruction::FAdd: {
    BINARY_NAN_PROPAGATE(expr)

    auto lhs = llvm::cast<llvm::ConstantFP>(expr->getOperand(0));
    auto rhs = llvm::cast<llvm::ConstantFP>(expr->getOperand(1));

    bool lhs_sign = !lhs->isNegative();
    bool rhs_sign = !rhs->isNegative();

    // Additive identities
    if (lhs->isZero()) {
      return OPERAND(expr, 1);
    }

    if (rhs->isZero()) {
      return OPERAND(expr, 0);
    }

    // Infinities plus anything is still infinity, unless it is another infinity.
    // In which case their signs must be the same, otherwise we get a NaN
    if (lhs->isInfinity() && (!rhs->isInfinity() || lhs_sign == rhs_sign)) {
      return OPERAND(expr, 0);
    }

    if (rhs->isInfinity() && (!lhs->isInfinity() || lhs_sign == rhs_sign)) {
      return OPERAND(expr, 1);
    }

    return BINARY_OP(BinaryOp::CreateFAdd);
  }
  case Instruction::FSub: {
    BINARY_NAN_PROPAGATE(expr)

    auto lhs = llvm::cast<llvm::ConstantFP>(expr->getOperand(0));
    auto rhs = llvm::cast<llvm::ConstantFP>(expr->getOperand(1));

    bool lhs_sign = !lhs->isNegative();
    bool rhs_sign = !rhs->isNegative();

    // We do not process the rhs if the lhs is 0 since we would need to negate it
    if (rhs->isZero()) {
      return OPERAND(expr, 0);
    }

    // Infinities minus anything is still infinity, unless it is another infinity.
    // In which case their signs must be different, otherwise we get a NaN
    if (lhs->isInfinity() && (!rhs->isInfinity() || lhs_sign != rhs_sign)) {
      return OPERAND(expr, 0);
    }

    if (rhs->isInfinity() && (!lhs->isInfinity() || lhs_sign != rhs_sign)) {
      return OPERAND(expr, 1);
    }

    return BINARY_OP(BinaryOp::CreateFSub);
  }
  case Instruction::FMul: {
    BINARY_NAN_PROPAGATE(expr)
    return BINARY_OP(BinaryOp::CreateFMul);
  }
  case Instruction::FDiv: {
    BINARY_NAN_PROPAGATE(expr)
    return BINARY_OP(BinaryOp::CreateFDiv);
  }
  case Instruction::FRem: {
    BINARY_NAN_PROPAGATE(expr)
    return BINARY_OP(BinaryOp::CreateFRem);
  }

  // Conversion operations
  case Instruction::Trunc:    return CAST_OP(UnaryOp::CreateTrunc(type, value));
  case Instruction::SExt:     return CAST_OP(UnaryOp::CreateSExt(type, value));
  case Instruction::ZExt:     return CAST_OP(UnaryOp::CreateZExt(type, value));
  case Instruction::FPTrunc:  return CAST_OP(UnaryOp::CreateFpTrunc(type, value));
  case Instruction::FPExt:    return CAST_OP(UnaryOp::CreateFpExt(type, value));
  case Instruction::UIToFP:   return CAST_OP(UnaryOp::CreateUIToFp(type, value));
  case Instruction::SIToFP:   return CAST_OP(UnaryOp::CreateSIToFp(type, value));
  case Instruction::FPToUI:   return CAST_OP(UnaryOp::CreateFpToUI(type, value));
  case Instruction::FPToSI:   return CAST_OP(UnaryOp::CreateFpToSI(type, value));
    // clang-format on

  case Instruction::IntToPtr: {
    auto layout = ctx->llvm_module()->getDataLayout();
    return transform_value(
        [=](const auto& value) {
          return ContextValue(Pointer(UnaryOp::CreateTruncOrZExt(
              Type::int_ty(layout.getPointerSizeInBits(
                  expr->getType()->getPointerAddressSpace())),
              value.scalar())));
        },
        OPERAND(expr, 0));
  }
  case Instruction::PtrToInt: {
    auto layout = ctx->llvm_module()->getDataLayout();
    return transform_value(
        [=](const auto& value) {
          return ContextValue(
              UnaryOp::CreateTruncOrZExt(Type::from_llvm(expr->getType()),
                                         value.pointer().value(ctx->heap())));
        },
        OPERAND(expr, 0));
  }
  case Instruction::BitCast:
    return OPERAND(expr, 0);

  case Instruction::Select:
    return transform(SelectOp::Create, OPERAND(expr, 0), OPERAND(expr, 1),
                     OPERAND(expr, 2));

  case Instruction::GetElementPtr: {
    const llvm::DataLayout& layout = ctx->llvm_module()->getDataLayout();

    ContextValue ptr = OPERAND(expr, 0);
    llvm::Type* ptr_ty = expr->getOperand(0)->getType();
    while (ptr_ty->isVectorTy())
      ptr_ty = ptr_ty->getVectorElementType();

    auto offset_width =
        layout.getPointerSizeInBits(ptr_ty->getPointerAddressSpace());
    auto offset = ConstantInt::Create(llvm::APInt(offset_width, 0));

    auto end = llvm::gep_type_end(expr);
    for (auto it = llvm::gep_type_begin(expr); it != end; ++it) {
      if (llvm::StructType* sty = it.getStructTypeOrNull()) {
        auto slo = layout.getStructLayout(sty);
        unsigned index =
            llvm::cast<llvm::ConstantInt>(it.getOperand())->getZExtValue();

        offset = BinaryOp::CreateAdd(
            offset,
            ConstantInt::Create(llvm::APInt(offset->type().bitwidth(),
                                            slo->getElementOffset(index))));
      } else {
        auto value =
            evaluate(ctx, llvm::cast<llvm::Constant>(it.getOperand())).scalar();
        unsigned bitwidth = value->type().bitwidth();

        if (bitwidth < offset_width)
          value = UnaryOp::CreateSExt(Type::int_ty(offset_width), value);
        else if (bitwidth > offset_width)
          value = UnaryOp::CreateTrunc(Type::int_ty(offset_width), value);

        auto itemoffset = BinaryOp::CreateMul(
            value,
            ConstantInt::Create(llvm::APInt(
                bitwidth, layout.getTypeAllocSize(it.getIndexedType()))));

        offset = BinaryOp::CreateAdd(offset, itemoffset);
      }
    }

    auto func = [&](const ContextValue& value) {
      const auto& ptr = value.pointer();

      return ContextValue(
          Pointer(BinaryOp::CreateAdd(ptr.value(ctx->heap()), offset)));
    };
    return transform_value(func, ptr);
  }

  default:
    break;
  }

  std::string s = "Unsupported constant expression: ";
  llvm::raw_string_ostream os(s);
  expr->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(s);

#undef UNARY_OP
#undef BINARY_OP
#undef CAST_OP
#undef UNARY_NAN_PROPAGATE
#undef BINARY_NAN_PROPAGATE
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

  if (auto* null = llvm::dyn_cast<llvm::ConstantPointerNull>(constant)) {
    auto pointer_bitwidth =
        ctx->llvm_module()->getDataLayout().getPointerSizeInBits(
            null->getType()->getPointerAddressSpace());

    return ContextValue(
        Pointer(ConstantInt::Create(llvm::APInt(pointer_bitwidth, 0))));
  }

  if (auto* vec = llvm::dyn_cast<llvm::ConstantVector>(constant))
    return evaluate_const_vector(ctx, vec);

  if (auto* undef = llvm::dyn_cast<llvm::UndefValue>(constant))
    return evaluate_undef(ctx, undef);

  if (auto* global = llvm::dyn_cast<llvm::GlobalVariable>(constant))
    return evaluate_global(ctx, global);

  if (auto* expr = llvm::dyn_cast<llvm::ConstantExpr>(constant))
    return evaluate_expr(ctx, expr);

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
