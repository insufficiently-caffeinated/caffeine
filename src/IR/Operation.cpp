#include "caffeine/IR/Operation.h"

#include "Operation.h"

#include <llvm/ADT/Hashing.h>

namespace caffeine {

Operation::Operation() : opcode_(Invalid), type_(Type::void_ty()) {}

Operation::Operation(Opcode op, Type t)
    : opcode_(static_cast<uint16_t>(op)), type_(t) {}

// clang-format off
Operation::Operation(Opcode op, Type t, ref<Operation>* operands)
    : opcode_(static_cast<uint16_t>(op)),
      type_(t), operands_{(opcode_ & 0x3) > 0 ? operands[0] : ref<Operation>(),
                          (opcode_ & 0x3) > 1 ? operands[0] : ref<Operation>(),
                          (opcode_ & 0x3) > 2 ? operands[0] : ref<Operation>()} 
{
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  // Don't use this constructor to create an invalid opcode.
  // It'll mess up constructors and destructors.
  CAFFEINE_ASSERT(op != Invalid);
  // No opcodes have > 3 operands
  CAFFEINE_ASSERT(num_operands() <= 3, "Invalid opcode");
}
// clang-format on

Operation::Operation(Opcode op, const llvm::APInt& iconst)
    : opcode_(op), type_(Type::type_of(iconst)), iconst_(iconst) {
  // Currently only ConstantInt is valid here
  CAFFEINE_ASSERT(op == ConstantInt || op == ConstantNumbered);
}
Operation::Operation(Opcode op, llvm::APInt&& iconst)
    : opcode_(op), type_(Type::type_of(iconst)), iconst_(iconst) {
  // Currently only ConstantInt is valid here
  CAFFEINE_ASSERT(op == ConstantInt);
}

Operation::Operation(Opcode op, const llvm::APFloat& fconst)
    : opcode_(op), type_(Type::type_of(fconst)), fconst_(fconst) {
  CAFFEINE_ASSERT(op == ConstantFloat);
}
Operation::Operation(Opcode op, llvm::APFloat&& fconst)
    : opcode_(op), type_(Type::type_of(fconst)), fconst_(fconst) {
  CAFFEINE_ASSERT(op == ConstantFloat);
}

Operation::Operation(Opcode op, Type t, const std::string& name)
    : opcode_(op), type_(t), name_(name) {
  CAFFEINE_ASSERT(op == ConstantNamed);
}
Operation::Operation(Opcode op, Type t, uint64_t number)
    : opcode_(op), type_(t), iconst_(64, number) {
  CAFFEINE_ASSERT(op == ConstantNumbered);
}

Operation::Operation(const Operation& op) noexcept
    : opcode_(op.opcode_), type_(op.type_) {
  if (is_constant()) {
    switch (opcode_) {
    case ConstantInt:
    case ConstantNumbered:
      new (&iconst_) llvm::APInt(op.iconst_);
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(op.fconst_);
      break;
    case ConstantNamed:
      new (&name_) std::string(op.name_);
      break;
    case Undef:
      break;
    default:
      CAFFEINE_UNREACHABLE();
    }
  } else {
    new (&operands_[0]) ref<Operation>(op.operands_[0]);
    new (&operands_[1]) ref<Operation>(op.operands_[1]);
    new (&operands_[2]) ref<Operation>(op.operands_[2]);
  }
}
Operation::Operation(Operation&& op) noexcept
    : opcode_(op.opcode_), type_(op.type_) {
  if (is_constant()) {
    switch (opcode_) {
    case ConstantInt:
    case ConstantNumbered:
      new (&iconst_) llvm::APInt(std::move(op.iconst_));
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(std::move(op.fconst_));
      break;
    case ConstantNamed:
      new (&name_) std::string(op.name_);
      break;
    case Undef:
      break;
    default:
      CAFFEINE_UNREACHABLE();
    }
  } else {
    new (&operands_[0]) ref<Operation>(std::move(op.operands_[0]));
    new (&operands_[1]) ref<Operation>(std::move(op.operands_[1]));
    new (&operands_[2]) ref<Operation>(std::move(op.operands_[2]));
  }
}

Operation::Operation(Opcode op, Type t, const ref<Operation>& op0)
    : opcode_(static_cast<uint16_t>(op)),
      type_(t), operands_{op0, ref<Operation>(), ref<Operation>()} {
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 1);
}
Operation::Operation(Opcode op, Type t, const ref<Operation>& op0,
                     const ref<Operation>& op1)
    : opcode_(static_cast<uint16_t>(op)),
      type_(t), operands_{op0, op1, ref<Operation>()} {
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 2);
}
Operation::Operation(Opcode op, Type t, const ref<Operation>& op0,
                     const ref<Operation>& op1, const ref<Operation>& op2)
    : opcode_(static_cast<uint16_t>(op)), type_(t), operands_{op0, op1, op2} {
  CAFFEINE_ASSERT((opcode_ >> 6) != 1,
                  "Tried to create a constant with operands");
  CAFFEINE_ASSERT(num_operands() == 3);
}

