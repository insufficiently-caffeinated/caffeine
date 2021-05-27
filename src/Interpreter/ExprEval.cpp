#include "caffeine/Interpreter/ExprEval.h"

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Value.h"
#include "caffeine/Memory/MemHeap.h"
#include "caffeine/Support/LLVMFmt.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/GetElementPtrTypeIterator.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>
#include <magic_enum.hpp>

#include <iostream>

namespace caffeine {

ExprEvaluator::Unevaluatable::Unevaluatable(llvm::Value* expr,
                                            const char* context)
    : expr_(expr), context_(context) {
  CAFFEINE_ASSERT(expr != nullptr);
}

const char* ExprEvaluator::Unevaluatable::what() const throw() {
  if (msg_cache_.empty()) {
    msg_cache_ = fmt::format(
        FMT_STRING("Unable to evaluate expression: {}. Expression: {}"),
        context_, *expr_);
  }

  return msg_cache_.c_str();
}
llvm::Value* ExprEvaluator::Unevaluatable::expr() const {
  return expr_;
}

ExprEvaluator::ExprEvaluator(Context* ctx, Options options)
    : ctx(ctx), options(options) {}

OpRef ExprEvaluator::scalarize(const LLVMScalar& scalar) const {
  if (scalar.is_expr())
    return scalar.expr();
  return scalar.pointer().value(ctx->heaps);
}

LLVMValue ExprEvaluator::visit(llvm::Value* val) {
  const auto& frame = ctx->stack_top();
  auto it = frame.variables.find(val);
  if (it != frame.variables.end())
    return it->second;

  return evaluate(val);
}
LLVMValue ExprEvaluator::visit(llvm::Value& val) {
  return visit(&val);
}

LLVMValue ExprEvaluator::evaluate(llvm::Value* val) {
  if (auto* inst = llvm::dyn_cast<llvm::Instruction>(val))
    return BaseType::visit(inst);

  if (auto* expr = llvm::dyn_cast<llvm::ConstantExpr>(val))
    return visitConstantExpr(*expr);

  // Subclasses of ConstantData
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantInt>(val))
    return visitConstantInt(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantFP>(val))
    return visitConstantFP(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantPointerNull>(val))
    return visitConstantPointerNull(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantAggregateZero>(val))
    return visitConstantAggregateZero(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantDataVector>(val))
    return visitConstantDataVector(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantDataArray>(val))
    return visitConstantDataArray(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::UndefValue>(val))
    return visitUndefValue(*cnst);

  // Subclasses of ConstantAggregate
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantArray>(val))
    return visitConstantArray(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantStruct>(val))
    return visitConstantStruct(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantVector>(val))
    return visitConstantVector(*cnst);

  // Subclasses of GlobalValue
  if (auto* cnst = llvm::dyn_cast<llvm::GlobalVariable>(val))
    return visitGlobalVariable(*cnst);
  if (auto* cnst = llvm::dyn_cast<llvm::Function>(val))
    return visitFunction(*cnst);

  CAFFEINE_UNSUPPORTED(fmt::format(
      "Unsupported expression ({}): {}",
      magic_enum::enum_name((llvm::Value::ValueTy)val->getValueID()), *val));
}
LLVMValue ExprEvaluator::evaluate(llvm::Value& val) {
  return evaluate(&val);
}

std::optional<LLVMValue> ExprEvaluator::try_visit(llvm::Value* val) {
  try {
    return visit(val);
  } catch (Unevaluatable&) { return std::nullopt; }
}

/*********************************************
 * Constant visitor methods                  *
 *********************************************/

LLVMValue ExprEvaluator::visitConstant(llvm::Constant& cnst) {
  CAFFEINE_UNSUPPORTED(
      fmt::format("Unable to evaluate constant expression: {}", cnst));
}

