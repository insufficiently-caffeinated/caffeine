#include "caffeine/Interpreter/ExprEval.h"
#include "caffeine/ADT/Guard.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Memory/MemHeap.h"
#include "caffeine/Model/Value.h"
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

#include <algorithm>
#include <iostream>

namespace caffeine {

ExprEvaluator::Unevaluatable::Unevaluatable(llvm::Value* expr,
                                            const char* context)
    : UnsupportedOperationException(""), expr_(expr), context_(context) {
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

ExprEvaluator::ExprEvaluator(InterpreterContext* interp, Options options)
    : interp(interp), options(options) {}

OpRef ExprEvaluator::scalarize(const LLVMScalar& scalar) const {
  if (scalar.is_expr())
    return scalar.expr();
  return scalar.pointer().value(interp->context().heaps);
}

LLVMValue ExprEvaluator::visit(llvm::Value* val) {
  if (auto variable = interp->lookup(val)) {
    return std::move(variable).value();
  }

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
  if (auto* cnst = llvm::dyn_cast<llvm::GlobalAlias>(val))
    return visitGlobalAlias(*cnst);

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
  const auto& layout = interp->getModule()->getDataLayout();
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
    const auto& layout = interp->getModule()->getDataLayout();
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
  auto it = interp->context().globals.find(&global);
  if (it != interp->context().globals.end())
    return (LLVMValue)it->second;

  if (!options.create_allocations) {
    throw Unevaluatable(
        &global, "evaluating the global would require creating an allocation");
  }

  if (!global.hasInitializer()) {
    throw Unevaluatable(&global, "global had no initializer");
  }

  const llvm::DataLayout& layout = interp->getModule()->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();
  llvm::Type* type = global.getInitializer()->getType();
  OpRef size = ConstantInt::Create(
      llvm::APInt(bitwidth, layout.getTypeAllocSize(type).getFixedSize()));
  OpRef alloc_data = AllocOp::Create(size, ConstantInt::CreateZero(8));

  auto perms = global.isConstant() ? AllocationPermissions::Read
                                   : AllocationPermissions::ReadWrite;

  unsigned alignment = global.getAlignment();

  // Initially we create the allocation with a ReadWrite permission so that
  // we can write the constant data into it via visitGlobalData. Then in
  // visitGlobalData we set the permissions to the correct thing
  auto ptr = interp->allocate(
      size, interp->createConstantInt(bitwidth, alignment), alloc_data,
      global.getAddressSpace(), AllocationKind::Global,
      AllocationPermissions::ReadWrite);
  auto res = LLVMValue(ptr);

  interp->context().globals.emplace(&global, res);

  visitGlobalData(*global.getInitializer(), *interp->ptr_allocation(ptr),
                  global.getAddressSpace(), perms);

  return res;
}

LLVMValue ExprEvaluator::visitFunction(llvm::Function& func) {
  auto it = interp->context().globals.find(&func);
  if (it != interp->context().globals.end())
    return (LLVMValue)it->second;

  const llvm::DataLayout& layout = interp->getModule()->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();

  auto pointer = LLVMValue(interp->allocate(
      interp->createConstantInt(
          bitwidth, std::max<uint64_t>(func.getInstructionCount(), 1)),
      interp->createConstantZero(bitwidth), interp->createFunctionObject(&func),
      MemHeapMgr::FUNCTION_INDEX, AllocationKind::Global,
      AllocationPermissions::Execute));

  interp->context().globals.emplace(&func, pointer);
  return pointer;
}

LLVMValue ExprEvaluator::visitGlobalAlias(llvm::GlobalAlias& alias) {
  auto res = visit(alias.getAliasee());
  interp->context().globals.emplace(&alias, res);
  return res;
}

void ExprEvaluator::visitGlobalData(llvm::Constant& constant, Allocation& alloc,
                                    unsigned AS, AllocationPermissions perms) {
  auto guard = make_guard([&] { alloc.permissions(perms); });

  llvm::Type* type = constant.getType();
  const llvm::DataLayout& layout = interp->getModule()->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits(AS);

  // Don't bother to evaluate the rest of the initializer if we already know
  // that we're going to get all zeros.
  if (llvm::isa<llvm::ConstantAggregateZero>(constant))
    return;

  LLVMValue value = visit(&constant);

  alloc.write(ConstantInt::CreateZero(bitwidth), type, value,
              interp->context().heaps, layout);
}
LLVMValue ExprEvaluator::visitConstantExpr(llvm::ConstantExpr& expr) {
  auto inst = llvm::unique_value(expr.getAsInstruction());
  return visit(inst.get());
}

/*********************************************
 * InstVisitor override methods              *
 *********************************************/

LLVMValue ExprEvaluator::visitInstruction(llvm::Instruction& inst) {
  CAFFEINE_UNSUPPORTED(
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

  return interp->createICmp(opcode, visit(icmp.getOperand(0)),
                            visit(icmp.getOperand(1)));
}
LLVMValue ExprEvaluator::visitFCmp(llvm::FCmpInst& fcmp) {
  using llvm::FCmpInst;

  FCmpOpcode opcode;
  bool ordered = llvm::FCmpInst::isOrdered(fcmp.getPredicate());

  auto lhs = visit(fcmp.getOperand(0));
  auto rhs = visit(fcmp.getOperand(1));

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
    return interp->createOr(interp->createFIsNaN(lhs),
                            interp->createFIsNaN(rhs));

  case FCmpInst::FCMP_ORD:
    return interp->createNot(
        interp->createOr(interp->createFIsNaN(lhs), interp->createFIsNaN(rhs)));

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

  auto checkord =
      interp->createOr(interp->createFIsNaN(lhs), interp->createFIsNaN(rhs));
  auto cmp = interp->createFCmp(opcode, lhs, rhs);

  if (ordered) {
    return interp->createAnd(interp->createNot(checkord), cmp);
  } else {
    return interp->createOr(checkord, cmp);
  }
}

LLVMValue ExprEvaluator::visitPtrToInt(llvm::PtrToIntInst& inst) {
  return interp->createTruncOrZExt(Type::from_llvm(inst.getType()),
                                   visit(inst.getOperand(0)));
}
LLVMValue ExprEvaluator::visitIntToPtr(llvm::IntToPtrInst& inst) {
  const auto& layout = interp->getModule()->getDataLayout();
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
  llvm::Type* dst = inst.getDestTy();
  llvm::Type* src = inst.getSrcTy();

  if (dst->isPointerTy() && src->isPointerTy())
    return visit(inst.getOperand(0));

  if ((dst->isIntegerTy() && src->isFloatingPointTy()) ||
      (dst->isFloatingPointTy() && src->isIntegerTy())) {
    return interp->createBitcast(Type::from_llvm(dst),
                                 visit(inst.getOperand(0)));
  }

  CAFFEINE_UNSUPPORTED(
      fmt::format("Bitcasts from {} to {} are not supported", *src, *dst));
}

LLVMValue ExprEvaluator::visitGetElementPtr(llvm::GetElementPtrInst& inst) {
  const llvm::DataLayout& layout = interp->getModule()->getDataLayout();
  auto type = inst.getType();

  size_t offset_elements = 1;
  if (type->isVectorTy()) {
    auto fixedVectorTy = llvm::dyn_cast<llvm::FixedVectorType>(type);
    CAFFEINE_ASSERT(fixedVectorTy, "Scalable vectors are not supported");
    CAFFEINE_ASSERT(offset_elements == 1 ||
                    fixedVectorTy->getNumElements() == offset_elements);
    offset_elements = fixedVectorTy->getNumElements();
  }

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
      OpRef member_offset = interp->createConstantInt(
          ptr_width, slo->getElementOffset(member_index));

      newoffset = LLVMScalar(member_offset).broadcast(offset_elements);
    } else {
      auto operand = visit(it.getOperand());
      if (operand.is_scalar()) {
        operand = operand.scalar().broadcast(offset_elements);
      }

      newoffset = transform_elements(
          [&](const LLVMScalar& value) {
            OpRef index = UnaryOp::CreateTruncOrSExt(Type::int_ty(ptr_width),
                                                     value.expr());
            return BinaryOp::CreateMul(
                index, layout.getTypeAllocSize(it.getIndexedType()));
          },
          operand);
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
          return Pointer(interp->createAdd(ptr, offset.expr()), ptr.heap());
        }
      },
      base, offsets);
}

