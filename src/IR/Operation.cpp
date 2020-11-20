#include "caffeine/IR/Operation.h"

#include <llvm/ADT/Hashing.h>

namespace caffeine {

Operation::Operation() : opcode_(Invalid), type_(Type::void_ty()) {}

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
  CAFFEINE_ASSERT(op == ConstantInt);
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
  CAFFEINE_ASSERT(op == Constant);
}

Operation::Operation(const Operation& op) noexcept
    : opcode_(op.opcode_), type_(op.type_) {
  if (is_constant()) {
    switch (opcode_) {
    case ConstantInt:
      new (&iconst_) llvm::APInt(op.iconst_);
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(op.fconst_);
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
      new (&iconst_) llvm::APInt(std::move(op.iconst_));
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(std::move(op.fconst_));
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
      new (&iconst_) llvm::APInt(op.iconst_);
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(op.fconst_);
      break;
    case Constant:
      new (&name_) std::string(op.name_);
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
      new (&iconst_) llvm::APInt(std::move(op.iconst_));
      break;
    case ConstantFloat:
      new (&fconst_) llvm::APFloat(std::move(op.fconst_));
      break;
    case Constant:
      new (&name_) std::string(std::move(op.name_));
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
      return iconst_ == op.iconst_;
    case ConstantFloat:
      // TODO: It might be better to use semantic equality here?
      //       Would have to figure out how to deal with NaNs in that case.
      return fconst_.bitwiseIsEqual(op.fconst_);
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
      iconst_.~APInt();
      break;
    case ConstantFloat:
      fconst_.~APFloat();
      break;
    case Constant:
      name_.~basic_string();
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
  case Constant:      return "Constant";
  case ConstantInt:   return "ConstantInt";
  case ConstantFloat: return "ConstantFloat";

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
  }
  // clang-format on
  return "Unknown";
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

DECL_UNOP_CREATE(Not, ASSERT_INT);
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
                   detail::opcode(32, 2, static_cast<uint16_t>(cmp))),
               t, lhs, rhs) {}

ref<Operation> ICmpOp::CreateICmp(ICmpOpcode cmp, const ref<Operation>& lhs,
                                  const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs->type() == lhs->type(),
                  "cannot compare icmp operands with different types");
  CAFFEINE_ASSERT(lhs->type().is_int(),
                  "icmp can only be created with integer operands");

  return ref<Operation>(new ICmpOp(cmp, lhs->type(), lhs, rhs));
}

/***************************************************
 * FCmpOp                                          *
 ***************************************************/
FCmpOp::FCmpOp(FCmpOpcode cmp, Type t, const ref<Operation>& lhs,
               const ref<Operation>& rhs)
    : BinaryOp(static_cast<Opcode>(
                   detail::opcode(33, 2, static_cast<uint16_t>(cmp))),
               t, lhs, rhs) {}

ref<Operation> FCmpOp::CreateFCmp(FCmpOpcode cmp, const ref<Operation>& lhs,
                                  const ref<Operation>& rhs) {
  CAFFEINE_ASSERT(rhs, "rhs was null");
  CAFFEINE_ASSERT(lhs, "lhs was null");
  CAFFEINE_ASSERT(rhs->type() == lhs->type(),
                  "cannot compare icmp operands with different types");
  CAFFEINE_ASSERT(lhs->type().is_float(),
                  "icmp can only be created with integer operands");

  return ref<Operation>(new FCmpOp(cmp, lhs->type(), lhs, rhs));
}

/***************************************************
 * hashing implementations                         *
 ***************************************************/
llvm::hash_code hash_value(const Operation& op) {
  std::size_t hash = llvm::hash_combine(op.opcode(), op.type());

  if (op.num_operands() == 0) {
    switch (op.opcode()) {
    case Operation::Constant:
      hash = llvm::hash_combine(hash, op.name_);
      break;
    case Operation::ConstantInt:
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
