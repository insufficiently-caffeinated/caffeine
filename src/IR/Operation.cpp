#include "caffeine/IR/Operation.h"
#include "Operation.h"
#include "caffeine/IR/Type.h"

#include <boost/algorithm/string.hpp>
#include <boost/container_hash/hash.hpp>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/ADT/Hashing.h>
#include <llvm/Support/raw_ostream.h>

// TODO: We should put this in a config file
#define CAFFEINE_IMPLICIT_CONSTANT_FOLDING 1

#define SIZE_BITS (sizeof(size_t) * CHAR_BIT)

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
    : CopyVTable(op), opcode_(op.opcode_), refcount(0), type_(op.type_),
      inner_(op.inner_) {}
Operation::Operation(Operation&& op) noexcept
    : CopyVTable(op), opcode_(op.opcode_), refcount(0), type_(op.type_),
      inner_(std::move(op.inner_)) {}

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

  auto value = new Operation((Opcode)opcode(), type(), operands.data());
  value->copy_vtable(*this);
  return OpRef(value);
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
 * Symbol                                          *
 ***************************************************/
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

OpRef ConstantInt::Create(const llvm::APInt& iconst) {
  return OpRef(new ConstantInt(iconst));
}
OpRef ConstantInt::Create(llvm::APInt&& iconst) {
  return OpRef(new ConstantInt(iconst));
}
OpRef ConstantInt::Create(bool value) {
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

llvm::iterator_range<Operation::operand_iterator> ConstantArray::operands() {
  auto& operand = std::get<ConstantData>(inner_).second;
  return llvm::iterator_range<operand_iterator>(&operand, &operand + 1);
}
llvm::iterator_range<Operation::const_operand_iterator>
ConstantArray::operands() const {
  const auto& operand = std::get<ConstantData>(inner_).second;
  return llvm::iterator_range<const_operand_iterator>(&operand, &operand + 1);
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

  return OpRef(new BinaryOp(op, lhs->type(), lhs, rhs));
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

OpRef BinaryOp::CreateAdd(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateSub(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateMul(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateUDiv(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateSDiv(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateURem(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateSRem(const OpRef& lhs, const OpRef& rhs) {
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

OpRef BinaryOp::CreateAnd(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateOr(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateXor(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateShl(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateLShr(const OpRef& lhs, const OpRef& rhs) {
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
OpRef BinaryOp::CreateAShr(const OpRef& lhs, const OpRef& rhs) {
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

OpRef BinaryOp::CreateFAdd(const OpRef& lhs, const OpRef& rhs) {
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

OpRef BinaryOp::CreateFSub(const OpRef& lhs, const OpRef& rhs) {
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

OpRef BinaryOp::CreateFMul(const OpRef& lhs, const OpRef& rhs) {
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

OpRef BinaryOp::CreateFDiv(const OpRef& lhs, const OpRef& rhs) {
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

OpRef BinaryOp::CreateFRem(const OpRef& lhs, const OpRef& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_FP(lhs);
  ASSERT_FP(rhs);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* lhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(lhs.get());
  const auto* rhs_float = llvm::dyn_cast<caffeine::ConstantFloat>(rhs.get());

  if (lhs_float && rhs_float) {
    return caffeine::ConstantFloat::Create(
        llvm::APFloat(lhs_float->value()).remainder(rhs_float->value()));
  }
#endif

  return Create(Opcode::FRem, lhs, rhs);
}

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

  return OpRef(new UnaryOp(op, returnType, operand));
}

#define DECL_UNOP_CREATE(opcode, assert, return_type)                          \
  OpRef UnaryOp::Create##opcode(const OpRef& operand) {                        \
    assert(operand);                                                           \
                                                                               \
    return Create(Opcode::opcode, operand, return_type);                       \
  }

OpRef UnaryOp::CreateNot(const OpRef& operand) {
  ASSERT_INT(operand);

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(~op->value());
#endif

  return Create(Opcode::Not, operand);
}

DECL_UNOP_CREATE(FNeg, ASSERT_FP, operand->type());
DECL_UNOP_CREATE(FIsNaN, ASSERT_FP, Type::int_ty(1));

OpRef UnaryOp::CreateTrunc(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() < operand->type().bitwidth());

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (llvm::isa<caffeine::Undef>(operand.get()))
    return Undef::Create(tgt);

  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(op->value().trunc(tgt.bitwidth()));
#endif

  return OpRef(new UnaryOp(Opcode::Trunc, tgt, operand));
}
OpRef UnaryOp::CreateZExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() > operand->type().bitwidth());

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(op->value().zext(tgt.bitwidth()));
#endif

  return OpRef(new UnaryOp(Opcode::ZExt, tgt, operand));
}
OpRef UnaryOp::CreateSExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() > operand->type().bitwidth());

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (llvm::isa<caffeine::Undef>(operand.get()))
    return Undef::Create(tgt);

  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(op->value().sext(tgt.bitwidth()));
#endif

  return OpRef(new UnaryOp(Opcode::SExt, tgt, operand));
}
OpRef UnaryOp::CreateFpTrunc(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_float());
  CAFFEINE_ASSERT(tgt.exponent_bits() < operand->type().exponent_bits() &&
                  tgt.mantissa_bits() < operand->type().mantissa_bits());

  return OpRef(new UnaryOp(Opcode::FpTrunc, tgt, operand));
}
OpRef UnaryOp::CreateFpExt(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_float());
  CAFFEINE_ASSERT(tgt.exponent_bits() > operand->type().exponent_bits() &&
                  tgt.mantissa_bits() > operand->type().mantissa_bits());

  return OpRef(new UnaryOp(Opcode::FpExt, tgt, operand));
}
OpRef UnaryOp::CreateFpToUI(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_float());

  return OpRef(new UnaryOp(Opcode::FpToUI, tgt, operand));
}
OpRef UnaryOp::CreateFpToSI(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_float());

  return OpRef(new UnaryOp(Opcode::FpToSI, tgt, operand));
}
OpRef UnaryOp::CreateUIToFp(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_int());

  return OpRef(new UnaryOp(Opcode::UIToFp, tgt, operand));
}
OpRef UnaryOp::CreateSIToFp(Type tgt, const OpRef& operand) {
  CAFFEINE_ASSERT(tgt.is_float());
  CAFFEINE_ASSERT(operand->type().is_int());

  return OpRef(new UnaryOp(Opcode::SIToFp, tgt, operand));
}
OpRef UnaryOp::CreateBitcast(Type tgt, const OpRef& operand) {
  // TODO: Validate sizes if possible.
  // CAFFEINE_ASSERT(tgt.byte_size() == operand->type().byte_size());

  return OpRef(new UnaryOp(Opcode::Bitcast, tgt, operand));
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

  CAFFEINE_ASSERT(true_value->type() == false_value->type(),
                  "select values had different types");

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (const auto* vcond = llvm::dyn_cast<caffeine::ConstantInt>(cond.get()))
    return vcond->value() == 1 ? true_value : false_value;
#endif

  return OpRef(new SelectOp(true_value->type(), cond, true_value, false_value));
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

  return OpRef(new ICmpOp(cmp, Type::int_ty(1), lhs, rhs));
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

  return OpRef(new FCmpOp(cmp, Type::type_of<bool>(), lhs, rhs));
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

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  if (const auto* cnst = llvm::dyn_cast<caffeine::ConstantInt>(size.get())) {
    if (cnst->value().getLimitedValue(SIZE_MAX) < SIZE_MAX) {
      return FixedArray::Create(cnst->type(), defaultval,
                                cnst->value().getLimitedValue());
    }
  }
#endif

  return OpRef(new AllocOp(size, defaultval));
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

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* fixedarray = llvm::dyn_cast<caffeine::FixedArray>(data.get());
  const auto* offset_int = llvm::dyn_cast<caffeine::ConstantInt>(offset.get());

  if (fixedarray && offset_int) {
    return fixedarray->data()[offset_int->value().getLimitedValue()];
  }
#endif

  return OpRef(new LoadOp(data, offset));
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

#ifdef CAFFEINE_IMPLICIT_CONSTANT_FOLDING
  const auto* offset_cnst = llvm::dyn_cast<caffeine::ConstantInt>(offset.get());
  const auto* fixedarray = llvm::dyn_cast<caffeine::FixedArray>(data.get());

  if (offset_cnst && fixedarray) {
    auto data = fixedarray->data();
    data.set(offset_cnst->value().getLimitedValue(), value);
    return FixedArray::Create(offset->type(), data);
  }

#endif

  return OpRef(new StoreOp(data, offset, value));
}

/***************************************************
 * Undef                                           *
 ***************************************************/
Undef::Undef(const Type& t) : Operation(Opcode::Undef, t) {}

OpRef Undef::Create(const Type& t) {
  return OpRef(new Undef(t));
}

/***************************************************
 * FixedArray                                      *
 ***************************************************/
FixedArray::FixedArray(Type t, const PersistentArray<OpRef>& data)
    : ArrayBase(Operation::FixedArray, t, data) {}

llvm::iterator_range<Operation::operand_iterator> FixedArray::operands() {
  auto array = data().vec();
  auto range = llvm::iterator_range<operand_iterator>(
      array.data(), array.data() + array.size());

  data() = PersistentArray<OpRef>(std::move(array));
  return range;
}
llvm::iterator_range<Operation::const_operand_iterator>
FixedArray::operands() const {
  data().reroot();

  const auto& array = *data().underlying_vec();
  return llvm::iterator_range<const_operand_iterator>(
      array.data(), array.data() + array.size());
}

OpRef FixedArray::with_new_operands(llvm::ArrayRef<OpRef> operands) const {
  CAFFEINE_ASSERT(operands.size() == num_operands());

  if (num_operands() == 0)
    return into_ref();

  bool equal = std::equal(std::begin(operands), std::end(operands),
                          std::begin(data()), std::end(data()));

  if (equal)
    return into_ref();

  auto array = data();
  array.reroot();
  for (size_t i = 0; i < operands.size(); ++i) {
    if (array[i] != operands[i])
      array.set(i, operands[i]);
  }

  return OpRef(new FixedArray(type(), array));
}

OpRef FixedArray::Create(Type index_ty, const PersistentArray<OpRef>& data) {
  CAFFEINE_ASSERT(index_ty.is_int());
  CAFFEINE_ASSERT(
      index_ty.bitwidth() >= ilog2(data.size()),
      "Index bitwidth is not large enough to address entire constant array");

  return OpRef(new FixedArray(Type::array_ty(index_ty.bitwidth()), data));
}
OpRef FixedArray::Create(Type index_ty, const OpRef& value, size_t size) {
  return FixedArray::Create(
      index_ty, PersistentArray<OpRef>(std::vector<OpRef>(size, value)));
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