LLVMScalar ExprEvaluator::select(const LLVMScalar& cond,
                                 const LLVMScalar& t_val,
                                 const LLVMScalar& f_val) const {
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

  return Pointer(SelectOp::Create(cond.expr(),
                                  t_ptr.value(interp->context().heaps),
                                  f_ptr.value(interp->context().heaps)),
                 t_ptr.heap());
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
        return select(cond, t_val, f_val);
      },
      cond, t_val, f_val);
}

LLVMValue ExprEvaluator::visitInsertElement(llvm::InsertElementInst& inst) {
  auto vec_ = visit(inst.getOperand(0));
  auto vec = vec_.vector();

  auto elt = visit(inst.getOperand(1)).scalar();
  auto idx = visit(inst.getOperand(2)).scalar().expr();

  LLVMValue::OpVector result;
  result.reserve(vec.size());
  for (size_t i = 0; i < vec.size(); ++i) {
    result.push_back(select(ICmpOp::CreateICmpEQ(idx, i), elt, vec[i]));
  }

  return LLVMValue(std::move(result));
}
LLVMValue ExprEvaluator::visitExtractElement(llvm::ExtractElementInst& inst) {
  auto vec_ = visit(inst.getVectorOperand());
  auto vec = vec_.vector();

  auto idx = visit(inst.getOperand(1)).scalar().expr();
  auto type = inst.getType();

  const auto& layout = inst.getModule()->getDataLayout();

  LLVMScalar result =
      type->isPointerTy()
          ? LLVMScalar(
                Pointer(Undef::Create(Type::int_ty(layout.getPointerSizeInBits(
                            type->getPointerAddressSpace()))),
                        type->getPointerAddressSpace()))
          : LLVMScalar(Undef::Create(Type::from_llvm(type)));

  for (size_t i = 0; i < vec.size(); ++i) {
    result = select(ICmpOp::CreateICmpEQ(idx, i), vec[i], result);
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
