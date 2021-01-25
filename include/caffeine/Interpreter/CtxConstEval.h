#ifndef CAFFEINE_INTERP_CTX_CONST_EVAL_H
#define CAFFEINE_INTERP_CTX_CONST_EVAL_H

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

template <typename ContextParamTy>
static std::optional<ContextValue> evaluate_expr(ContextParamTy ctx,
                                                 llvm::ConstantExpr* expr) {
#define OPERAND(expr, num)                                                     \
  *evaluate(ctx, llvm::cast<llvm::Constant>((expr)->getOperand(num)))
#define UNARY_OP(expr_) transform((expr_), OPERAND(expr, 0))
#define BINARY_OP(expr_)                                                       \
  transform([=](const auto& a, const auto& b) { return (expr_)(a, b); },       \
            OPERAND(expr, 0), OPERAND(expr, 1))
#define CAST_OP(expr_)                                                         \
  transform(                                                                   \
      [=, type = Type::from_llvm(expr->getType())](                            \
          const ref<Operation>& value) -> ref<Operation> { return (expr_); },  \
      OPERAND(expr, 0))

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

  case Instruction::FAdd: return BINARY_OP(BinaryOp::CreateFAdd);
  case Instruction::FSub: return BINARY_OP(BinaryOp::CreateFSub);
  case Instruction::FMul: return BINARY_OP(BinaryOp::CreateFMul);
  case Instruction::FDiv: return BINARY_OP(BinaryOp::CreateFDiv);
  case Instruction::FRem: return BINARY_OP(BinaryOp::CreateFRem);

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

        offset = BinaryOp::CreateAdd(offset, slo->getElementOffset(index));
      } else {
        auto tmp = evaluate(ctx, llvm::cast<llvm::Constant>(it.getOperand()));
        if (!tmp) {
          return std::nullopt;
        }
        auto value = UnaryOp::CreateTruncOrSExt(Type::int_ty(offset_width),
                                                tmp->scalar());

        auto itemoffset = BinaryOp::CreateMul(
            value, layout.getTypeAllocSize(it.getIndexedType()));

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

#undef OPERAND
#undef UNARY_OP
#undef BINARY_OP
#undef CAST_OP
}

template <typename ContextParamTy>
static std::optional<ContextValue> evaluate(ContextParamTy ctx,
                                            llvm::Constant* constant) {

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
    //     element types.
    for (size_t i = 0; i < count; ++i) {
      std::optional<ContextValue> tmp =
          evaluate<ContextParamTy>(ctx, vec->getElementAsConstant(i));
      if (!tmp) {
        // One for all, and all for one: if any fail to eval we abort
        return std::nullopt;
      }
      result.push_back(*tmp);
    }

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

      for (size_t i = 0; i < count; ++i) {
        std::optional<ContextValue> tmp =
            evaluate<ContextParamTy>(ctx, zero->getElementValue(i));
        if (!tmp) {
          // One for all, and all for one: if any fail to eval we abort
          return std::nullopt;
        }
        result.push_back(*tmp);
      }

      return ContextValue(std::move(result));
    }
  }

  std::string s = "Unsupported constant operand: ";
  llvm::raw_string_ostream os(s);
  constant->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(s);
}

} // namespace caffeine

#endif
