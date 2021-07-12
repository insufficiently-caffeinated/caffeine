#include "caffeine/IR/Operation.h"
#include "Operation.h"
#include "caffeine/IR/Type.h"
#include "caffeine/IR/Value.h"
#include "caffeine/Support/Macros.h"

#include <boost/algorithm/string.hpp>
#include <boost/container_hash/hash.hpp>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <immer/vector_transient.hpp>
#include <llvm/ADT/Hashing.h>
#include <llvm/Support/raw_ostream.h>

#define SIZE_BITS (sizeof(size_t) * CHAR_BIT)

namespace caffeine {

#define ASSERT_SAME_TYPES_2(v1, v2)                                            \
  ASSERT_SAME_TYPES_3(v1, v2, "arguments had different types")
#define ASSERT_SAME_TYPES_3(t1, t2, msg)                                       \
  CAFFEINE_ASSERT((t1) == (t2), fmt::format("{}: {} != {}", (msg), (t1), (t2)))
#define ASSERT_SAME_TYPES(...)                                                 \
  CAFFEINE_INVOKE_NUMBERED(ASSERT_SAME_TYPES_, __VA_ARGS__)

Operation::Operation() : opcode_(Invalid), type_(Type::void_ty()) {}

Operation::Operation(Opcode op, Type t, const Inner& inner)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(inner) {}
Operation::Operation(Opcode op, Type t, Inner&& inner)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(std::move(inner)) {}

Operation::Operation(Opcode op, Type t)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(std::monostate()) {}

Operation::Operation(Opcode op, Type t, const OpRef* operands)
    : opcode_(static_cast<uint16_t>(op)), type_(t),
      inner_(OpVec(operands, operands + detail::opcode_nargs(opcode_))) {
  CAFFEINE_ASSERT(detail::opcode_base(opcode_) != 1,
                  "Tried to create a constant with operands");
  // Don't use this constructor to create an invalid opcode.
  // It'll mess up constructors and destructors.
  CAFFEINE_ASSERT(op != Invalid);
  // No opcodes have > 3 operands
  CAFFEINE_ASSERT(num_operands() <= 3, "Invalid opcode");
}

Operation::Operation(Opcode op, Type t, const OpRef& op0)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(OpVec{op0}) {
  CAFFEINE_ASSERT(detail::opcode_base(opcode_) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 1);
}
Operation::Operation(Opcode op, Type t, const OpRef& op0, const OpRef& op1)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(OpVec{op0, op1}) {
  CAFFEINE_ASSERT(detail::opcode_base(opcode_) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 2);
}
Operation::Operation(Opcode op, Type t, const OpRef& op0, const OpRef& op1,
                     const OpRef& op2)
    : opcode_(static_cast<uint16_t>(op)), type_(t),
      inner_(OpVec{op0, op1, op2}) {
  CAFFEINE_ASSERT(detail::opcode_base(opcode_) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 3);
}

Operation::Operation(const Operation& op)
    : std::enable_shared_from_this<Operation>(), opcode_(op.opcode_),
      type_(op.type_), inner_(op.inner_) {
  copy_vtable(op);
}
Operation::Operation(Operation&& op) noexcept
    : std::enable_shared_from_this<Operation>(), opcode_(op.opcode_),
      type_(op.type_), inner_(std::move(op.inner_)) {
  copy_vtable(op);
}

Operation& Operation::operator=(const Operation& op) {
  // Do inner first for exception safety.
  inner_ = op.inner_;
  type_ = op.type_;
  opcode_ = op.opcode_;

  copy_vtable(op);

  return *this;
}
Operation& Operation::operator=(Operation&& op) noexcept {
  inner_ = std::move(op.inner_);
  type_ = op.type_;
  opcode_ = op.opcode_;

  copy_vtable(op);

  return *this;
}

bool Operation::operator==(const Operation& op) const {
  if (opcode_ != op.opcode_ || type_ != op.type_)
    return false;

  return std::visit(
      [](const auto& a, const auto& b) {
        if constexpr (!std::is_same_v<std::decay_t<decltype(a)>,
                                      std::decay_t<decltype(b)>>) {
          return false;
        } else if constexpr (std::is_same_v<std::decay_t<decltype(a)>,
                                            llvm::APFloat>) {
          return a.bitwiseIsEqual(b);
        } else {
          return a == b;
        }
      },
      inner_, op.inner_);
}
bool Operation::operator!=(const Operation& op) const {
  return !(*this == op);
}

OpRef Operation::with_new_operands(llvm::ArrayRef<OpRef> operands) const {
  CAFFEINE_ASSERT(operands.size() == num_operands());

  if (num_operands() == 0)
    return into_ref();

  auto my_operands = std::get<OpVec>(inner_);
  bool equal = std::equal(std::begin(my_operands), std::end(my_operands),
                          std::begin(operands), std::end(operands));

  if (equal)
    return into_ref();

  Operation next{(Opcode)opcode(), type(), operands.data()};
  next.copy_vtable(*this);
  return constant_fold(std::move(next));
}

std::string_view Operation::opcode_name() const {
  return opcode_name(static_cast<Opcode>(opcode()));
}
std::string_view Operation::opcode_name(Opcode op) {
#ifdef MAGIC_ENUM_SUPPORTED
  std::string_view name = magic_enum::enum_name(op);

  if (name.empty())
    return "Unknown";

  if (boost::algorithm::starts_with(name, "ICmp"))
    return "ICmp";
  if (boost::algorithm::starts_with(name, "FCmp"))
    return "FCmp";

  return name;
#else
  return "<unsupported>";
#endif
}

template <typename T, typename... Ts>
static std::ostream& print_spaced(std::ostream& os, const T& first,
                                  const Ts&... values) {
  os << first;
  (..., (os << ' ' << values));
  return os;
}

template <typename... Ts>
static std::ostream& print_cons(std::ostream& os, const Ts&... values) {
  static_assert(sizeof...(Ts) != 0);

  if constexpr (sizeof...(Ts) == 1) {
    (os << ... << values);
    return os;
  } else {
    return print_spaced(os << '(', values...) << ')';
  }
}

std::ostream& operator<<(std::ostream& os, const Operation& op) {
  if (const auto* constant = llvm::dyn_cast<Constant>(&op)) {
    if (constant->is_named())
      return print_cons(os, "const", constant->name());
    return print_cons(os, "const", constant->number());
  }

  if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op)) {
    return print_cons(os, op.type(), constant->value().toString(10, false));
  }

  if (const auto* constant = llvm::dyn_cast<ConstantFloat>(&op)) {
    std::string s;
    llvm::raw_string_ostream o(s);
    constant->value().print(o);
    return print_cons(os, op.type(), s);
  }

  if (const auto* function = llvm::dyn_cast<FunctionObject>(&op)) {
    return print_cons(os, "function", function->function()->getName().str());
  }

  std::string name(op.opcode_name());
  std::transform(name.begin(), name.end(), name.begin(),
                 [](char c) { return std::tolower(c); });

  if (const auto* icmp = llvm::dyn_cast<ICmpOp>(&op)) {
    std::string_view cmp = magic_enum::enum_name(icmp->comparison());

    if (cmp.empty())
      cmp = "<unknown>";

    name.push_back('.');
    name += cmp;
  }

  if (const auto* fcmp = llvm::dyn_cast<FCmpOp>(&op)) {
    std::string_view cmp = magic_enum::enum_name(fcmp->comparison());

    if (cmp.empty())
      cmp = "<unknown>";

    name.push_back('.');
    name += cmp;
  }

  os << '(' << name;
  size_t nops = op.num_operands();
  for (size_t i = 0; i < nops; ++i) {
    os << ' ' << op[i];
  }
  return os << ')';
}
std::ostream& operator<<(std::ostream& os, Operation::Opcode opcode) {
  switch (opcode) {
#define HANDLE_OP(opcode, opname, opclass)                                     \
  case Operation::opcode:                                                      \
    return os << #opcode;
#include "caffeine/IR/Operation.def"

  default:
    return os << "Unknown(" << (uint16_t)opcode << ")";
  }
}

