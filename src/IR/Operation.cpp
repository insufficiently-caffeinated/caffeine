#include "caffeine/IR/Operation.h"
#include "Operation.h"
#include "caffeine/IR/Type.h"

#include <boost/container_hash/hash.hpp>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/ADT/Hashing.h>
#include <llvm/Support/raw_ostream.h>

// TODO: We should put this in a config file
#define CAFFEINE_IMPLICIT_CONSTANT_FOLDING 1

namespace caffeine {

#define ASSERT_SAME_TYPES(v1, v2)                                              \
  CAFFEINE_ASSERT((v1)->type() == (v2)->type(),                                \
                  fmt::format("arguments had different types: {} != {}",       \
                              (v1)->type(), (v2)->type()))

Operation::Operation() : opcode_(Invalid), type_(Type::void_ty()) {}

Operation::Operation(Opcode op, Type t, const Inner& inner)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(inner) {}
Operation::Operation(Opcode op, Type t, Inner&& inner)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(std::move(inner)) {}

Operation::Operation(Opcode op, Type t)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(std::monostate()) {}

Operation::Operation(Opcode op, Type t, ref<Operation>* operands)
    : opcode_(static_cast<uint16_t>(op)), type_(t),
      inner_(OpVec(operands, operands + (opcode_ & 0x3))) {
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  // Don't use this constructor to create an invalid opcode.
  // It'll mess up constructors and destructors.
  CAFFEINE_ASSERT(op != Invalid);
  // No opcodes have > 3 operands
  CAFFEINE_ASSERT(num_operands() <= 3, "Invalid opcode");
}

Operation::Operation(Opcode op, Type t, const ref<Operation>& op0)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(OpVec{op0}) {
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 1);
}
Operation::Operation(Opcode op, Type t, const ref<Operation>& op0,
                     const ref<Operation>& op1)
    : opcode_(static_cast<uint16_t>(op)), type_(t), inner_(OpVec{op0, op1}) {
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 2);
}
Operation::Operation(Opcode op, Type t, const ref<Operation>& op0,
                     const ref<Operation>& op1, const ref<Operation>& op2)
    : opcode_(static_cast<uint16_t>(op)), type_(t),
      inner_(OpVec{op0, op1, op2}) {
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 3);
}

Operation::Operation(const Operation& op)
    : opcode_(op.opcode_), refcount(0), type_(op.type_), inner_(op.inner_) {}
Operation::Operation(Operation&& op) noexcept
    : opcode_(op.opcode_), refcount(0), type_(op.type_),
      inner_(std::move(op.inner_)) {}