Operation& Operation::operator=(const Operation& op) noexcept {
  invalidate();

  opcode_ = op.opcode_;
  type_ = op.type_;
  if (is_constant()) {
    switch (opcode_) {
    case ConstantInt:
    case ConstantNumbered:
      new (&iconst_) llvm::APInt(op.iconst_);
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(op.fconst_);
      break;
    case ConstantNamed:
      new (&name_) std::string(op.name_);
      break;
    case Undef:
      break;
    default:
      CAFFEINE_UNREACHABLE();
    }
  } else {
    new (&operands_[0]) ref<Operation>(op.operands_[0]);
    new (&operands_[1]) ref<Operation>(op.operands_[1]);
    new (&operands_[2]) ref<Operation>(op.operands_[2]);
  }

  return *this;
}
Operation& Operation::operator=(Operation&& op) noexcept {
  invalidate();

  opcode_ = op.opcode_;
  type_ = op.type_;
  if (is_constant()) {
    switch (opcode_) {
    case ConstantInt:
    case ConstantNumbered:
      new (&iconst_) llvm::APInt(std::move(op.iconst_));
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(std::move(op.fconst_));
      break;
    case ConstantNamed:
      new (&name_) std::string(std::move(op.name_));
      break;
    case Undef:
      break;
    default:
      CAFFEINE_UNREACHABLE();
    }
  } else {
    new (&operands_[0]) ref<Operation>(std::move(op.operands_[0]));
    new (&operands_[1]) ref<Operation>(std::move(op.operands_[1]));
    new (&operands_[2]) ref<Operation>(std::move(op.operands_[2]));
  }

  return *this;
}

Operation::~Operation() {
  invalidate();
}

bool Operation::operator==(const Operation& op) const {
  if (opcode_ != op.opcode_ || type_ != op.type_)
    return false;

  const size_t nops = num_operands();
  if (nops != 0) {
    for (size_t i = 0; i < nops; ++i) {
      if (operands_[i] != op.operands_[i])
        return false;
    }
  } else {
    switch (opcode_) {
    case ConstantInt:
    case ConstantNumbered:
      return iconst_ == op.iconst_;
    case ConstantFloat:
      // TODO: It might be better to use semantic equality here?
      //       Would have to figure out how to deal with NaNs in that case.
      return fconst_.bitwiseIsEqual(op.fconst_);
    case ConstantNamed:
      return name_ == op.name_;
    default:
      CAFFEINE_UNREACHABLE();
    }
  }

  return true;
}
bool Operation::operator!=(const Operation& op) const {
  return !(*this == op);
}

