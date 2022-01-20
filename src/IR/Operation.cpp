#include "caffeine/IR/Operation.h"
#include "Operation.h"
#include "caffeine/IR/OperationData.h"
#include "caffeine/IR/Type.h"
#include "caffeine/IR/Value.h"
#include "caffeine/Support/LLVMFmt.h"
#include "caffeine/Support/Macros.h"
#include <boost/container_hash/hash.hpp>
#include <caffeine/IR/OperationBase.h>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <immer/vector_transient.hpp>
#include <initializer_list>
#include <llvm/ADT/Hashing.h>
#include <llvm/ADT/SmallString.h>
#include <llvm/Support/raw_ostream.h>
#include <memory>

#define SIZE_BITS (sizeof(size_t) * CHAR_BIT)

namespace caffeine {

#define ASSERT_SAME_TYPES_2(v1, v2)                                            \
  ASSERT_SAME_TYPES_3(v1, v2, "arguments had different types")
#define ASSERT_SAME_TYPES_3(t1, t2, msg)                                       \
  CAFFEINE_ASSERT((t1) == (t2), fmt::format("{}: {} != {}", (msg), (t1), (t2)))
#define ASSERT_SAME_TYPES(...)                                                 \
  CAFFEINE_INVOKE_NUMBERED(ASSERT_SAME_TYPES_, __VA_ARGS__)

/***************************************************
 * Constant                                        *
 ***************************************************/
Constant::Constant(Type t, const Symbol& symbol)
    : Operation(std::make_unique<caffeine::ConstantData>(t, symbol)) {}
Constant::Constant(Type t, Symbol&& symbol)
    : Operation(
          std::make_unique<caffeine::ConstantData>(t, std::move(symbol))) {}

OpRef Constant::Create(Type t, const Symbol& symbol) {
  return Constant::Create(t, Symbol(symbol));
}
OpRef Constant::Create(Type t, Symbol&& symbol) {
  return constant_fold(Constant(t, std::move(symbol)));
}

Operation::Opcode Constant::op_for_symbol(const Symbol& symbol) {
  if (symbol.is_named())
    return ConstantNamed;
  return ConstantNumbered;
}

/***************************************************
 * ConstantInt                                     *
 ***************************************************/
ConstantInt::ConstantInt(const llvm::APInt& iconst)
    : Operation(std::make_unique<ConstantIntData>(iconst)) {}
ConstantInt::ConstantInt(llvm::APInt&& iconst)
    : Operation(std::make_unique<ConstantIntData>(std::move(iconst))) {}

Value ConstantInt::as_value() const {
  return Value(value());
}

OpRef ConstantInt::Create(const llvm::APInt& iconst) {
  return Create(llvm::APInt(iconst));
}
OpRef ConstantInt::Create(llvm::APInt&& iconst) {
  return constant_fold(ConstantInt(iconst));
}
OpRef ConstantInt::Create(bool value) {
  return Create(llvm::APInt(1, static_cast<uint64_t>(value)));
}
OpRef ConstantInt::Create(const Value& value) {
  return Create(value.apint());
}

OpRef ConstantInt::CreateZero(unsigned bitwidth) {
  return ConstantInt::Create(llvm::APInt::getNullValue(bitwidth));
}

/***************************************************
 * ConstantFloat                                   *
 ***************************************************/
ConstantFloat::ConstantFloat(const llvm::APFloat& fconst)
    : Operation(std::make_unique<ConstantFloatData>(fconst)) {}
ConstantFloat::ConstantFloat(llvm::APFloat&& fconst)
    : Operation(std::make_unique<ConstantFloatData>(std::move(fconst))) {}

OpRef ConstantFloat::Create(const llvm::APFloat& fconst) {
  return Create(llvm::APFloat(fconst));
}
OpRef ConstantFloat::Create(llvm::APFloat&& fconst) {
  return constant_fold(ConstantFloat(fconst));
}
OpRef ConstantFloat::Create(double value) {
  return Create(llvm::APFloat(value));
}

/***************************************************
 * ConstantArray                                   *
 ***************************************************/
ConstantArray::ConstantArray(Symbol&& symbol, const OpRef& size)
    : ArrayBase(std::make_unique<caffeine::ConstantData>(
                    Type::array_ty(size->type().bitwidth()), std::move(symbol)),
                {size}) {}

OpRef ConstantArray::Create(const Symbol& symbol, const OpRef& size) {
  return Create(Symbol(symbol), size);
}
OpRef ConstantArray::Create(Symbol&& symbol, const OpRef& size) {
  CAFFEINE_ASSERT(size->type().is_int());

  return constant_fold(ConstantArray(std::move(symbol), size));
}

const Symbol& ConstantArray::symbol() const {
  return llvm::cast<caffeine::ConstantData>(data_.get())->symbol();
}

/***************************************************
 * BinaryOp                                        *
 ***************************************************/
BinaryOp::BinaryOp(Opcode op, Type t, const OpRef& lhs, const OpRef& rhs)
    : Operation(std::make_unique<OperationData>(op, t), {lhs, rhs}) {}

OpRef BinaryOp::Create(Opcode op, const OpRef& lhs, const OpRef& rhs) {
  CAFFEINE_ASSERT((op & 0x3) == 2, "Opcode doesn't have 2 operands");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(
      lhs->type() == rhs->type(),
      fmt::format(
          FMT_STRING(
              "BinaryOp created from operands with different types: {} != {}"),
          lhs->type(), rhs->type()));

  return constant_fold(BinaryOp(op, lhs->type(), lhs, rhs));
}

#define ASSERT_INT(op) CAFFEINE_ASSERT((op)->type().is_int())
#define ASSERT_FP(op) CAFFEINE_ASSERT((op)->type().is_float())

// There's a lot of these so template them out using a macro
#define DECL_BINOP_CREATE(opcode, assert)                                      \
  OpRef BinaryOp::Create##opcode(const OpRef& lhs, const OpRef& rhs) {         \
    CAFFEINE_ASSERT(lhs, "lhs was null");                                      \
    CAFFEINE_ASSERT(rhs, "rhs was null");                                      \
    assert(lhs);                                                               \
    assert(rhs);                                                               \
                                                                               \
    return Create(Opcode::opcode, lhs, rhs);                                   \
  }                                                                            \
  static_assert(true)