Operation& Operation::operator=(const Operation& op) {
  // Do inner first for exception safety.
  inner_ = op.inner_;
  type_ = op.type_;
  opcode_ = op.opcode_;

  return *this;
}
Operation& Operation::operator=(Operation&& op) noexcept {
  inner_ = std::move(op.inner_);
  type_ = op.type_;
  opcode_ = op.opcode_;

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

const char* Operation::opcode_name() const {
  return opcode_name(static_cast<Opcode>(opcode()));
}
const char* Operation::opcode_name(Opcode op) {
  // clang-format off
  switch (op) {
  case Invalid:       return "Invalid";
  case ConstantNumbered:
  case ConstantNamed: return "Constant";
  case ConstantInt:   return "ConstantInt";
  case ConstantFloat: return "ConstantFloat";
  case ConstantArray: return "ConstantArray";
  case Undef:         return "Undef";

  case Add:   return "Add";
  case Sub:   return "Sub";
  case Mul:   return "Mul";
  case UDiv:  return "UDiv";
  case SDiv:  return "SDiv";
  case URem:  return "URem";
  case SRem:  return "SRem";
  case And:   return "And";
  case Or:    return "Or";
  case Xor:   return "Xor";
  case Shl:   return "Shl";
  case LShr:  return "LShr";
  case AShr:  return "AShr";
  case Not:   return "Not";

  case FAdd:    return "FAdd";
  case FSub:    return "FSub";
  case FMul:    return "FMul";
  case FDiv:    return "FDiv";
  case FRem:    return "FRem";
  case FNeg:    return "FNeg";
  case FIsNaN:  return "FIsNaN";

  case Trunc:   return "Trunc";
  case SExt:    return "SExt";
  case ZExt:    return "ZExt";
  case FpTrunc: return "FpTrunc";
  case FpExt:   return "FpExt";
  case FpToUI:  return "FpToUI";
  case FpToSI:  return "FpToSI";
  case UIToFp:  return "UIToFp";
  case SIToFp:  return "SIToFp";
  case Bitcast: return "Bitcast";

  case ICmpEq:
  case ICmpNe:
  case ICmpUgt:
  case ICmpUge:
  case ICmpUlt:
  case ICmpUle:
  case ICmpSgt:
  case ICmpSge:
  case ICmpSlt:
  case ICmpSle:
    return "ICmp";

  case FCmpEq:
  case FCmpGt:
  case FCmpGe:
  case FCmpLt:
  case FCmpLe:
  case FCmpNe:
    return "FCmp";

  case Select: return "Select";

  case Alloc: return "Alloc";
  case Load:  return "Load";
  case Store: return "Store";

  // Silence warnings here
  case UnaryOpLast:
  case BinaryOpLast:
    break;
  }
  // clang-format on
  return "Unknown";
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

  std::string name = op.opcode_name();
  std::transform(name.begin(), name.end(), name.begin(),
                 [](char c) { return std::tolower(c); });

  if (const auto* icmp = llvm::dyn_cast<ICmpOp>(&op)) {
    const char* cmp = "<unknown>";
    switch (icmp->comparison()) {
    // clang-format off
    case ICmpOpcode::EQ:  cmp = "eq";  break;
    case ICmpOpcode::NE:  cmp = "ne";  break;
    case ICmpOpcode::UGT: cmp = "ugt"; break;
    case ICmpOpcode::UGE: cmp = "uge"; break;
    case ICmpOpcode::ULT: cmp = "ult"; break;
    case ICmpOpcode::ULE: cmp = "ule"; break;
    case ICmpOpcode::SGT: cmp = "sgt"; break;
    case ICmpOpcode::SGE: cmp = "sge"; break;
    case ICmpOpcode::SLT: cmp = "slt"; break;
    case ICmpOpcode::SLE: cmp = "sle"; break;
      // clang-format on
    }

    name.push_back('.');
    name += cmp;
  }

  if (const auto* fcmp = llvm::dyn_cast<FCmpOp>(&op)) {
    const char* cmp = "<unknown>";
    switch (fcmp->comparison()) {
    // clang-format off
    case FCmpOpcode::EQ: cmp = "oeq"; break;
    case FCmpOpcode::GT: cmp = "ogt"; break;
    case FCmpOpcode::GE: cmp = "oge"; break;
    case FCmpOpcode::LT: cmp = "olt"; break;
    case FCmpOpcode::LE: cmp = "ole"; break;
    case FCmpOpcode::NE: cmp = "one"; break;
      // clang-format on
    }

    name.push_back('.');
    name += cmp;
  }

  switch (op.num_operands()) {
  case 0:
    return print_cons(os, name);
  case 1:
    return print_cons(os, name, op[0]);
  case 2:
    return print_cons(os, name, op[0], op[1]);
  case 3:
    return print_cons(os, name, op[0], op[1], op[2]);
  }

  CAFFEINE_UNREACHABLE();
}

/***************************************************
 * Constant                                        *
 ***************************************************/
Constant::Constant(Type t, const std::string& name)
    : Operation(ConstantNamed, t, name) {}
Constant::Constant(Type t, std::string&& name)
    : Operation(ConstantNamed, t, std::move(name)) {}
Constant::Constant(Type t, uint64_t number)
    : Operation(ConstantNumbered, t, number) {}

ref<Operation> Constant::Create(Type t, const std::string& name) {
  CAFFEINE_ASSERT(!name.empty(), "cannot create constant with empty name");

  return ref<Operation>(new Constant(t, name));
}
ref<Operation> Constant::Create(Type t, std::string&& name) {
  CAFFEINE_ASSERT(!name.empty(), "cannot create constant with empty name");

  return ref<Operation>(new Constant(t, std::move(name)));
}
ref<Operation> Constant::Create(Type t, uint64_t number) {
  return ref<Operation>(new Constant(t, number));
}

/***************************************************
 * ConstantInt                                     *
 ***************************************************/
ConstantInt::ConstantInt(const llvm::APInt& iconst)
    : Operation(Opcode::ConstantInt, Type::type_of(iconst), iconst) {}
ConstantInt::ConstantInt(llvm::APInt&& iconst)
    : Operation(Opcode::ConstantInt, Type::type_of(iconst), std::move(iconst)) {
}

ref<Operation> ConstantInt::Create(const llvm::APInt& iconst) {
  return ref<Operation>(new ConstantInt(iconst));
}
ref<Operation> ConstantInt::Create(llvm::APInt&& iconst) {
  return ref<Operation>(new ConstantInt(iconst));
}
ref<Operation> ConstantInt::Create(bool value) {
  return ConstantInt::Create(llvm::APInt(1, static_cast<uint64_t>(value)));
}

/***************************************************
 * ConstantFloat                                   *
 ***************************************************/
ConstantFloat::ConstantFloat(const llvm::APFloat& fconst)
    : Operation(Operation::ConstantFloat, Type::type_of(fconst), fconst) {}
ConstantFloat::ConstantFloat(llvm::APFloat&& fconst)
    : Operation(Operation::ConstantFloat, Type::type_of(fconst),
                std::move(fconst)) {}

ref<Operation> ConstantFloat::Create(const llvm::APFloat& fconst) {
  return ref<Operation>(new ConstantFloat(fconst));
}
ref<Operation> ConstantFloat::Create(llvm::APFloat&& fconst) {
  return ref<Operation>(new ConstantFloat(fconst));
}
ref<Operation> ConstantFloat::Create(double value) {
  return ref<Operation>(new ConstantFloat(llvm::APFloat(value)));
}

/***************************************************
 * ConstantArray                                   *
 ***************************************************/
ConstantArray::ConstantArray(Type t, const SharedArray& array)
    : Operation(Opcode::ConstantArray, t, array) {}
ConstantArray::ConstantArray(Type t, SharedArray&& array)
    : Operation(Opcode::ConstantArray, t, std::move(array)) {}

ref<Operation> ConstantArray::Create(Type index_ty, const SharedArray& array) {
  CAFFEINE_ASSERT(index_ty.is_int(),
                  "Arrays cannot be indexed by non-integer types");
  CAFFEINE_ASSERT(
      index_ty.bitwidth() >= ilog2(array.size()),
      "Index bitwidth is not large enough to address entire constant array");

  return ref<Operation>(
      new ConstantArray(Type::array_ty(index_ty.bitwidth()), array));
}
ref<Operation> ConstantArray::Create(Type index_ty, SharedArray&& array) {
  CAFFEINE_ASSERT(index_ty.is_int(),
                  "Arrays cannot be indexed by non-integer types");
  CAFFEINE_ASSERT(
      index_ty.bitwidth() >= ilog2(array.size()),
      "Index bitwidth is not large enough to address entire constant array");

  return ref<Operation>(
      new ConstantArray(Type::array_ty(index_ty.bitwidth()), std::move(array)));
}

/***************************************************
 * BinaryOp                                        *
 ***************************************************/
BinaryOp::BinaryOp(Opcode op, Type t, const ref<Operation>& lhs,
                   const ref<Operation>& rhs)
    : Operation(op, t, lhs, rhs) {}

ref<Operation> BinaryOp::Create(Opcode op, const ref<Operation>& lhs,
                                const ref<Operation>& rhs) {
  CAFFEINE_ASSERT((op & 0x3) == 2, "Opcode doesn't have 2 operands");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(
      lhs->type() == rhs->type(),
      fmt::format(
          FMT_STRING(
              "BinaryOp created from operands with different types: {} != {}"),
          lhs->type(), rhs->type()));

  return ref<Operation>(new BinaryOp(op, lhs->type(), lhs, rhs));
}

#define ASSERT_INT(op) CAFFEINE_ASSERT((op)->type().is_int())
#define ASSERT_FP(op) CAFFEINE_ASSERT((op)->type().is_float())

// There's a lot of these so template them out using a macro
#define DECL_BINOP_CREATE(opcode, assert)                                      \
  ref<Operation> BinaryOp::Create##opcode(const ref<Operation>& lhs,           \
                                          const ref<Operation>& rhs) {         \
    CAFFEINE_ASSERT(lhs, "lhs was null");                                      \
    CAFFEINE_ASSERT(rhs, "rhs was null");                                      \
    assert(lhs);                                                               \
    assert(rhs);                                                               \
                                                                               \
    return Create(Opcode::opcode, lhs, rhs);                                   \
  }                                                                            \
  static_assert(true)