void Operation::invalidate() noexcept {
  if (is_constant()) {
    switch (opcode_) {
    case ConstantInt:
    case ConstantNumbered:
      iconst_.~APInt();
      break;
    case ConstantFloat:
      fconst_.~APFloat();
      break;
    case ConstantNamed:
      name_.~basic_string();
      break;
    case Undef:
      break;
    default:
      CAFFEINE_UNREACHABLE();
    }
  } else {
    operands_[0].~ref();
    operands_[1].~ref();
    operands_[2].~ref();
  }

  opcode_ = Invalid;
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

  case FAdd:  return "FAdd";
  case FSub:  return "FSub";
  case FMul:  return "FMul";
  case FDiv:  return "FDiv";
  case FRem:  return "FRem";
  case FNeg:  return "FNeg";

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

  case FCmpOeq:
  case FCmpOgt:
  case FCmpOge:
  case FCmpOlt:
  case FCmpOle:
  case FCmpOne:
  case FCmpOrd:
  case FCmpUno:
  case FCmpUeq:
  case FCmpUgt:
  case FCmpUge:
  case FCmpUlt:
  case FCmpUle:
  case FCmpUne:
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
    : Operation(Operation::ConstantInt, iconst) {}
ConstantInt::ConstantInt(llvm::APInt&& iconst)
    : Operation(Operation::ConstantInt, iconst) {}

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
    : Operation(Operation::ConstantFloat, fconst) {}
ConstantFloat::ConstantFloat(llvm::APFloat&& fconst)
    : Operation(Operation::ConstantFloat, fconst) {}

ref<Operation> ConstantFloat::Create(const llvm::APFloat& fconst) {
  return ref<Operation>(new ConstantFloat(fconst));
}
ref<Operation> ConstantFloat::Create(llvm::APFloat&& fconst) {
  return ref<Operation>(new ConstantFloat(fconst));
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
  CAFFEINE_ASSERT(lhs->type() == rhs->type(),
                  "BinaryOp created from operands with different types");

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

  if (lhs->is<caffeine::Undef>() || rhs->is<caffeine::Undef>())
    return Undef::Create(lhs->type());

  if (is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() - rhs_int->value());

  return Create(Opcode::Sub, lhs, rhs);
}
ref<Operation> BinaryOp::CreateMul(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 0))
    return rhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() * rhs_int->value());

  return Create(Opcode::Mul, lhs, rhs);
}
ref<Operation> BinaryOp::CreateUDiv(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 1))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().udiv(rhs_int->value()));

  return Create(Opcode::UDiv, lhs, rhs);
}
ref<Operation> BinaryOp::CreateSDiv(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 1) && rhs->type().bitwidth() > 1)
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().sdiv(rhs_int->value()));

  return Create(Opcode::SDiv, lhs, rhs);
}
ref<Operation> BinaryOp::CreateURem(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 1))
    return ConstantInt::Create(llvm::APInt(lhs->type().bitwidth(), 0));

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().urem(rhs_int->value()));

  return Create(Opcode::URem, lhs, rhs);
}
ref<Operation> BinaryOp::CreateSRem(const ref<Operation>& lhs,
                                    const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 1) && rhs->type().bitwidth() > 1)
    return ConstantInt::Create(llvm::APInt(lhs->type().bitwidth(), 0));

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().srem(rhs_int->value()));

  return Create(Opcode::SRem, lhs, rhs);
}

ref<Operation> BinaryOp::CreateAnd(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0))
    return lhs;
  if (is_constant_int(*rhs, 0))
    return rhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() & rhs_int->value());

  return Create(Opcode::And, lhs, rhs);
}
ref<Operation> BinaryOp::CreateOr(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0))
    return rhs;
  if (is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() | rhs_int->value());

  return Create(Opcode::Or, lhs, rhs);
}
ref<Operation> BinaryOp::CreateXor(const ref<Operation>& lhs,
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
    return ConstantInt::Create(lhs_int->value() ^ rhs_int->value());

  return Create(Opcode::Xor, lhs, rhs);
}
ref<Operation> BinaryOp::CreateShl(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value() << rhs_int->value());

  return Create(Opcode::Shl, lhs, rhs);
}
ref<Operation> BinaryOp::CreateLShr(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().lshr(rhs_int->value()));

  return Create(Opcode::LShr, lhs, rhs);
}
ref<Operation> BinaryOp::CreateAShr(const ref<Operation>& lhs,
                                   const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs, "rhs was null");
  ASSERT_INT(lhs);
  ASSERT_INT(rhs);

  if (is_constant_int(*lhs, 0) || is_constant_int(*rhs, 0))
    return lhs;

  const auto* lhs_int = llvm::dyn_cast<caffeine::ConstantInt>(lhs.get());
  const auto* rhs_int = llvm::dyn_cast<caffeine::ConstantInt>(rhs.get());
  if (lhs_int && rhs_int)
    return ConstantInt::Create(lhs_int->value().ashr(rhs_int->value()));

  return Create(Opcode::AShr, lhs, rhs);
}

DECL_BINOP_CREATE(FAdd, ASSERT_FP);
DECL_BINOP_CREATE(FSub, ASSERT_FP);
DECL_BINOP_CREATE(FMul, ASSERT_FP);
DECL_BINOP_CREATE(FDiv, ASSERT_FP);
DECL_BINOP_CREATE(FRem, ASSERT_FP);