LLVMValue
ExprEvaluator::visitConstantAggregateZero(llvm::ConstantAggregateZero& zero) {
  auto type = zero.getType();

  if (type->isVectorTy()) {
    auto fixedVectorTy = llvm::dyn_cast<llvm::FixedVectorType>(type);
    CAFFEINE_ASSERT(fixedVectorTy, "Scalable vectors are not supported");

    size_t count = fixedVectorTy->getNumElements();
    LLVMValue::OpVector result;
    result.reserve(count);

    for (size_t i = 0; i < count; ++i) {
      result.push_back(visit(zero.getElementValue(i)).scalar());
    }

    return LLVMValue(std::move(result));
  }

  if (type->isAggregateType()) {
    size_t count = type->isArrayTy() ? type->getArrayNumElements()
                                     : type->getStructNumElements();
    std::vector<LLVMValue> result;
    result.reserve(count);

    for (size_t i = 0; i < count; ++i) {
      result.push_back(visit(zero.getElementValue(i)));
    }

    return LLVMValue(std::move(result));
  }

  return visitConstant(zero);
}

LLVMValue
ExprEvaluator::visitConstantDataVector(llvm::ConstantDataVector& vec) {
  auto type = vec.getType();
  size_t count = type->getNumElements();

  if (vec.isSplat()) {
    return LLVMValue(
        LLVMValue::OpVector{count, visit(vec.getSplatValue()).scalar()});
  }

  LLVMValue::OpVector values;
  values.reserve(count);

  for (size_t i = 0; i < count; ++i) {
    values.push_back(visit(vec.getElementAsConstant(i)).scalar());
  }

  return LLVMValue(std::move(values));
}
LLVMValue ExprEvaluator::visitConstantDataArray(llvm::ConstantDataArray& arr) {
  auto type = arr.getType();
  size_t count = type->getArrayNumElements();

  std::vector<LLVMValue> values;
  values.reserve(count);

  for (size_t i = 0; i < count; ++i) {
    values.push_back(visit(arr.getElementAsConstant(i)));
  }

  return LLVMValue(std::move(values));
}
LLVMValue ExprEvaluator::visitConstantInt(llvm::ConstantInt& cnst) {
  return LLVMValue(ConstantInt::Create(cnst.getValue()));
}

LLVMValue ExprEvaluator::visitConstantFP(llvm::ConstantFP& cnst) {
  return LLVMValue(ConstantFloat::Create(cnst.getValueAPF()));
}

LLVMValue
ExprEvaluator::visitConstantPointerNull(llvm::ConstantPointerNull& null) {
  const auto& layout = ctx->mod->getDataLayout();
  unsigned address_space = null.getType()->getPointerAddressSpace();
  unsigned bitwidth = layout.getPointerSizeInBits(address_space);

  return LLVMValue(Pointer(
      ConstantInt::Create(llvm::APInt::getNullValue(bitwidth)), address_space));
}

LLVMValue ExprEvaluator::visitUndefValue(llvm::UndefValue& undef) {
  auto type = undef.getType();

  if (type->isVectorTy()) {
    auto fixedVectorTy = llvm::dyn_cast<llvm::FixedVectorType>(type);
    CAFFEINE_ASSERT(fixedVectorTy, "scalable vectors are not supported");
    size_t count = fixedVectorTy->getNumElements();

    LLVMValue::OpVector result;
    result.reserve(count);

    auto inner =
        visitUndefValue(*llvm::UndefValue::get(fixedVectorTy->getElementType()))
            .scalar();
    for (size_t i = 0; i < count; ++i)
      result.push_back(inner);

    return LLVMValue(std::move(result));
  }

  if (type->isArrayTy()) {
    size_t count = type->getArrayNumElements();

    std::vector<LLVMValue> result;
    result.reserve(count);

    auto inner =
        visitUndefValue(*llvm::UndefValue::get(type->getArrayElementType()));
    for (size_t i = 0; i < count; ++i) {
      result.push_back(inner);
    }

    return LLVMValue(std::move(result));
  }

  if (type->isStructTy()) {
    size_t count = type->getStructNumElements();

    std::vector<LLVMValue> result;
    result.reserve(count);

    for (size_t i = 0; i < count; ++i) {
      result.push_back(visitUndefValue(
          *llvm::UndefValue::get(type->getStructElementType(i))));
    }

    return LLVMValue(std::move(result));
  }

  if (type->isIntegerTy() || type->isFloatingPointTy()) {
    return LLVMValue(Undef::Create(Type::from_llvm(type)));
  }

  if (type->isPointerTy()) {
    const auto& layout = ctx->mod->getDataLayout();
    unsigned bitwidth =
        layout.getPointerSizeInBits(type->getPointerAddressSpace());

    return LLVMValue(Pointer(Undef::Create(Type::int_ty(bitwidth)),
                             type->getPointerAddressSpace()));
  }

  return visitConstant(undef);
}