ref<Operation> BinaryOp::CreateAdd(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (lhs->is<caffeine::Undef>() || rhs->is<caffeine::Undef>())
    return Undef::Create(lhs->type());

  if (is_constant_int(*lhs, 0))
    return rhs;
  if (is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() + rhs_int->value());

  return Create(Opcode::Add, lhs, rhs);
}
ref<Operation> BinaryOp::CreateSub(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);
  ASSERT_SAME_TYPES(lhs, rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (lhs->is<caffeine::Undef>() || rhs->is<caffeine::Undef>())
    return Undef::Create(lhs->type());

  if (is_constant_int(*rhs, 0))
    return lhs;

  if (rhs.get() == lhs.get())
    return ConstantInt::Create(llvm::APInt(lhs->type().bitwidth(), 0));

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() - rhs_int->value());
#endif

  return Create(Opcode::Sub, lhs, rhs);
}
ref<Operation> BinaryOp::CreateMul(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 0))
    return rhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() * rhs_int->value());
#endif

  return Create(Opcode::Mul, lhs, rhs);
}
ref<Operation> BinaryOp::CreateUDiv(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 1))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().udiv(rhs_int->value()));
#endif

  return Create(Opcode::UDiv, lhs, rhs);
}
ref<Operation> BinaryOp::CreateSDiv(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 1) && rhs->type().bitwidth() > 1)
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().sdiv(rhs_int->value()));
#endif

  return Create(Opcode::SDiv, lhs, rhs);
}
ref<Operation> BinaryOp::CreateURem(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 1))
    return ConstantInt::Create(llvm::APInt(lhs->type().bitwidth(), 0));

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().urem(rhs_int->value()));
#endif

  return Create(Opcode::URem, lhs, rhs);
}
ref<Operation> BinaryOp::CreateSRem(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 1) && rhs->type().bitwidth() > 1)
    return ConstantInt::Create(llvm::APInt(lhs->type().bitwidth(), 0));

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().srem(rhs_int->value()));
#endif

  return Create(Opcode::SRem, lhs, rhs);
}

