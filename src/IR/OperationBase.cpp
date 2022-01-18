#include "caffeine/IR/OperationBase.h"
#include "Operation.h"
#include "caffeine/Support/LLVMFmt.h"
#include <boost/algorithm/string.hpp>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/ADT/SmallString.h>

namespace caffeine {

Operation::Operation() : opcode_(Invalid), type_(Type::void_ty()) {}

Operation::Operation(std::unique_ptr<OperationData>&& data,
                     std::initializer_list<OpRef> operands)
    : opcode_(data->opcode()), type_(data->type()), data_(std::move(data)),
      operands_(operands) {
  size_t nargs = detail::opcode_nargs(opcode());

  if (nargs != 4) {
    CAFFEINE_ASSERT(nargs == operands.size(),
                    fmt::format("invalid number of arguments: {} != {}", nargs,
                                operands.size()));
  }
}
Operation::Operation(std::unique_ptr<OperationData>&& data,
                     llvm::ArrayRef<OpRef> operands)
    : opcode_(data->opcode()), type_(data->type()), data_(std::move(data)),
      operands_(operands.begin(), operands.end()) {
  size_t nargs = detail::opcode_nargs(opcode());

  if (nargs != 4) {
    CAFFEINE_ASSERT(nargs == operands.size(),
                    fmt::format("invalid number of arguments: {} != {}", nargs,
                                operands.size()));
  }
}

Operation::Operation(Operation&& op) noexcept
    : std::enable_shared_from_this<Operation>(), opcode_(op.opcode_),
      type_(op.type_), data_(std::move(op.data_)),
      operands_(std::move(op.operands_)) {
  copy_vtable(op);
  op.reset();
}

Operation& Operation::operator=(Operation&& op) noexcept {
  data_ = std::move(op.data_);
  operands_ = std::move(op.operands_);
  type_ = op.type_;
  opcode_ = op.opcode_;

  copy_vtable(op);
  op.reset();

  return *this;
}

void Operation::reset() {
  opcode_ = Invalid;
  type_ = Type::void_ty();
  operands_.clear();
  data_ = nullptr;
}

bool Operation::operator==(const Operation& op) const {
  if (opcode_ != op.opcode_ || type_ != op.type_)
    return false;
  if (operands_ != op.operands_)
    return false;

  if (data_ != op.data_) {
    if ((bool)data_ != (bool)op.data_)
      return false;

    if (*data_ != *op.data_)
      return false;
  }

  return true;
}
bool Operation::operator!=(const Operation& op) const {
  return !(*this == op);
}

OpRef Operation::with_new_operands(llvm::ArrayRef<OpRef> operands) const {
  CAFFEINE_ASSERT(operands.size() == num_operands());

  if (num_operands() == 0)
    return shared_from_this();

  if ((llvm::ArrayRef<OpRef>)operands_ == operands)
    return shared_from_this();

  Operation next{data_->clone(), operands};
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

bool Operation::valid() const {
  return opcode() != 0;
}

uint16_t Operation::opcode() const {
  return opcode_;
}

size_t Operation::num_operands() const {
  if (data_)
    return operands_.size();
  return detail::opcode_nargs(opcode_);
}

ref<const Operation> Operation::as_ref() const {
  CAFFEINE_ASSERT(!weak_from_this().expired(),
                  "Unable to convert non-refcounted Operation "
                  "instance to a refcounted one");
  return shared_from_this();
}

llvm::iterator_range<Operation::const_operand_iterator>
Operation::operands() const {
  return llvm::iterator_range<Operation::const_operand_iterator>{
      const_operand_iterator(this, 0),
      const_operand_iterator(this, num_operands())};
}

uint16_t Operation::aux_data() const {
  return detail::opcode_aux(opcode());
}
Type Operation::type() const {
  return type_;
}

bool Operation::is_constant() const {
  return detail::opcode_base(opcode()) == 1;
}

const Operation& Operation::operator[](size_t idx) const {
  CAFFEINE_ASSERT(idx < num_operands(),
                  "Tried to access out-of-bounds operand");
  return *operand_at(idx);
}

const OpRef& Operation::operand_at(size_t idx) const {
  return operands_[idx];
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
    std::string label = fmt::format("const.{}", op.type().bitwidth());

    if (constant->is_named())
      return print_cons(os, label, constant->name());
    return print_cons(os, label, constant->number());
  }

  if (const auto* constant = llvm::dyn_cast<ConstantInt>(&op)) {
    llvm::SmallString<32> value;
    constant->value().toString(value, 10, false);

    return print_cons(os, op.type(),
                      std::string_view(value.data(), value.size()));
  }

  if (const auto* constant = llvm::dyn_cast<ConstantFloat>(&op)) {
    return print_cons(os, op.type(), fmt::format("{}", constant->value()));
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

} // namespace caffeine