LLVMValue ExprEvaluator::visitConstantArray(llvm::ConstantArray& cnst) {
  auto type = cnst.getType();
  size_t count = type->getArrayNumElements();

  std::vector<LLVMValue> values;
  values.reserve(count);

  for (size_t i = 0; i < count; ++i) {
    values.push_back(visit(cnst.getOperand(i)));
  }

  return LLVMValue(std::move(values));
}

LLVMValue ExprEvaluator::visitConstantStruct(llvm::ConstantStruct& cnst) {
  auto type = cnst.getType();
  size_t count = type->getStructNumElements();

  std::vector<LLVMValue> values;
  values.reserve(count);

  for (size_t i = 0; i < count; ++i) {
    values.push_back(visit(cnst.getOperand(i)));
  }

  return LLVMValue(std::move(values));
}

LLVMValue ExprEvaluator::visitConstantVector(llvm::ConstantVector& vec) {
  auto type = vec.getType();
  auto fixedVectorTy = llvm::dyn_cast<llvm::FixedVectorType>(type);
  CAFFEINE_ASSERT(fixedVectorTy, "Scalable vectors are not supported");

  size_t count = fixedVectorTy->getNumElements();

  LLVMValue::OpVector values;
  values.reserve(count);

  for (size_t i = 0; i < count; ++i) {
    values.push_back(visit(vec.getOperand(i)).scalar());
  }

  return LLVMValue(std::move(values));
}

LLVMValue ExprEvaluator::visitGlobalVariable(llvm::GlobalVariable& global) {
  auto it = ctx->globals.find(&global);
  if (it != ctx->globals.end())
    return (LLVMValue)it->second;

  if (!options.create_allocations) {
    throw Unevaluatable(
        &global, "evaluating the global would require creating an allocation");
  }

  if (!global.hasInitializer()) {
    throw Unevaluatable(&global, "global had no initializer");
  }

  OpRef data =
      visitGlobalData(*global.getInitializer(), global.getAddressSpace());
  const auto& array = llvm::cast<ArrayBase>(*data);

  const llvm::DataLayout& layout = ctx->mod->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();
  unsigned alignment = global.getAlignment();
  auto perms = global.isConstant() ? AllocationPermissions::Write
                                   : AllocationPermissions::ReadWrite;

  auto alloc = ctx->heaps[global.getAddressSpace()].allocate(
      array.size(), ConstantInt::Create(llvm::APInt(bitwidth, alignment)), data,
      AllocationKind::Global, perms, *ctx);

  auto pointer = LLVMValue(
      Pointer(alloc, ConstantInt::Create(llvm::APInt::getNullValue(bitwidth)),
              global.getAddressSpace()));

  ctx->globals.emplace(&global, pointer);

  return pointer;
}