ref<Operation> BinaryOp::CreateAnd(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 0))
    return rhs;

  if (is_constant_ones(*lhs))
    return rhs;
  if (is_constant_ones(*rhs))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() & rhs_int->value());
#endif

  return Create(Opcode::And, lhs, rhs);
}
ref<Operation> BinaryOp::CreateOr(const ref<Operation>& lhs,
                                  const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0))
    return rhs;
  if (is_constant_int(*rhs, 0))
    return lhs;

  if (is_constant_ones(*lhs))
    return lhs;
  if (is_constant_ones(*rhs))
    return rhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() | rhs_int->value());
#endif

  return Create(Opcode::Or, lhs, rhs);
}
ref<Operation> BinaryOp::CreateXor(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (lhs->is<caffeine::Undef>() || rhs->is<caffeine::Undef>())
    return Undef::Create(lhs->type());

  if (is_constant_int(*lhs, 0))
    return rhs;
  if (is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() ^ rhs_int->value());
#endif

  return Create(Opcode::Xor, lhs, rhs);
}
ref<Operation> BinaryOp::CreateShl(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() << rhs_int->value());
#endif

  return Create(Opcode::Shl, lhs, rhs);
}
ref<Operation> BinaryOp::CreateLShr(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().lshr(rhs_int->value()));
#endif

  return Create(Opcode::LShr, lhs, rhs);
}
ref<Operation> BinaryOp::CreateAShr(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().ashr(rhs_int->value()));
#endif

  return Create(Opcode::AShr, lhs, rhs);
}