DECL_BINOP_CREATE(Add, ASSERT_INT);
DECL_BINOP_CREATE(Sub, ASSERT_INT);
DECL_BINOP_CREATE(Mul, ASSERT_INT);
DECL_BINOP_CREATE(UDiv, ASSERT_INT);
DECL_BINOP_CREATE(SDiv, ASSERT_INT);
DECL_BINOP_CREATE(URem, ASSERT_INT);
DECL_BINOP_CREATE(SRem, ASSERT_INT);

DECL_BINOP_CREATE(And, ASSERT_INT);
DECL_BINOP_CREATE(Or, ASSERT_INT);
DECL_BINOP_CREATE(Xor, ASSERT_INT);
DECL_BINOP_CREATE(Shl, ASSERT_INT);
DECL_BINOP_CREATE(LShr, ASSERT_INT);
DECL_BINOP_CREATE(AShr, ASSERT_INT);

DECL_BINOP_CREATE(FAdd, ASSERT_FP);
DECL_BINOP_CREATE(FSub, ASSERT_FP);
DECL_BINOP_CREATE(FMul, ASSERT_FP);
DECL_BINOP_CREATE(FDiv, ASSERT_FP);
DECL_BINOP_CREATE(FRem, ASSERT_FP);

#define DEF_INT_BINOP_CONST_CREATE_DETAIL(opcode, ty, signed)                  \
  OpRef BinaryOp::Create##opcode(const OpRef& lhs, ty rhs) {                   \
    CAFFEINE_ASSERT(lhs, "lhs is null");                                       \
    CAFFEINE_ASSERT(lhs->type().is_int());                                     \
                                                                               \
    return BinaryOp::Create##opcode(                                           \
        lhs, ConstantInt::Create(                                              \
                 llvm::APInt(lhs->type().bitwidth(), rhs, signed)));           \
  }                                                                            \
  OpRef BinaryOp::Create##opcode(ty lhs, const OpRef& rhs) {                   \
    CAFFEINE_ASSERT(rhs, "rhs is null");                                       \
    CAFFEINE_ASSERT(rhs->type().is_int());                                     \
                                                                               \
    return BinaryOp::Create##opcode(                                           \
        ConstantInt::Create(llvm::APInt(rhs->type().bitwidth(), lhs, signed)), \
        rhs);                                                                  \
  }                                                                            \
  static_assert(true)