LLVMValue ExprEvaluator::visitFunction(llvm::Function& func) {
  auto it = ctx->globals.find(&func);
  if (it != ctx->globals.end())
    return (LLVMValue)it->second;

  const llvm::DataLayout& layout = ctx->mod->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();

  auto alloc = ctx->heaps[MemHeapMgr::FUNCTION_INDEX].allocate(
      ConstantInt::Create(llvm::APInt(bitwidth, layout.getPointerSize())),
      ConstantInt::CreateZero(bitwidth), FunctionObject::Create(&func),
      AllocationKind::Global, AllocationPermissions::Execute, *ctx);

  auto pointer = LLVMValue(
      Pointer(alloc, ConstantInt::Create(llvm::APInt::getNullValue(bitwidth)),
              MemHeapMgr::FUNCTION_INDEX));

  ctx->globals.emplace(&func, pointer);
  return pointer;
}

OpRef ExprEvaluator::visitGlobalData(llvm::Constant& constant, unsigned AS) {
  llvm::Type* type = constant.getType();
  const llvm::DataLayout& layout = ctx->mod->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits(AS);

  OpRef size = ConstantInt::Create(
      llvm::APInt(bitwidth, layout.getTypeAllocSize(type).getFixedSize()));
  OpRef alloc_data = AllocOp::Create(size, ConstantInt::CreateZero(8));

  // Don't bother to evaluate the rest of the initializer if we already know
  // that we're going to get all zeros.
  if (llvm::isa<llvm::ConstantAggregateZero>(constant))
    return alloc_data;

  LLVMValue value = visit(&constant);

  Allocation alloc{ConstantInt::CreateZero(bitwidth), size, alloc_data,
                   AllocationKind::Alloca, AllocationPermissions::ReadWrite};
  alloc.write(ConstantInt::CreateZero(bitwidth), type, value, ctx->heaps,
              layout);

  return alloc.data();
}
LLVMValue ExprEvaluator::visitConstantExpr(llvm::ConstantExpr& expr) {
  auto inst = llvm::unique_value(expr.getAsInstruction());
  return visit(inst.get());
}

/*********************************************
 * InstVisitor override methods              *
 *********************************************/

LLVMValue ExprEvaluator::visitInstruction(llvm::Instruction& inst) {
  CAFFEINE_ABORT(
      fmt::format("Instruction '{}' not implemented! Full expression: {}",
                  inst.getOpcodeName(), inst));
}

#define DECL_BINARY_OP_VISIT(opcode)                                           \
  LLVMValue ExprEvaluator::visit##opcode(llvm::BinaryOperator& op) {           \
    LLVMValue lhs = visit(op.getOperand(0));                                   \
    LLVMValue rhs = visit(op.getOperand(1));                                   \
                                                                               \
    return transform_elements(                                                 \
        [&](const LLVMScalar& lhs, const LLVMScalar& rhs) -> LLVMScalar {      \
          return BinaryOp::Create##opcode(scalarize(lhs), scalarize(rhs));     \
        },                                                                     \
        lhs, rhs);                                                             \
  }                                                                            \
  static_assert(true)

#define DECL_CAST_OP_VISIT(opcode, castname)                                   \
  LLVMValue ExprEvaluator::visit##opcode(llvm::CastInst& op) {                 \
    LLVMValue value = visit(op.getOperand(0));                                 \
    Type type = Type::from_llvm(op.getType());                                 \
                                                                               \
    return transform_elements(                                                 \
        [&](const LLVMScalar& value) -> LLVMScalar {                           \
          return UnaryOp::Create##castname(type, value.expr());                \
        },                                                                     \
        value);                                                                \
  }                                                                            \
  static_assert(true)

DECL_BINARY_OP_VISIT(Add);
DECL_BINARY_OP_VISIT(Sub);
DECL_BINARY_OP_VISIT(Mul);
DECL_BINARY_OP_VISIT(UDiv);
DECL_BINARY_OP_VISIT(SDiv);
DECL_BINARY_OP_VISIT(URem);
DECL_BINARY_OP_VISIT(SRem);