ref<Operation> BinaryOp::CreateFAdd(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_FP(lhs);
  ASSERT_FP(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(lhs.get());
  const auto* rhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(rhs.get());

  if (lhs_float && rhs_float) {
    return caffeine::ConstantFloat::Create(lhs_float->value() +
                                           rhs_float->value());
  }
#endif

  return Create(Opcode::FAdd, lhs, rhs);
}

ref<Operation> BinaryOp::CreateFSub(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_FP(lhs);
  ASSERT_FP(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(lhs.get());
  const auto* rhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(rhs.get());

  if (lhs_float && rhs_float) {
    return caffeine::ConstantFloat::Create(lhs_float->value() -
                                           rhs_float->value());
  }
#endif

  return Create(Opcode::FSub, lhs, rhs);
}

ref<Operation> BinaryOp::CreateFMul(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_FP(lhs);
  ASSERT_FP(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(lhs.get());
  const auto* rhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(rhs.get());

  if (lhs_float && rhs_float) {
    return caffeine::ConstantFloat::Create(lhs_float->value() *
                                           rhs_float->value());
  }
#endif

  return Create(Opcode::FMul, lhs, rhs);
}

ref<Operation> BinaryOp::CreateFDiv(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_FP(lhs);
  ASSERT_FP(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(lhs.get());
  const auto* rhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(rhs.get());

  if (lhs_float && rhs_float) {
    return caffeine::ConstantFloat::Create(lhs_float->value() /
                                           rhs_float->value());
  }
#endif

  return Create(Opcode::FDiv, lhs, rhs);
}

ref<Operation> BinaryOp::CreateFRem(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_FP(lhs);
  ASSERT_FP(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(lhs.get());
  const auto* rhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(rhs.get());

  if (lhs_float && rhs_float) {
    return caffeine::ConstantFloat::Create(
        fmod(lhs_float->value().convertToFloat(),
             rhs_float->value().convertToFloat()));
  }
#endif

  return Create(Opcode::FRem, lhs, rhs);
}

#define DEF_INT_BINOP_CONST_CREATE_DETAIL(opcode, ty, signed)                  \
  ref<Operation> BinaryOp::Create##opcode(const ref<Operation>& lhs, ty rhs) { \
    CAFFEINE_ASSERT(lhs, "lhs is null");                                       \
    CAFFEINE_ASSERT(lhs->type().is_int());                                     \
                                                                               \
    return BinaryOp::Create##opcode(                                           \
        lhs, ConstantInt::Create(                                              \
                 llvm::APInt(lhs->type().bitwidth(), rhs, signed)));           \
  }                                                                            \
  ref<Operation> BinaryOp::Create##opcode(ty lhs, const ref<Operation>& rhs) { \
    CAFFEINE_ASSERT(rhs, "rhs is null");                                       \
    CAFFEINE_ASSERT(rhs->type().is_int());                                     \
                                                                               \
    return BinaryOp::Create##opcode(                                           \
        ConstantInt::Create(llvm::APInt(rhs->type().bitwidth(), lhs, signed)), \
        rhs);                                                                  \
  }                                                                            \
  static_assert(true)

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
UnaryOp::UnaryOp(Opcode op, Type t, const ref<Operation>& operand)
    : Operation(op, t, operand) {}

ref<Operation> UnaryOp::Create(Opcode op, const ref<Operation>& operand) {
  return Create(op, operand, operand->type());
}

ref<Operation> UnaryOp::Create(Opcode op, const ref<Operation>& operand,
                               Type returnType) {
  CAFFEINE_ASSERT(operand, "operand was null");
  CAFFEINE_ASSERT((op & 0x3) == 1, "Opcode doesn't have 2 operands");

  return ref<Operation>(new UnaryOp(op, returnType, operand));
}

#define DECL_UNOP_CREATE(opcode, assert, return_type)                          \
  ref<Operation> UnaryOp::Create##opcode(const ref<Operation>& operand) {      \
    assert(operand);                                                           \
                                                                               \
    return Create(Opcode::opcode, operand, return_type);                       \
  }