OpRef BinaryOp::CreateUMulOverflow(const OpRef& a, const OpRef& b) {
  CAFFEINE_ASSERT(
      a->type() == b->type(),
      fmt::format(
          FMT_STRING(
              "BinaryOp created from operands with different types: {} != {}"),
          a->type(), b->type()));
  CAFFEINE_ASSERT(a->type().is_int());
  CAFFEINE_ASSERT(b->type().is_int());

  // This implementation is based on the unsigned overflow detection circuit
  // from
  //   Schulte, M. J., Gok, M., Balzola, P. I., & Brocato, R. W. (2000,
  //   November). Combined unsigned and two's complement saturating multipliers.
  //   In International Symposium on Optical Science and Technology (pp.
  //   185-196). International Society for Optics and Photonics.

  uint32_t bitwidth = a->type().bitwidth();

  if (bitwidth < 2) {
    return ConstantInt::Create(false);
  }

  auto o = extract_bit(a, bitwidth - 1);
  auto v = BinaryOp::CreateAnd(extract_bit(a, bitwidth - 1), extract_bit(b, 1));

  for (uint32_t i = 2; i < bitwidth; ++i) {
    o = BinaryOp::CreateOr(o, extract_bit(a, bitwidth - i));
    v = BinaryOp::CreateOr(v, BinaryOp::CreateAnd(o, extract_bit(b, i)));
  }

  auto mult =
      BinaryOp::CreateMul(UnaryOp::CreateZExt(Type::int_ty(bitwidth + 1), a),
                          UnaryOp::CreateZExt(Type::int_ty(bitwidth + 1), b));

  return BinaryOp::CreateOr(v, extract_bit(mult, bitwidth));
}
OpRef BinaryOp::CreateSMulOverflow(const OpRef& a, const OpRef& b) {
  CAFFEINE_ASSERT(
      a->type() == b->type(),
      fmt::format(
          FMT_STRING(
              "BinaryOp created from operands with different types: {} != {}"),
          a->type(), b->type()));
  CAFFEINE_ASSERT(a->type().is_int());
  CAFFEINE_ASSERT(b->type().is_int());

  uint32_t bitwidth = a->type().bitwidth();

  // The implementation below doesn't work for 1-bit integers
  if (bitwidth < 2) {
    return BinaryOp::CreateAnd(a, b);
  }

  // This implementation is based on the signed overflow detection circuit from
  //   Schulte, M. J., Gok, M., Balzola, P. I., & Brocato, R. W. (2000,
  //   November). Combined unsigned and two's complement saturating multipliers.
  //   In International Symposium on Optical Science and Technology (pp.
  //   185-196). International Society for Optics and Photonics.
  //
  // It is also based on the internal Z3 definition of bvsmul_no_overflow

  // ax_i = a_i xor a_{n-1}
  auto ax = BinaryOp::CreateXor(BinaryOp::CreateAShr(a, bitwidth - 1), a);
  auto bx = BinaryOp::CreateXor(BinaryOp::CreateAShr(b, bitwidth - 1), b);

  auto o = extract_bit(ax, bitwidth - 2);
  auto v =
      BinaryOp::CreateAnd(extract_bit(ax, bitwidth - 2), extract_bit(bx, 1));

  for (uint32_t i = 2; i < bitwidth - 1; ++i) {
    o = BinaryOp::CreateOr(o, extract_bit(ax, bitwidth - i - 1));
    v = BinaryOp::CreateOr(v, BinaryOp::CreateAnd(o, extract_bit(bx, i)));
  }

  auto sign = ICmpOp::CreateICmpEQ(extract_bit(a, bitwidth - 1),
                                   extract_bit(b, bitwidth - 1));
  auto mult =
      BinaryOp::CreateMul(UnaryOp::CreateSExt(Type::int_ty(bitwidth + 1), a),
                          UnaryOp::CreateSExt(Type::int_ty(bitwidth + 1), b));

  auto overflow1 = BinaryOp::CreateXor(extract_bit(mult, bitwidth),
                                       extract_bit(mult, bitwidth - 1));

  return BinaryOp::CreateAnd(sign, BinaryOp::CreateOr(overflow1, v));
}

// Note: if we want to add more overloads here then it'll be necessary to
// overload for all integer types as once you've got 2 then C++ can no longer
// figure out which to coerce to.
//
// I'm leaving this here so we can easily add such methods if we decide to.
#define DEF_INT_BINOP_CONST_CREATE(opcode)                                     \
  DEF_INT_BINOP_CONST_CREATE_DETAIL(opcode, int64_t, true)