DECL_BINARY_OP_VISIT(Shl);
DECL_BINARY_OP_VISIT(LShr);
DECL_BINARY_OP_VISIT(AShr);
DECL_BINARY_OP_VISIT(And);
DECL_BINARY_OP_VISIT(Or);
DECL_BINARY_OP_VISIT(Xor);

DECL_BINARY_OP_VISIT(FAdd);
DECL_BINARY_OP_VISIT(FSub);
DECL_BINARY_OP_VISIT(FMul);
DECL_BINARY_OP_VISIT(FDiv);

DECL_CAST_OP_VISIT(Trunc, Trunc);
DECL_CAST_OP_VISIT(SExt, SExt);
DECL_CAST_OP_VISIT(ZExt, ZExt);
DECL_CAST_OP_VISIT(FPTrunc, FpTrunc);
DECL_CAST_OP_VISIT(FPExt, FpExt);
DECL_CAST_OP_VISIT(UIToFP, UIToFp);
DECL_CAST_OP_VISIT(SIToFP, SIToFp);
DECL_CAST_OP_VISIT(FPToSI, FpToSI);
DECL_CAST_OP_VISIT(FPToUI, FpToUI);

LLVMValue ExprEvaluator::visitFNeg(llvm::UnaryOperator& op) {
  LLVMValue value = visit(op.getOperand(0));

  return transform_elements(
      [&](const LLVMScalar& value) -> LLVMScalar {
        return UnaryOp::CreateFNeg(value.expr());
      },
      value);
}