ref<Operation> UnaryOp::CreateNot(const ref<Operation>& operand) {
  ASSERT_INT(operand);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(~op->value());
#endif

  return Create(Opcode::Not, operand);
}

DECL_UNOP_CREATE(FNeg, ASSERT_FP, operand->type());
DECL_UNOP_CREATE(FIsNaN, ASSERT_FP, Type::int_ty(1));

ref<Operation> UnaryOp::CreateTrunc(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() < operand->type().bitwidth());

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (llvm::isa<caffeine::Undef>(operand.get()))
    return Undef::Create(tgt);

  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(op->value().trunc(tgt.bitwidth()));
#endif

  return ref<Operation>(new UnaryOp(Opcode::Trunc, tgt, operand));
}
ref<Operation> UnaryOp::CreateZExt(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() > operand->type().bitwidth());

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(op->value().zext(tgt.bitwidth()));
#endif

  return ref<Operation>(new UnaryOp(Opcode::ZExt, tgt, operand));
}
ref<Operation> UnaryOp::CreateSExt(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() > operand->type().bitwidth());

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (llvm::isa<caffeine::Undef>(operand.get()))
    return Undef::Create(tgt);

  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(op->value().sext(tgt.bitwidth()));
#endif

  return ref<Operation>(new UnaryOp(Opcode::SExt, tgt, operand));
}
ref<Operation> UnaryOp::CreateFpTrunc(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_float());
  CAFFEINE_ASSERT(tgt.exponent_bits() < operand->type().exponent_bits() &&
                  tgt.mantissa_bits() < operand->type().mantissa_bits());

  return ref<Operation>(new UnaryOp(Opcode::FpTrunc, tgt, operand));
}
ref<Operation> UnaryOp::CreateFpExt(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_float());
  CAFFEINE_ASSERT(tgt.exponent_bits() > operand->type().exponent_bits() &&
                  tgt.mantissa_bits() > operand->type().mantissa_bits());

  return ref<Operation>(new UnaryOp(Opcode::FpExt, tgt, operand));
}
ref<Operation> UnaryOp::CreateFpToUI(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_float());

  return ref<Operation>(new UnaryOp(Opcode::FpToUI, tgt, operand));
}
ref<Operation> UnaryOp::CreateFpToSI(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_float());

  return ref<Operation>(new UnaryOp(Opcode::FpToSI, tgt, operand));
}
ref<Operation> UnaryOp::CreateUIToFp(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_int());

  return ref<Operation>(new UnaryOp(Opcode::UIToFp, tgt, operand));
}
ref<Operation> UnaryOp::CreateSIToFp(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_int());

  return ref<Operation>(new UnaryOp(Opcode::SIToFp, tgt, operand));
}
ref<Operation> UnaryOp::CreateBitcast(Type tgt, const ref<Operation>& operand) {
  // TODO: Validate sizes if possible.
  // CAFFEINE_ASSERT(tgt.byte_size() == operand->type().byte_size());

  return ref<Operation>(new UnaryOp(Opcode::Bitcast, tgt, operand));
}