DEF_INT_BINOP_CONST_CREATE(Add);
DEF_INT_BINOP_CONST_CREATE(Sub);
DEF_INT_BINOP_CONST_CREATE(Mul);
DEF_INT_BINOP_CONST_CREATE(UDiv);
DEF_INT_BINOP_CONST_CREATE(SDiv);
DEF_INT_BINOP_CONST_CREATE(URem);
DEF_INT_BINOP_CONST_CREATE(SRem);

DEF_INT_BINOP_CONST_CREATE(And);
DEF_INT_BINOP_CONST_CREATE(Or);
DEF_INT_BINOP_CONST_CREATE(Xor);
DEF_INT_BINOP_CONST_CREATE(Shl);
DEF_INT_BINOP_CONST_CREATE(LShr);
DEF_INT_BINOP_CONST_CREATE(AShr);

#undef DEF_INT_BINOP_CONST_CREATE
#undef DEF_INT_BINOP_CONST_CREATE_DETAIL

/***************************************************
 * UnaryOp                                         *
 ***************************************************/
UnaryOp::UnaryOp(Opcode op, Type t, const OpRef& operand)
    : Operation(std::make_unique<OperationData>(op, t), {operand}) {}

OpRef UnaryOp::Create(Opcode op, const OpRef& operand) {
  return Create(op, operand, operand->type());
}

OpRef UnaryOp::Create(Opcode op, const OpRef& operand, Type returnType) {
  CAFFEINE_ASSERT(operand, "operand was null");
  CAFFEINE_ASSERT((op & 0x3) == 1, "Opcode doesn't have 2 operands");

  return constant_fold(UnaryOp(op, returnType, operand));
}

#define DECL_UNOP_CREATE(opcode, assert, return_type)                          \
  OpRef UnaryOp::Create##opcode(const OpRef& operand) {                        \
    assert(operand);                                                           \
                                                                               \
    return Create(Opcode::opcode, operand, return_type);                       \
  }                                                                            \
  static_assert(true)

DECL_UNOP_CREATE(Not, ASSERT_INT, operand->type());
DECL_UNOP_CREATE(FNeg, ASSERT_FP, operand->type());
DECL_UNOP_CREATE(FIsNaN, ASSERT_FP, Type::int_ty(1));

OpRef UnaryOp::CreateTrunc(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() <= operand->type().bitwidth());

  return Create(Opcode::Trunc, operand, tgt);
}
OpRef UnaryOp::CreateZExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() >= operand->type().bitwidth());

  return Create(Opcode::ZExt, operand, tgt);
}
OpRef UnaryOp::CreateSExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() >= operand->type().bitwidth());

  return Create(Opcode::SExt, operand, tgt);
}
OpRef UnaryOp::CreateFpTrunc(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_float());
  CAFFEINE_ASSERT(tgt.exponent_bits() < operand->type().exponent_bits() &&
                  tgt.mantissa_bits() < operand->type().mantissa_bits());

  return Create(Opcode::FpTrunc, operand, tgt);
}
OpRef UnaryOp::CreateFpExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_float());
  CAFFEINE_ASSERT(tgt.exponent_bits() > operand->type().exponent_bits() &&
                  tgt.mantissa_bits() > operand->type().mantissa_bits());

  return Create(Opcode::FpExt, operand, tgt);
}
OpRef UnaryOp::CreateFpToUI(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_float());

  return Create(Opcode::FpToUI, operand, tgt);
}
OpRef UnaryOp::CreateFpToSI(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_float());

  return Create(Opcode::FpToSI, operand, tgt);
}
OpRef UnaryOp::CreateUIToFp(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_int());

  return Create(Opcode::UIToFp, operand, tgt);
}
OpRef UnaryOp::CreateSIToFp(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_int());

  return Create(Opcode::SIToFp, operand, tgt);
}
OpRef UnaryOp::CreateBitcast(Type tgt, const OpRef& operand) {
  // TODO: Validate sizes if possible.
  // CAFFEINE_ASSERT(tgt.byte_size() == operand->type().byte_size());

  return Create(Opcode::Bitcast, operand, tgt);
}

OpRef UnaryOp::CreateTruncOrZExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.is_int());

  if (tgt.bitwidth() < operand->type().bitwidth())
    return CreateTrunc(tgt, operand);
  if (tgt.bitwidth() > operand->type().bitwidth())
    return CreateZExt(tgt, operand);
  return operand;
}
OpRef UnaryOp::CreateTruncOrSExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.is_int());

  if (tgt.bitwidth() < operand->type().bitwidth())
    return CreateTrunc(tgt, operand);
  if (tgt.bitwidth() > operand->type().bitwidth())
    return CreateSExt(tgt, operand);
  return operand;
}