LLVMValue ExprEvaluator::visitICmp(llvm::ICmpInst& icmp) {
  using llvm::ICmpInst;

#define ICMP_CASE(op)                                                          \
  case ICmpInst::ICMP_##op:                                                    \
    opcode = ICmpOpcode::op;                                                   \
    break

  ICmpOpcode opcode;
  switch (icmp.getPredicate()) {
    ICMP_CASE(EQ);
    ICMP_CASE(NE);
    ICMP_CASE(UGT);
    ICMP_CASE(UGE);
    ICMP_CASE(ULT);
    ICMP_CASE(ULE);
    ICMP_CASE(SGT);
    ICMP_CASE(SGE);
    ICMP_CASE(SLT);
    ICMP_CASE(SLE);
  default:
    CAFFEINE_UNREACHABLE();
  }
#undef ICMP_CASE

  auto as_expr = [&](const LLVMScalar& value) {
    if (value.is_expr())
      return value.expr();
    return value.pointer().value(ctx->heaps);
  };

  return transform_elements(
      [&](const LLVMScalar& lhs, const LLVMScalar& rhs) -> LLVMScalar {
        return LLVMScalar(
            ICmpOp::CreateICmp(opcode, as_expr(lhs), as_expr(rhs)));
      },
      visit(icmp.getOperand(0)), visit(icmp.getOperand(1)));
}
LLVMValue ExprEvaluator::visitFCmp(llvm::FCmpInst& fcmp) {
  using llvm::FCmpInst;

  FCmpOpcode opcode;
  bool ordered = llvm::FCmpInst::isOrdered(fcmp.getPredicate());

#define FCMP_CASE(source, op)                                                  \
  case llvm::FCmpInst::FCMP_##source:                                          \
    opcode = FCmpOpcode::op;                                                   \
    break
  switch (fcmp.getPredicate()) {
    FCMP_CASE(OEQ, EQ);
    FCMP_CASE(OGT, GT);
    FCMP_CASE(OGE, GE);
    FCMP_CASE(OLT, LT);
    FCMP_CASE(OLE, LE);
    FCMP_CASE(ONE, NE);
    // The 'unordered' instructions return true if either arg is NaN
    FCMP_CASE(UEQ, EQ);
    FCMP_CASE(UGT, GT);
    FCMP_CASE(UGE, GE);
    FCMP_CASE(ULT, LT);
    FCMP_CASE(ULE, LE);
    FCMP_CASE(UNE, NE);

  case FCmpInst::FCMP_UNO:
    return transform_elements(
        [&](const LLVMScalar& lhs, const LLVMScalar& rhs) -> LLVMScalar {
          // isnan(lhs) || isnan(rhs)
          return BinaryOp::CreateOr(UnaryOp::CreateFIsNaN(lhs.expr()),
                                    UnaryOp::CreateFIsNaN(rhs.expr()));
        },
        visit(fcmp.getOperand(0)), visit(fcmp.getOperand(1)));
  case FCmpInst::FCMP_ORD:
    return transform_elements(
        [&](const LLVMScalar& lhs, const LLVMScalar& rhs) -> LLVMScalar {
          // ! ( isnan(lhs) || isnan(rhs) )
          return UnaryOp::CreateNot(
              BinaryOp::CreateOr(UnaryOp::CreateFIsNaN(lhs.expr()),
                                 UnaryOp::CreateFIsNaN(rhs.expr())));
        },
        visit(fcmp.getOperand(0)), visit(fcmp.getOperand(1)));

  case FCmpInst::FCMP_TRUE:
    return transform_elements(
        [&](const auto&) -> LLVMScalar { return ConstantInt::Create(true); },
        visit(fcmp.getOperand(0)));
  case FCmpInst::FCMP_FALSE:
    return transform_elements(
        [&](const auto&) -> LLVMScalar { return ConstantInt::Create(false); },
        visit(fcmp.getOperand(0)));

  default:
    CAFFEINE_UNREACHABLE();
  }
#undef FCMP_CASE

  return transform_elements(
      [&](const LLVMScalar& lhs, const LLVMScalar& rhs) -> LLVMScalar {
        OpRef checkord = BinaryOp::CreateOr(UnaryOp::CreateFIsNaN(lhs.expr()),
                                            UnaryOp::CreateFIsNaN(rhs.expr()));
        OpRef cmp = FCmpOp::CreateFCmp(opcode, lhs.expr(), rhs.expr());

        if (ordered) {
          return BinaryOp::CreateAnd(UnaryOp::CreateNot(checkord), cmp);
        } else {
          return BinaryOp::CreateOr(checkord, cmp);
        }
      },
      visit(fcmp.getOperand(0)), visit(fcmp.getOperand(1)));
}

LLVMValue ExprEvaluator::visitPtrToInt(llvm::PtrToIntInst& inst) {
  return transform_elements(
      [&](const LLVMScalar& value) {
        return LLVMScalar(
            UnaryOp::CreateTruncOrZExt(Type::from_llvm(inst.getType()),
                                       value.pointer().value(ctx->heaps)));
      },
      visit(inst.getOperand(0)));
}
LLVMValue ExprEvaluator::visitIntToPtr(llvm::IntToPtrInst& inst) {
  const auto& layout = ctx->mod->getDataLayout();
  unsigned pointer_size =
      layout.getPointerSizeInBits(inst.getType()->getPointerAddressSpace());

  return transform_elements(
      [&](const LLVMScalar& value) {
        return LLVMScalar(Pointer(UnaryOp::CreateTruncOrZExt(
                                      Type::int_ty(pointer_size), value.expr()),
                                  inst.getType()->getPointerAddressSpace()));
      },
      visit(inst.getOperand(0)));
}

LLVMValue ExprEvaluator::visitBitCast(llvm::BitCastInst& inst) {
  CAFFEINE_ASSERT(inst.getType()->isPointerTy(),
                  "Non-pointer bitcasts are not implemented");

  return visit(inst.getOperand(0));
}