ref<Operation> UnaryOp::CreateTruncOrZExt(Type tgt,
                                          const ref<Operation>& operand) {
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.is_int());

  if (tgt.bitwidth() < operand->type().bitwidth())
    return CreateTrunc(tgt, operand);
  if (tgt.bitwidth() > operand->type().bitwidth())
    return CreateZExt(tgt, operand);
  return operand;
}
ref<Operation> UnaryOp::CreateTruncOrSExt(Type tgt,
                                          const ref<Operation>& operand) {
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
SelectOp::SelectOp(Type t, const ref<Operation>& cond,
                   const ref<Operation>& true_val,
                   const ref<Operation>& false_val)
    : Operation(Opcode::Select, t, cond, true_val, false_val) {}

ref<Operation> SelectOp::Create(const ref<Operation>& cond,
                                const ref<Operation>& true_value,
                                const ref<Operation>& false_value) {
  CAFFEINE_ASSERT(cond, "cond was null");
  CAFFEINE_ASSERT(true_value, "true_value was null");
  CAFFEINE_ASSERT(false_value, "false_value was null");

  CAFFEINE_ASSERT(
      cond->type() == Type::int_ty(1),
      fmt::format("select condition was not an i1, it was {}", cond->type()));

  CAFFEINE_ASSERT(true_value->type() == false_value->type(),
                  "select values had different types");

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (const auto* vcond = llvm::dyn_cast<caffeine::ConstantInt>(cond.get()))
    return vcond->value() == 1 ? true_value : false_value;
#endif

  return ref<Operation>(
      new SelectOp(true_value->type(), cond, true_value, false_value));
}

/***************************************************
 * ICmpOp                                          *
 ***************************************************/
ICmpOp::ICmpOp(ICmpOpcode cmp, Type t, const ref<Operation>& lhs,
               const ref<Operation>& rhs)
    : BinaryOp(static_cast<Opcode>(
                   detail::opcode(icmp_base, 2, static_cast<uint16_t>(cmp))),
               t, lhs, rhs) {}

ref<Operation> ICmpOp::CreateICmp(ICmpOpcode cmp, const ref<Operation>& lhs,
                                  const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(
      rhs->type() == lhs->type(),
      fmt::format("cannot compare icmp operands with different types: {} != {}",
                  rhs->type(), lhs->type()));
  CAFFEINE_ASSERT(lhs->type().is_int(),
                  "icmp can only be created with integer operands");

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(
        constant_int_compare(cmp, lhs_int->value(), rhs_int->value()));

  if (lhs.get() == rhs.get()) {
    if (lhs->is<caffeine::Undef>())
      return Undef::Create(Type::int_ty(1));

    switch (cmp) {
    case ICmpOpcode::EQ:
    case ICmpOpcode::ULE:
    case ICmpOpcode::SLE:
    case ICmpOpcode::UGE:
    case ICmpOpcode::SGE:
      return ConstantInt::Create(true);
    case ICmpOpcode::NE:
    case ICmpOpcode::ULT:
    case ICmpOpcode::SLT:
    case ICmpOpcode::UGT:
    case ICmpOpcode::SGT:
      return ConstantInt::Create(false);
    }
  }
#endif

  return ref<Operation>(new ICmpOp(cmp, Type::int_ty(1), lhs, rhs));
}
ref<Operation> ICmpOp::CreateICmp(ICmpOpcode cmp, int64_t lhs,
                                  const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(rhs->type().is_int(),
                  "icmp can only be created with integer operands");

  auto literal = llvm::APInt(64, static_cast<uint64_t>(lhs));
  return ICmpOp::CreateICmp(
      cmp, ConstantInt::Create(literal.sextOrTrunc(rhs->type().bitwidth())),
      rhs);
}
ref<Operation> ICmpOp::CreateICmp(ICmpOpcode cmp, const ref<Operation>& lhs,
                                  int64_t rhs) {
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
FCmpOp::FCmpOp(FCmpOpcode cmp, Type t, const ref<Operation>& lhs,
               const ref<Operation>& rhs)
    : BinaryOp(static_cast<Opcode>(
                   detail::opcode(fcmp_base, 2, static_cast<uint16_t>(cmp))),
               t, lhs, rhs) {}

ref<Operation> FCmpOp::CreateFCmp(FCmpOpcode cmp, const ref<Operation>& lhs,
                                  const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs->type() == lhs->type(),
                  "cannot compare icmp operands with different types");
  CAFFEINE_ASSERT(lhs->type().is_float(),
                  "icmp can only be created with integer operands");

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(lhs.get());
  const auto* rhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(rhs.get());

  if (lhs_float && rhs_float)
    return ConstantInt::Create(
        constant_float_compare(cmp, lhs_float->value(), rhs_float->value()));

  if (lhs.get() == rhs.get()) {
    if (lhs_float->value().isNaN())
      return lhs;

    switch (cmp) {
    case FCmpOpcode::EQ:
    case FCmpOpcode::LE:
    case FCmpOpcode::GE:
      return ConstantInt::Create(true);
    case FCmpOpcode::NE:
    case FCmpOpcode::LT:
    case FCmpOpcode::GT:
      return ConstantInt::Create(false);
    }
  }
#endif

  return ref<Operation>(new FCmpOp(cmp, Type::type_of<bool>(), lhs, rhs));
}

/***************************************************
 * AllocOp                                         *
 ***************************************************/
AllocOp::AllocOp(const ref<Operation>& size, const ref<Operation>& defaultval)
    : Operation(Opcode::Alloc, Type::array_ty(size->type().bitwidth()), size,
                defaultval) {}

ref<Operation> AllocOp::Create(const ref<Operation>& size,
                               const ref<Operation>& defaultval) {
  CAFFEINE_ASSERT(size, "size was null");
  CAFFEINE_ASSERT(defaultval, "defaultval was null");
  // To be fully correct, this should be validating that the bitwidth of size
  // is the correct one for the architecture model. Unfortunately we don't
  // have enough information here to validate that so instead we just ensure
  // that size is an integer.
  CAFFEINE_ASSERT(size->type().is_int(), "Array size must be an integer type");
  CAFFEINE_ASSERT(defaultval->type() == Type::int_ty(8));
  return ref<Operation>(new AllocOp(size, defaultval));
}

/***************************************************
 * LoadOp                                          *
 ***************************************************/
LoadOp::LoadOp(const ref<Operation>& data, const ref<Operation>& offset)
    : Operation(Opcode::Load, Type::int_ty(8), data, offset) {}

ref<Operation> LoadOp::Create(const ref<Operation>& data,
                              const ref<Operation>& offset) {
  CAFFEINE_ASSERT(data, "data was null");
  CAFFEINE_ASSERT(offset, "offset was null");
  CAFFEINE_ASSERT(offset->type().is_int(),
                  "Load offset must be a pointer-sized integer type");

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* data_arr = llvm::dyn_cast<caffeine::ConstantArray>(data.get());
  const auto* offset_int = llvm::dyn_cast<caffeine::ConstantInt>(offset.get());
  if (data_arr && offset_int &&
      offset->type().bitwidth() <= sizeof(size_t) * CHAR_BIT)
    return ConstantInt::Create(llvm::APInt(
        8, data_arr->data()[offset_int->value().getLimitedValue()]));
#endif

  return ref<Operation>(new LoadOp(data, offset));
}

/***************************************************
 * StoreOp                                         *
 ***************************************************/
StoreOp::StoreOp(const ref<Operation>& data, const ref<Operation>& offset,
                 const ref<Operation>& value)
    : Operation(Opcode::Store, data->type(), data, offset, value) {}

ref<Operation> StoreOp::Create(const ref<Operation>& data,
                               const ref<Operation>& offset,
                               const ref<Operation>& value) {
  CAFFEINE_ASSERT(data, "data was null");
  CAFFEINE_ASSERT(offset, "offset was null");
  CAFFEINE_ASSERT(value, "value was null");

  CAFFEINE_ASSERT(offset->type().is_int(),
                  "Store offset must be a pointer-size integer type");
  CAFFEINE_ASSERT(value->type() == Type::int_ty(8), "Value must be of type i8");

  return ref<Operation>(new StoreOp(data, offset, value));
}

/***************************************************
 * Undef                                           *
 ***************************************************/
Undef::Undef(const Type& t) : Operation(Opcode::Undef, t) {}

ref<Operation> Undef::Create(const Type& t) {
  return ref<Operation>(new Undef(t));
}

/***************************************************
 * hashing implementations                         *
 ***************************************************/
static llvm::hash_code hash_value(const ref<Operation>& op) {
  return std::hash<ref<Operation>>()(op);
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

} // namespace caffeine