/***************************************************
 * UnaryOp                                         *
 ***************************************************/
UnaryOp::UnaryOp(Opcode op, Type t, const ref<Operation>& operand)
    : Operation(op, t, operand) {}

ref<Operation> UnaryOp::Create(Opcode op, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(operand, "operand was null");
  CAFFEINE_ASSERT((op & 0x3) == 1, "Opcode doesn't have 2 operands");

  return ref<Operation>(new UnaryOp(op, operand->type(), operand));
}

#define DECL_UNOP_CREATE(opcode, assert)                                       \
  ref<Operation> UnaryOp::Create##opcode(const ref<Operation>& operand) {      \
    assert(operand);                                                           \
                                                                               \
    return Create(Opcode::opcode, operand);                                    \
  }                                                                            \
  static_assert(true)

ref<Operation> UnaryOp::CreateNot(const ref<Operation>& operand) {
  ASSERT_INT(operand);

  if (const auto* op = llvm::dyn_cast<caffeine::ConstantInt>(operand.get()))
    return ConstantInt::Create(~op->value());

  return Create(Opcode::Not, operand);
}

DECL_UNOP_CREATE(FNeg, ASSERT_FP);

ref<Operation> UnaryOp::CreateTrunc(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() < operand->type().bitwidth());

  return ref<Operation>(new UnaryOp(Opcode::Trunc, tgt, operand));
}
ref<Operation> UnaryOp::CreateZExt(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() > operand->type().bitwidth());

  return ref<Operation>(new UnaryOp(Opcode::ZExt, tgt, operand));
}
ref<Operation> UnaryOp::CreateSExt(Type tgt, const ref<Operation>& operand) {
  CAFFEINE_ASSERT(tgt.is_int());
  CAFFEINE_ASSERT(operand->type().is_int());
  CAFFEINE_ASSERT(tgt.bitwidth() > operand->type().bitwidth());

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

  CAFFEINE_ASSERT(cond->type() == Type::int_ty(1),
                  "select condition was not an i1");
  CAFFEINE_ASSERT(true_value->type() == false_value->type(),
                  "select values had different types");

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
  CAFFEINE_ASSERT(rhs->type() == lhs->type(),
                  "cannot compare icmp operands with different types");
  CAFFEINE_ASSERT(lhs->type().is_int(),
                  "icmp can only be created with integer operands");

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

  return ref<Operation>(new FCmpOp(cmp, Type::type_of<bool>(), lhs, rhs));
}

/***************************************************
 * AllocOp                                         *
 ***************************************************/
AllocOp::AllocOp(const ref<Operation>& size, const ref<Operation>& defaultval)
    : Operation(Opcode::Alloc, Type::array_ty(), size, defaultval) {}

ref<Operation> AllocOp::Create(const ref<Operation>& size,
                               const ref<Operation>& defaultval) {
  CAFFEINE_ASSERT(size, "size was null");
  CAFFEINE_ASSERT(defaultval, "defaultval was null");
  // To be fully correct, this should be validating that the bitwidth of size is
  // the correct one for the architecture model. Unfortunately we don't have
  // enough information here to validate that so instead we just ensure that
  // size is an integer.
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
  return ref<Operation>(new LoadOp(data, offset));
}

/***************************************************
 * StoreOp                                         *
 ***************************************************/
StoreOp::StoreOp(const ref<Operation>& data, const ref<Operation>& offset,
                 const ref<Operation>& value)
    : Operation(Opcode::Store, Type::array_ty(), data, offset, value) {}

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
llvm::hash_code hash_value(const Operation& op) {
  std::size_t hash = llvm::hash_combine(op.opcode(), op.type());

  if (op.num_operands() == 0) {
    switch (op.opcode()) {
    case Operation::ConstantNamed:
      hash = llvm::hash_combine(hash, op.name_);
      break;
    case Operation::ConstantInt:
    case Operation::ConstantNumbered:
      hash = llvm::hash_combine(hash, op.iconst_);
      break;
    case Operation::ConstantFloat:
      hash = llvm::hash_combine(hash, op.fconst_);
      break;
    default:
      CAFFEINE_UNREACHABLE();
    }
  } else {
    for (const auto& operand : op.operands())
      hash = llvm::hash_combine(hash, operand);
  }

  return llvm::hash_code(hash);
}

} // namespace caffeine