LLVMValue ExprEvaluator::visitGetElementPtr(llvm::GetElementPtrInst& inst) {
  const llvm::DataLayout& layout = ctx->mod->getDataLayout();

  size_t offset_elements = 1;
  for (auto it = llvm::gep_type_begin(inst), end = llvm::gep_type_end(inst);
       it != end; ++it) {
    auto type = it.getOperand()->getType();

    if (type->isVectorTy()) {
      auto fixedVectorTy = llvm::dyn_cast<llvm::FixedVectorType>(type);
      CAFFEINE_ASSERT(fixedVectorTy, "Scalable vectors are not supported");
      CAFFEINE_ASSERT(offset_elements == 1 ||
                      fixedVectorTy->getNumElements() == offset_elements);

      offset_elements = fixedVectorTy->getNumElements();
    }
  }

  auto type = inst.getType();
  auto ptr_width = layout.getPointerSizeInBits(type->getPointerAddressSpace());
  auto offsets =
      LLVMScalar(ConstantInt::CreateZero(ptr_width)).broadcast(offset_elements);

  for (auto it = llvm::gep_type_begin(inst), end = llvm::gep_type_end(inst);
       it != end; ++it) {
    std::optional<LLVMValue> newoffset;

    if (llvm::StructType* sty = it.getStructTypeOrNull()) {
      auto slo = layout.getStructLayout(sty);

      unsigned member_index =
          llvm::cast<llvm::ConstantInt>(it.getOperand())->getZExtValue();
      OpRef member_offset = ConstantInt::Create(
          llvm::APInt(ptr_width, slo->getElementOffset(member_index)));

      newoffset = LLVMScalar(member_offset).broadcast(offset_elements);
    } else {
      newoffset = transform_elements(
          [&](const LLVMScalar& value) {
            OpRef index = UnaryOp::CreateTruncOrSExt(Type::int_ty(ptr_width),
                                                     value.expr());
            return BinaryOp::CreateMul(
                index, layout.getTypeAllocSize(it.getIndexedType()));
          },
          visit(it.getOperand()));
    }

    offsets = transform_elements(
        [](const LLVMScalar& a, const LLVMScalar& b) {
          return BinaryOp::CreateAdd(a.expr(), b.expr());
        },
        offsets, *newoffset);
  }

  LLVMValue base = visit(inst.getOperand(0));

  if (base.is_scalar()) {
    base = base.scalar().broadcast(offset_elements);
  } else if (offsets.is_scalar()) {
    offsets = offsets.scalar().broadcast(base.num_elements());
  }

  CAFFEINE_ASSERT(base.num_elements() == offsets.num_elements());

  return transform_elements(
      [&](const LLVMScalar& base, const LLVMScalar& offset) -> LLVMScalar {
        const Pointer& ptr = base.pointer();

        if (inst.isInBounds()) {
          return Pointer(ptr.alloc(),
                         BinaryOp::CreateAdd(ptr.offset(), offset.expr()),
                         ptr.heap());
        } else {
          return Pointer(
              BinaryOp::CreateAdd(ptr.value(ctx->heaps), offset.expr()),
              ptr.heap());
        }
      },
      base, offsets);
}

LLVMValue ExprEvaluator::visitSelectInst(llvm::SelectInst& op) {
  auto cond = visit(op.getCondition());
  auto t_val = visit(op.getTrueValue());
  auto f_val = visit(op.getFalseValue());

  if (cond.is_scalar()) {
    cond = cond.scalar().broadcast(t_val.num_elements());
  }

  return transform_elements(
      [&](const LLVMScalar& cond, const LLVMScalar& t_val,
          const LLVMScalar& f_val) -> LLVMScalar {
        if (!t_val.is_pointer() && !f_val.is_pointer())
          return SelectOp::Create(cond.expr(), t_val.expr(), f_val.expr());

        const Pointer& t_ptr = t_val.pointer();
        const Pointer& f_ptr = f_val.pointer();
        CAFFEINE_ASSERT(t_ptr.heap() == f_ptr.heap());

        if (t_ptr.alloc() == f_ptr.alloc()) {
          return Pointer(
              t_ptr.alloc(),
              SelectOp::Create(cond.expr(), t_ptr.offset(), f_ptr.offset()),
              t_ptr.heap());
        }

        return Pointer(SelectOp::Create(cond.expr(), t_ptr.value(ctx->heaps),
                                        f_ptr.value(ctx->heaps)),
                       t_ptr.heap());
      },
      cond, t_val, f_val);
}