/***************************************************
 * SelectOp                                        *
 ***************************************************/
SelectOp::SelectOp(Type t, const OpRef& cond, const OpRef& true_val,
                   const OpRef& false_val)
    : Operation(std::make_unique<OperationData>(Opcode::Select, t),
                {cond, true_val, false_val}) {}

OpRef SelectOp::Create(const OpRef& cond, const OpRef& true_value,
                       const OpRef& false_value) {
  CAFFEINE_ASSERT(cond, "cond was null");
  CAFFEINE_ASSERT(true_value, "true_value was null");
  CAFFEINE_ASSERT(false_value, "false_value was null");

  CAFFEINE_ASSERT(
      cond->type() == Type::int_ty(1),
      fmt::format("select condition was not an i1, it was {}", cond->type()));
  ASSERT_SAME_TYPES(true_value->type(), false_value->type(),
                    "select values had different types");

  return constant_fold(
      SelectOp(true_value->type(), cond, true_value, false_value));
}

/***************************************************
 * ICmpOp                                          *
 ***************************************************/
ICmpOp::ICmpOp(ICmpOpcode cmp, Type t, const OpRef& lhs, const OpRef& rhs)
    : BinaryOp(static_cast<Opcode>(
                   detail::opcode(icmp_base, 2, static_cast<uint16_t>(cmp))),
               t, lhs, rhs) {}

OpRef ICmpOp::CreateICmp(ICmpOpcode cmp, const OpRef& lhs, const OpRef& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(
      rhs->type() == lhs->type(),
      fmt::format("cannot compare icmp operands with different types: {} != {}",
                  rhs->type(), lhs->type()));
  CAFFEINE_ASSERT(lhs->type().is_int(),
                  "icmp can only be created with integer operands");

  return constant_fold(ICmpOp(cmp, Type::type_of<bool>(), lhs, rhs));
}
OpRef ICmpOp::CreateICmp(ICmpOpcode cmp, int64_t lhs, const OpRef& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(rhs->type().is_int(),
                  "icmp can only be created with integer operands");

  auto literal = llvm::APInt(64, static_cast<uint64_t>(lhs));
  return ICmpOp::CreateICmp(
      cmp, ConstantInt::Create(literal.sextOrTrunc(rhs->type().bitwidth())),
      rhs);
}
OpRef ICmpOp::CreateICmp(ICmpOpcode cmp, const OpRef& lhs, int64_t rhs) {
  CAFFEINE_ASSERT(lhs, "rhs was null");
  CAFFEINE_ASSERT(lhs->type().is_int(),
                  "icmp can only be created with integer operands");

  auto literal = llvm::APInt(64, static_cast<uint64_t>(rhs));
  return ICmpOp::CreateICmp(
      cmp, lhs,
      ConstantInt::Create(literal.sextOrTrunc(lhs->type().bitwidth())));
}

/***************************************************
 * FCmpOp                                          *
 ***************************************************/
FCmpOp::FCmpOp(FCmpOpcode cmp, Type t, const OpRef& lhs, const OpRef& rhs)
    : BinaryOp(static_cast<Opcode>(
                   detail::opcode(fcmp_base, 2, static_cast<uint16_t>(cmp))),
               t, lhs, rhs) {}

OpRef FCmpOp::CreateFCmp(FCmpOpcode cmp, const OpRef& lhs, const OpRef& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs->type() == lhs->type(),
                  "cannot compare icmp operands with different types");
  CAFFEINE_ASSERT(lhs->type().is_float(),
                  "icmp can only be created with integer operands");

  return constant_fold(FCmpOp(cmp, Type::type_of<bool>(), lhs, rhs));
}

/***************************************************
 * AllocOp                                         *
 ***************************************************/
AllocOp::AllocOp(const OpRef& size, const OpRef& defaultval)
    : ArrayBase(std::make_unique<OperationData>(
                    Opcode::Alloc, Type::array_ty(size->type().bitwidth())),
                {size, defaultval}) {}