/***************************************************
 * Symbol                                          *
 ***************************************************/
Symbol::Symbol(const std::string& name)
    : value_(StringInterner::default_interner().intern(name)) {}
Symbol::Symbol(std::string&& name)
    : value_(StringInterner::default_interner().intern(std::move(name))) {}
Symbol::Symbol(std::string_view name)
    : value_(StringInterner::default_interner().intern(name)) {}
Symbol::Symbol(uint64_t number) : value_(number) {}

std::ostream& operator<<(std::ostream& os, const Symbol& symbol) {
  if (symbol.is_named())
    return os << symbol.name();
  return os << symbol.number();
}

/***************************************************
 * Constant                                        *
 ***************************************************/
Constant::Constant(Type t, const Symbol& symbol)
    : Operation(op_for_symbol(symbol), t, ConstantData(symbol, nullptr)) {}
Constant::Constant(Type t, Symbol&& symbol)
    : Operation(op_for_symbol(symbol), t,
                ConstantData(std::move(symbol), nullptr)) {}

OpRef Constant::Create(Type t, const Symbol& symbol) {
  return OpRef(new Constant(t, symbol));
}
OpRef Constant::Create(Type t, Symbol&& symbol) {
  return OpRef(new Constant(t, std::move(symbol)));
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
    : Operation(Opcode::ConstantInt, Type::type_of(iconst), iconst) {}
ConstantInt::ConstantInt(llvm::APInt&& iconst)
    : Operation(Opcode::ConstantInt, Type::type_of(iconst), std::move(iconst)) {
}

Value ConstantInt::as_value() const {
  return Value(value());
}

OpRef ConstantInt::Create(const llvm::APInt& iconst) {
  return OpRef(new ConstantInt(iconst));
}
OpRef ConstantInt::Create(llvm::APInt&& iconst) {
  return OpRef(new ConstantInt(iconst));
}
OpRef ConstantInt::Create(bool value) {
  return ConstantInt::Create(llvm::APInt(1, static_cast<uint64_t>(value)));
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
    : Operation(Operation::ConstantFloat, Type::type_of(fconst), fconst) {}
ConstantFloat::ConstantFloat(llvm::APFloat&& fconst)
    : Operation(Operation::ConstantFloat, Type::type_of(fconst),
                std::move(fconst)) {}

OpRef ConstantFloat::Create(const llvm::APFloat& fconst) {
  return OpRef(new ConstantFloat(fconst));
}
OpRef ConstantFloat::Create(llvm::APFloat&& fconst) {
  return OpRef(new ConstantFloat(fconst));
}
OpRef ConstantFloat::Create(double value) {
  return OpRef(new ConstantFloat(llvm::APFloat(value)));
}

/***************************************************
 * ConstantArray                                   *
 ***************************************************/
ConstantArray::ConstantArray(Symbol&& symbol, const OpRef& size)
    : ArrayBase(Operation::ConstantArray,
                Type::array_ty(size->type().bitwidth()),
                ConstantData(std::move(symbol), size)) {}

OpRef ConstantArray::Create(const Symbol& symbol, const OpRef& size) {
  return Create(Symbol(symbol), size);
}
OpRef ConstantArray::Create(Symbol&& symbol, const OpRef& size) {
  CAFFEINE_ASSERT(size->type().is_int());

  return OpRef(new ConstantArray(std::move(symbol), size));
}

OpRef ConstantArray::with_new_operands(llvm::ArrayRef<OpRef> operands) const {
  CAFFEINE_ASSERT(operands.size() == 1);

  if (size() == operands[0])
    return into_ref();

  return Create(symbol(), operands[0]);
}

/***************************************************
 * BinaryOp                                        *
 ***************************************************/
BinaryOp::BinaryOp(Opcode op, Type t, const OpRef& lhs, const OpRef& rhs)
    : Operation(op, t, lhs, rhs) {}

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
    : Operation(op, t, operand) {}

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
    : Operation(Opcode::Select, t, cond, true_val, false_val) {}

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
  return ICmpOp::CreateICmp(cmp, rhs, lhs);
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
    : ArrayBase(Opcode::Alloc, Type::array_ty(size->type().bitwidth()), size,
                defaultval) {}

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
    : Operation(Opcode::Load, Type::int_ty(8), data, offset) {}

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
    : ArrayBase(Opcode::Store, data->type(), data, offset, value) {}

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
Undef::Undef(const Type& t) : Operation(Opcode::Undef, t) {}

OpRef Undef::Create(const Type& t) {
  return constant_fold(Undef(t));
}

/***************************************************
 * FixedArray                                      *
 ***************************************************/
FixedArray::FixedArray(Type t, const PersistentArray<OpRef>& data)
    : ArrayBase(Operation::FixedArray, t, data) {}

OpRef FixedArray::with_new_operands(llvm::ArrayRef<OpRef> operands) const {
  CAFFEINE_ASSERT(operands.size() == num_operands());

  if (num_operands() == 0)
    return into_ref();

  bool equal = std::equal(std::begin(operands), std::end(operands),
                          std::begin(data()), std::end(data()));

  if (equal)
    return into_ref();

  auto transient = data().inner().transient();
  for (size_t i = 0; i < operands.size(); ++i) {
    if (transient[i] != operands[i])
      transient.set(i, operands[i]);
  }

  return OpRef(
      new FixedArray(type(), PersistentArray<OpRef>(transient.persistent())));
}

OpRef FixedArray::Create(Type index_ty, const PersistentArray<OpRef>& data) {
  CAFFEINE_ASSERT(index_ty.is_int());
  CAFFEINE_ASSERT(
      index_ty.bitwidth() >= ilog2(data.size()),
      "Index bitwidth is not large enough to address entire constant array");

  return constant_fold(FixedArray(Type::array_ty(index_ty.bitwidth()), data));
}
OpRef FixedArray::Create(Type index_ty, const OpRef& value, size_t size) {
  return FixedArray::Create(
      index_ty, PersistentArray<OpRef>(std::vector<OpRef>(size, value)));
}

/***************************************************
 * FunctionObject                                  *
 ***************************************************/
FunctionObject::FunctionObject(llvm::Function* function)
    : Operation(Operation::FunctionObject, Type::from_llvm(function->getType()),
                function) {}

llvm::Function* FunctionObject::function() const {
  return std::get<llvm::Function*>(inner_);
}

OpRef FunctionObject::Create(llvm::Function* function) {
  CAFFEINE_ASSERT(function != nullptr);

  return constant_fold(FunctionObject(function));
}

/***************************************************
 * hashing implementations                         *
 ***************************************************/
static llvm::hash_code hash_value(const OpRef& op) {
  return std::hash<OpRef>()(op);
}

llvm::hash_code hash_value(const Operation& op) {
  std::size_t hash = llvm::hash_combine(op.opcode(), op.type());

  return std::visit(
      [&](const auto& v) {
        using type = std::decay_t<decltype(v)>;

        if constexpr (std::is_same_v<type, Operation::OpVec>) {
          return llvm::hash_combine(
              hash, llvm::hash_combine_range(v.begin(), v.end()));
        } else if constexpr (std::is_same_v<type, std::monostate>) {
          return llvm::hash_combine(hash, std::hash<type>()(v));
        } else {
          return llvm::hash_combine(hash, v);
        }
      },
      op.inner_);
}
llvm::hash_code hash_value(const Symbol& symbol) {
  return std::visit(
      [&](const auto& v) {
        return llvm::hash_combine(symbol.value_.index(), v);
      },
      symbol.value_);
}

} // namespace caffeine