LLVMValue ExprEvaluator::visitInsertElement(llvm::InsertElementInst& inst) {
  auto vec_ = visit(inst.getOperand(0));
  auto vec = vec_.vector();

  auto elt = scalarize(visit(inst.getOperand(1)).scalar());
  auto idx = visit(inst.getOperand(2)).scalar().expr();

  LLVMValue::OpVector result;
  result.reserve(vec.size());
  for (size_t i = 0; i < vec.size(); ++i) {
    result.emplace_back(
        SelectOp::Create(ICmpOp::CreateICmpEQ(idx, i), elt, scalarize(vec[i])));
  }

  return LLVMValue(std::move(result));
}
LLVMValue ExprEvaluator::visitExtractElement(llvm::ExtractElementInst& inst) {
  auto vec_ = visit(inst.getOperand(0));
  auto vec = vec_.vector();

  auto idx = visit(inst.getOperand(1)).scalar().expr();

  OpRef result = Undef::Create(Type::from_llvm(inst.getType()));
  for (size_t i = 0; i < vec.size(); ++i) {
    result = SelectOp::Create(ICmpOp::CreateICmpEQ(idx, i), scalarize(vec[i]),
                              result);
  }

  return LLVMValue(result);
}
LLVMValue ExprEvaluator::visitShuffleVector(llvm::ShuffleVectorInst& inst) {
  auto vec1_ = visit(inst.getOperand(0));
  auto vec2_ = visit(inst.getOperand(1));

  auto vec1 = vec1_.vector();
  auto vec2 = vec2_.vector();
  auto mask = inst.getShuffleMask();

  auto type = inst.getType();
  auto elem_type = type->getElementType();

  LLVMValue::OpVector results;
  results.reserve(vec1.size());

  /**
   * The semantics of shufflevector end up basically being an array lookup.
   * Given two vectors x, y and a mask m, we form one big vector z by
   * concatenating z = x||y. Then the values in m are used as indices in z
   * to get the final vector value. As well, since m is constant, we can
   * perform the whole operation while evaluating the instruction.
   */
  for (int mask_val : mask) {
    OpRef value = Undef::Create(Type::from_llvm(elem_type));

    if (mask_val == llvm::UndefMaskElem) {
      results.push_back(value);
      continue;
    }

    // Mask must be equal to 0 if it's a scalable array
    CAFFEINE_ASSERT(llvm::dyn_cast<llvm::FixedVectorType>(type) ||
                    mask_val == 0);

    value = (size_t)mask_val < vec1.size()
                ? scalarize(vec1[mask_val])
                : scalarize(vec2[mask_val - vec1.size()]);

    results.push_back(value);
  }

  return LLVMValue(std::move(results));
}

LLVMValue ExprEvaluator::visitExtractValue(llvm::ExtractValueInst& inst) {
  LLVMValue result = visit(inst.getAggregateOperand());

  for (unsigned idx : inst.indices()) {
    LLVMValue member = result.member(idx);
    result = std::move(member);
  }

  return result;
}
LLVMValue ExprEvaluator::visitInsertValue(llvm::InsertValueInst& inst) {
  LLVMValue agg = visit(inst.getAggregateOperand());
  LLVMValue val = visit(inst.getInsertedValueOperand());

  LLVMValue* ptr = &agg;
  for (unsigned idx : inst.indices()) {
    ptr = &ptr->member(idx);
  }

  *ptr = val;
  return agg;
}

} // namespace caffeine