OpRef AllocOp::Create(const OpRef& size, const OpRef& defaultval) {
  CAFFEINE_ASSERT(size, "size was null");
  CAFFEINE_ASSERT(defaultval, "defaultval was null");
  // To be fully correct, this should be validating that the bitwidth of size
  // is the correct one for the architecture model. Unfortunately we don't
  // have enough information here to validate that so instead we just ensure
  // that size is an integer.
  CAFFEINE_ASSERT(size->type().is_int(), "Array size must be an integer type");
  CAFFEINE_ASSERT(defaultval->type() == Type::int_ty(8));

  return constant_fold(AllocOp(size, defaultval));
}

/***************************************************
 * LoadOp                                          *
 ***************************************************/
LoadOp::LoadOp(const OpRef& data, const OpRef& offset)
    : Operation(std::make_unique<OperationData>(Opcode::Load, Type::int_ty(8)),
                {data, offset}) {}

OpRef LoadOp::Create(const OpRef& data, const OpRef& offset) {
  CAFFEINE_ASSERT(data, "data was null");
  CAFFEINE_ASSERT(offset, "offset was null");
  CAFFEINE_ASSERT(offset->type().is_int(),
                  "Load offset must be a pointer-sized integer type");

  return constant_fold(LoadOp(data, offset));
}

/***************************************************
 * StoreOp                                         *
 ***************************************************/
StoreOp::StoreOp(const OpRef& data, const OpRef& offset, const OpRef& value)
    : ArrayBase(std::make_unique<OperationData>(Opcode::Store, data->type()),
                {data, offset, value}) {}

OpRef StoreOp::Create(const OpRef& data, const OpRef& offset,
                      const OpRef& value) {
  CAFFEINE_ASSERT(data, "data was null");
  CAFFEINE_ASSERT(offset, "offset was null");
  CAFFEINE_ASSERT(value, "value was null");

  CAFFEINE_ASSERT(offset->type().is_int(),
                  "Store offset must be a pointer-size integer type");
  CAFFEINE_ASSERT(value->type() == Type::int_ty(8), "Value must be of type i8");

  return constant_fold(StoreOp(data, offset, value));
}

/***************************************************
 * Undef                                           *
 ***************************************************/
Undef::Undef(const Type& t)
    : Operation(std::make_unique<OperationData>(Opcode::Undef, t)) {}

OpRef Undef::Create(const Type& t) {
  return constant_fold(Undef(t));
}

/***************************************************
 * FixedArray                                      *
 ***************************************************/
FixedArray::FixedArray(Type t, llvm::ArrayRef<OpRef> data)
    : ArrayBase(std::make_unique<OperationData>(Operation::FixedArray, t),
                data) {}

llvm::ArrayRef<OpRef> FixedArray::data() const {
  return operands_;
}

OpRef FixedArray::Create(Type index_ty, llvm::ArrayRef<OpRef> data) {
  CAFFEINE_ASSERT(index_ty.is_int());
  CAFFEINE_ASSERT(
      index_ty.bitwidth() >= ilog2(data.size()),
      "Index bitwidth is not large enough to address entire constant array");

  return constant_fold(FixedArray(Type::array_ty(index_ty.bitwidth()), data));
}
OpRef FixedArray::Create(Type index_ty, const OpRef& value, size_t size) {
  return FixedArray::Create(index_ty, std::vector<OpRef>(size, value));
}

/***************************************************
 * FunctionObject                                  *
 ***************************************************/
FunctionObject::FunctionObject(llvm::Function* function)
    : Operation(std::make_unique<FunctionObjectData>(function)) {}

llvm::Function* FunctionObject::function() const {
  return llvm::cast<FunctionObjectData>(data_.get())->function();
}

OpRef FunctionObject::Create(llvm::Function* function) {
  CAFFEINE_ASSERT(function != nullptr);

  return constant_fold(FunctionObject(function));
}

/***************************************************
 * hashing implementations                         *
 ***************************************************/
llvm::hash_code hash_value(const OpRef& op) {
  return std::hash<OpRef>()(op);
}

llvm::hash_code hash_value(const Operation& op) {
  std::size_t hash = llvm::hash_combine(
      op.opcode(), op.type(),
      llvm::hash_combine_range(op.operands_.begin(), op.operands_.end()));
  if (op.data_)
    hash = llvm::hash_combine(*op.data_);

  return hash;
}
llvm::hash_code hash_value(const Symbol& symbol) {
  return std::visit(
      [&](const auto& v) {
        return llvm::hash_combine(symbol.value_.index(), v);
      },
      symbol.value_);
}

} // namespace caffeine
