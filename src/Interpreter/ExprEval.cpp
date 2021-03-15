#include "caffeine/Interpreter/ExprEval.h"

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Value.h"
#include "caffeine/Memory/MemHeap.h"
#include <fmt/format.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

namespace caffeine {

namespace {
  OpRef scalarize(const LLVMScalar& scalar, const MemHeap& heap) {
    if (scalar.is_expr())
      return scalar.expr();
    return scalar.pointer().value(heap);
  }
} // namespace

ExprEvaluator::Unevaluatable::Unevaluatable(llvm::Value* expr,
                                            const char* context)
    : expr_(expr), context_(context) {
  CAFFEINE_ASSERT(expr != nullptr);
}

const char* ExprEvaluator::Unevaluatable::what() const throw() {
  if (msg_cache_.empty()) {
    std::string printed;
    llvm::raw_string_ostream os{printed};
    expr_->print(os, true);

    msg_cache_ = fmt::format(
        "Unable to evaluate expression: {}. Expression: {}", context_, printed);
  }

  return msg_cache_.c_str();
}
llvm::Value* ExprEvaluator::Unevaluatable::expr() const {
  return expr_;
}

ExprEvaluator::ExprEvaluator(Context* ctx, Options options)
    : ctx(ctx), options(options) {}

LLVMValue ExprEvaluator::visit(llvm::Value* val) {
  const auto& frame = ctx->stack_top();
  auto it = frame.variables.find(val);
  if (it != frame.variables.end())
    return static_cast<LLVMValue>(it->second);

  if (auto* inst = llvm::dyn_cast<llvm::Instruction>(val))
    return BaseType::visit(inst);

  std::string msg = "Unsupported expression: ";
  llvm::raw_string_ostream os{msg};
  val->print(os, true);

  CAFFEINE_ABORT(msg);
}
LLVMValue ExprEvaluator::visit(llvm::Value& val) {
  return visit(&val);
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
  std::string msg = "";
  llvm::raw_string_ostream os{msg};
  cnst.print(os, true);

  CAFFEINE_ABORT(
      fmt::format("Unable to evaluate constant expression: {}", msg));
}

LLVMValue
ExprEvaluator::visitConstantAggregateZero(llvm::ConstantAggregateZero& zero) {
  auto type = zero.getType();

  if (type->isVectorTy()) {
    CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                    "Scalable vectors are not supported");

    size_t count = type->getVectorNumElements();
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

  CAFFEINE_ASSERT(!type->isScalable(), "Scalable vectors are not supported");
  size_t count = type->getVectorNumElements();

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

LLVMValue ExprEvaluator::visitConstantInt(llvm::ConstantInt& cnst) {
  return LLVMValue(ConstantInt::Create(cnst.getValue()));
}

LLVMValue ExprEvaluator::visitConstantFP(llvm::ConstantFP& cnst) {
  return LLVMValue(ConstantFloat::Create(cnst.getValueAPF()));
}

LLVMValue
ExprEvaluator::visitConstantPointerNull(llvm::ConstantPointerNull& null) {
  const auto& layout = ctx->llvm_module()->getDataLayout();
  unsigned bitwidth =
      layout.getPointerSizeInBits(null.getType()->getPointerAddressSpace());

  return LLVMValue(
      Pointer(ConstantInt::Create(llvm::APInt::getNullValue(bitwidth))));
}

LLVMValue ExprEvaluator::visitUndefValue(llvm::UndefValue& undef) {
  auto type = undef.getType();

  if (type->isVectorTy()) {
    CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                    "scalable vectors are not supported");
    size_t count = type->getVectorNumElements();

    LLVMValue::OpVector result;
    result.reserve(count);

    auto inner =
        visitUndefValue(*llvm::UndefValue::get(type->getVectorElementType()))
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
    const auto& layout = ctx->llvm_module()->getDataLayout();
    unsigned bitwidth =
        layout.getPointerSizeInBits(type->getPointerAddressSpace());

    return LLVMValue(Pointer(Undef::Create(Type::int_ty(bitwidth))));
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
  CAFFEINE_ASSERT(!type->isScalable(), "Scalable vectors are not supported");

  size_t count = type->getVectorNumElements();

  LLVMValue::OpVector values;
  values.reserve(count);

  for (size_t i = 0; i < count; ++i) {
    values.push_back(visit(vec.getOperand(i)).scalar());
  }

  return LLVMValue(std::move(values));
}

LLVMValue ExprEvaluator::visitGlobalVariable(llvm::GlobalVariable& global) {
  auto it = ctx->globals_.find(&global);
  if (it != ctx->globals_.end())
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

  const llvm::DataLayout& layout = ctx->llvm_module()->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();
  unsigned alignment = global.getAlignment();

  auto alloc = ctx->heap().allocate(
      array.size(), ConstantInt::Create(llvm::APInt(bitwidth, alignment)), data,
      AllocationKind::Global, *ctx);

  auto pointer = LLVMValue(
      Pointer(alloc, ConstantInt::Create(llvm::APInt::getNullValue(bitwidth))));

  ctx->globals_.emplace(&global, (ContextValue)pointer);

  return pointer;
}

OpRef ExprEvaluator::visitGlobalData(llvm::Constant& constant, unsigned AS) {
  llvm::Type* type = constant.getType();
  const llvm::DataLayout& layout = ctx->llvm_module()->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits(AS);

  LLVMValue value = visit(&constant);

  OpRef size = ConstantInt::Create(llvm::APInt(
      bitwidth, layout.getTypeAllocSizeInBits(type).getFixedSize()));
  Allocation alloc{ConstantInt::CreateZero(bitwidth), size,
                   AllocOp::Create(size, ConstantInt::CreateZero(8)),
                   AllocationKind::Alloca};
  alloc.write(ConstantInt::CreateZero(bitwidth), type, value, ctx->heap(),
              layout);

  return alloc.data();
}
LLVMValue ExprEvaluator::visitConstantExpr(llvm::ConstantExpr& expr) {
  return visit(expr.getAsInstruction());
}

/*********************************************
 * InstVisitor override methods              *
 *********************************************/

LLVMValue ExprEvaluator::visitInstruction(llvm::Instruction& inst) {
  std::string msg = "";
  llvm::raw_string_ostream os{msg};
  inst.print(os, true);

  CAFFEINE_ABORT(
      fmt::format("Instruction '{}' not implemented! Full expression: {}",
                  inst.getOpcodeName(), msg));
}

#define DECL_BINARY_OP_VISIT(opcode)                                           \
  LLVMValue ExprEvaluator::visit##opcode(llvm::BinaryOperator& op) {           \
    LLVMValue lhs = visit(op.getOperand(0));                                   \
    LLVMValue rhs = visit(op.getOperand(1));                                   \
                                                                               \
    return transform_elements(                                                 \
        [&](const LLVMScalar& lhs, const LLVMScalar& rhs) -> LLVMScalar {      \
          const auto& heap = ctx->heap();                                      \
          return BinaryOp::Create##opcode(scalarize(lhs, heap),                \
                                          scalarize(rhs, heap));               \
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

} // namespace caffeine
