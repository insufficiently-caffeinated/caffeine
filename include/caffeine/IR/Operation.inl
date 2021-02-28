
#ifndef CAFFEINE_IR_OPERATION_INL
#define CAFFEINE_IR_OPERATION_INL

#include <functional>
#include <type_traits>

#include "caffeine/IR/Operation.h"

/**
 * This file is meant to hold one-liners so that they can be inlined.
 * This way we still get the optimization advantages but they don't
 * obscure the interface of the operation classes.
 *
 * If a method is either
 *  - bigger than a few lines, or
 *  - would need an extra header
 * then it shouldn't go in this file and should instead be put within
 * Operation.cpp so as to minimize compile time.
 *
 * The exception here is any template methods. Those should be declared
 * in the header and defined here.
 */

namespace caffeine {

// All derived operation types should be the same size
static_assert(sizeof(ConstantInt) == sizeof(Operation));
static_assert(sizeof(ConstantFloat) == sizeof(Operation));
static_assert(sizeof(Constant) == sizeof(Operation));
static_assert(sizeof(BinaryOp) == sizeof(Operation));
static_assert(sizeof(UnaryOp) == sizeof(Operation));
static_assert(sizeof(SelectOp) == sizeof(Operation));
static_assert(sizeof(ICmpOp) == sizeof(Operation));
static_assert(sizeof(FCmpOp) == sizeof(Operation));
static_assert(sizeof(AllocOp) == sizeof(Operation));
static_assert(sizeof(LoadOp) == sizeof(Operation));
static_assert(sizeof(StoreOp) == sizeof(Operation));
static_assert(sizeof(Undef) == sizeof(Operation));
static_assert(sizeof(FixedArray) == sizeof(Operation));
static_assert(sizeof(ConstantArray) == sizeof(Operation));

namespace detail {
  template <typename T>
  class double_deref_iterator {
  private:
    T* inner;

    using self = double_deref_iterator<T>;

  public:
    using iterator_category = std::random_access_iterator_tag;
    using value_type = std::remove_reference_t<decltype(*std::declval<T>())>;
    using difference_type = std::ptrdiff_t;
    using pointer = value_type*;
    using reference = value_type&;

    double_deref_iterator(T* inner) : inner(inner) {}

    reference operator*() const {
      return **inner;
    }
    pointer operator->() const {
      return std::addressof(**inner);
    }

    self& operator++() {
      inner++;
      return *this;
    }
    self& operator--() {
      inner--;
      return *this;
    }

    self operator++(int) {
      return self(inner++);
    }
    self operator--(int) {
      return self(inner--);
    }

    self operator+(difference_type n) const {
      return self(inner + n);
    }
    self operator-(difference_type n) const {
      return self(inner - n);
    }

    self& operator+=(difference_type n) {
      inner += n;
      return *this;
    }
    self& operator-=(difference_type n) {
      inner -= n;
      return *this;
    }

    difference_type operator-(self b) const {
      return self(inner - b.inner);
    }

    bool operator==(self b) const {
      return inner == b.inner;
    }
    bool operator!=(self b) const {
      return inner != b.inner;
    }

    bool operator<=(self b) const {
      return inner <= b.inner;
    }
    bool operator>=(self b) const {
      return inner >= b.inner;
    }
    bool operator<(self b) const {
      return inner < b.inner;
    }
    bool operator>(self b) const {
      return inner > b.inner;
    }

    reference operator[](difference_type n) const {
      return *(*this + n);
    }
  };

  template <typename T>
  double_deref_iterator<T>
  operator+(typename double_deref_iterator<T>::difference_type n,
            double_deref_iterator<T> a) {
    return a + n;
  }
} // namespace detail

inline bool Operation::valid() const {
  return opcode_ != 0;
}

inline uint16_t Operation::opcode() const {
  return opcode_;
}

inline uint32_t Operation::refcnt() const {
  return refcount;
}

inline size_t Operation::num_operands() const {
  if (const auto* array = llvm::dyn_cast<caffeine::FixedArray>(this))
    return array->size();

  return detail::opcode_nargs(opcode_);
}

inline OpRef Operation::as_ref() {
  CAFFEINE_ASSERT(refcount != 0, "Unable to convert non-refcounted Operation "
                                 "instance to a refcounted one");
  return OpRef(this);
}
inline ref<const Operation> Operation::as_ref() const {
  CAFFEINE_ASSERT(refcount != 0, "Unable to convert non-refcounted Operation "
                                 "instance to a refcounted one");
  return ref<const Operation>(this);
}

inline llvm::iterator_range<Operation::operand_iterator> Operation::operands() {
  if (auto* vec = std::get_if<OpVec>(&inner_))
    return llvm::iterator_range<Operation::operand_iterator>{
        operand_iterator(vec->data()),
        operand_iterator(vec->data() + num_operands())};

  return llvm::iterator_range<Operation::operand_iterator>{
      operand_iterator(nullptr), operand_iterator(nullptr)};
}
inline llvm::iterator_range<Operation::const_operand_iterator>
Operation::operands() const {
  if (const auto* vec = std::get_if<OpVec>(&inner_))
    return llvm::iterator_range<Operation::const_operand_iterator>{
        const_operand_iterator(vec->data()),
        const_operand_iterator(vec->data() + num_operands())};

  return llvm::iterator_range<Operation::const_operand_iterator>{
      const_operand_iterator(nullptr), const_operand_iterator(nullptr)};
}

inline uint16_t Operation::aux_data() const {
  return detail::opcode_aux(opcode());
}
inline Type Operation::type() const {
  return type_;
}

inline bool Operation::is_constant() const {
  return detail::opcode_base(opcode_) == 1;
}

inline Operation& Operation::operator[](size_t idx) {
  CAFFEINE_ASSERT(idx < num_operands(),
                  "Tried to access out-of-bounds operand");
  return *operand_at(idx);
}
inline const Operation& Operation::operator[](size_t idx) const {
  CAFFEINE_ASSERT(idx < num_operands(),
                  "Tried to access out-of-bounds operand");
  return *operand_at(idx);
}

inline OpRef& Operation::operand_at(size_t idx) {
  return std::get<OpVec>(inner_)[idx];
}
inline const OpRef& Operation::operand_at(size_t idx) const {
  return std::get<OpVec>(inner_)[idx];
}

inline OpRef Operation::into_ref() const {
  if (refcnt() == 0)
    return make_ref<Operation>(*this);
  return OpRef(const_cast<Operation*>(this));
}

/***************************************************
 * Symbol                                          *
 ***************************************************/
inline Symbol::Symbol(const std::string& name) : value_(name) {}
inline Symbol::Symbol(std::string&& name) : value_(std::move(name)) {}
inline Symbol::Symbol(uint64_t number) : value_(number) {}

template <size_t N>
inline Symbol::Symbol(const char (&name)[N]) : value_(std::string(name)) {}

inline bool Symbol::is_named() const {
  return value_.index() == Named;
}
inline bool Symbol::is_numbered() const {
  return value_.index() == Numbered;
}

inline std::string_view Symbol::name() const {
  return std::get<Named>(value_);
}
inline uint64_t Symbol::number() const {
  return std::get<Numbered>(value_);
}

inline bool Symbol::operator==(const Symbol& symbol) const {
  return value_ == symbol.value_;
}
inline bool Symbol::operator!=(const Symbol& symbol) const {
  return !(*this == symbol);
}

/***************************************************
 * Constant                                        *
 ***************************************************/
inline const Symbol& Constant::symbol() const {
  return std::get<ConstantData>(inner_).first;
}

inline std::string_view Constant::name() const {
  CAFFEINE_ASSERT(is_named(), "tried to access name of unnamed constant");
  return symbol().name();
}
inline uint64_t Constant::number() const {
  CAFFEINE_ASSERT(is_numbered(), "tried to access number of named constant");
  return symbol().number();
}

inline bool Constant::is_numbered() const {
  return opcode() == ConstantNumbered;
}
inline bool Constant::is_named() const {
  return opcode() == ConstantNamed;
}

/***************************************************
 * ConstantInt                                     *
 ***************************************************/
inline llvm::APInt& ConstantInt::value() {
  return std::get<llvm::APInt>(inner_);
}
inline const llvm::APInt& ConstantInt::value() const {
  return std::get<llvm::APInt>(inner_);
}

/***************************************************
 * ConstantFloat                                   *
 ***************************************************/
inline llvm::APFloat& ConstantFloat::value() {
  return std::get<llvm::APFloat>(inner_);
}
inline const llvm::APFloat& ConstantFloat::value() const {
  return std::get<llvm::APFloat>(inner_);
}

/***************************************************
 * ConstantArray                                   *
 ***************************************************/
inline OpRef ConstantArray::size() const {
  return operand_at(0);
}

inline const Symbol& ConstantArray::symbol() const {
  return std::get<ConstantData>(inner_).first;
}

inline OpRef& ConstantArray::operand_at(size_t idx) {
  CAFFEINE_ASSERT(idx == 0, "Accessed out of bounds operand index");
  return std::get<ConstantData>(inner_).second;
}

inline const OpRef& ConstantArray::operand_at(size_t idx) const {
  CAFFEINE_ASSERT(idx == 0, "Accessed out of bounds operand index");
  return std::get<ConstantData>(inner_).second;
}

/***************************************************
 * BinaryOp                                        *
 ***************************************************/
inline const OpRef& BinaryOp::lhs() const {
  return operand_at(0);
}
inline const OpRef& BinaryOp::rhs() const {
  return operand_at(1);
}

inline OpRef& BinaryOp::lhs() {
  return operand_at(0);
}
inline OpRef& BinaryOp::rhs() {
  return operand_at(1);
}

/***************************************************
 * UnaryOp                                         *
 ***************************************************/
inline OpRef& UnaryOp::operand() {
  return operand_at(0);
}
inline const OpRef& UnaryOp::operand() const {
  return operand_at(0);
}

/***************************************************
 * SelectOp                                        *
 ***************************************************/
inline OpRef& SelectOp::condition() {
  return operand_at(0);
}
inline OpRef& SelectOp::true_value() {
  return operand_at(1);
}
inline OpRef& SelectOp::false_value() {
  return operand_at(2);
}

inline const OpRef& SelectOp::condition() const {
  return operand_at(0);
}
inline const OpRef& SelectOp::true_value() const {
  return operand_at(1);
}
inline const OpRef& SelectOp::false_value() const {
  return operand_at(2);
}

/***************************************************
 * ICmpOp                                          *
 ***************************************************/
inline ICmpOpcode ICmpOp::comparison() const {
  return static_cast<ICmpOpcode>(aux_data());
}

inline bool ICmpOp::is_signed() const {
  auto aux = aux_data();
  return aux < static_cast<uint16_t>(ICmpOpcode::EQ) && (aux & (1 << 2));
}
inline bool ICmpOp::is_unsigned() const {
  auto aux = aux_data();
  return aux < static_cast<uint16_t>(ICmpOpcode::EQ) && !(aux & (1 << 2));
}

/***************************************************
 * FCmpOp                                          *
 ***************************************************/
inline FCmpOpcode FCmpOp::comparison() const {
  return static_cast<FCmpOpcode>(aux_data());
}

inline bool FCmpOp::is_ordered() const {
  return aux_data() & 010;
}
inline bool FCmpOp::is_unordered() const {
  return !is_ordered();
}

/***************************************************
 * AllocOp                                         *
 ***************************************************/
inline OpRef AllocOp::size() const {
  return operand_at(0);
}

inline OpRef& AllocOp::default_value() {
  return operand_at(1);
}
inline const OpRef& AllocOp::default_value() const {
  return operand_at(1);
}

/***************************************************
 * LoadOp                                          *
 ***************************************************/
inline OpRef& LoadOp::data() {
  return operand_at(0);
}
inline const OpRef& LoadOp::data() const {
  return operand_at(0);
}

inline OpRef& LoadOp::offset() {
  return operand_at(1);
}
inline const OpRef& LoadOp::offset() const {
  return operand_at(1);
}

/***************************************************
 * StoreOp                                         *
 ***************************************************/
inline OpRef StoreOp::size() const {
  return llvm::cast<ArrayBase>(*data()).size();
}

inline OpRef& StoreOp::data() {
  return operand_at(0);
}
inline const OpRef& StoreOp::data() const {
  return operand_at(0);
}

inline OpRef& StoreOp::offset() {
  return operand_at(1);
}
inline const OpRef& StoreOp::offset() const {
  return operand_at(1);
}

inline OpRef& StoreOp::value() {
  return operand_at(2);
}
inline const OpRef& StoreOp::value() const {
  return operand_at(2);
}

/***************************************************
 * FixedArray                                      *
 ***************************************************/
inline PersistentArray<OpRef>& FixedArray::data() {
  return std::get<PersistentArray<OpRef>>(inner_);
}
inline const PersistentArray<OpRef>& FixedArray::data() const {
  return std::get<PersistentArray<OpRef>>(inner_);
}

inline OpRef FixedArray::size() const {
  return ConstantInt::Create(llvm::APInt(type().bitwidth(), data().size()));
}

inline size_t FixedArray::num_operands() const {
  return data().size();
}

inline OpRef& FixedArray::operand_at(size_t i) {
  return std::get<PersistentArray<OpRef>>(inner_).element_reference(i);
}
inline const OpRef& FixedArray::operand_at(size_t i) const {
  return data().get(i);
}

/***************************************************
 * classof method function impls                   *
 ***************************************************/
#define CAFFEINE_OP_DECL_CLASSOF(derived, opcode_)                             \
  inline bool derived::classof(const Operation* op) {                          \
    return op->opcode() == Operation::opcode_;                                 \
  }                                                                            \
  static_assert(true)

CAFFEINE_OP_DECL_CLASSOF(ConstantInt, ConstantInt);
CAFFEINE_OP_DECL_CLASSOF(ConstantFloat, ConstantFloat);
CAFFEINE_OP_DECL_CLASSOF(ConstantArray, ConstantArray);
CAFFEINE_OP_DECL_CLASSOF(SelectOp, Select);
CAFFEINE_OP_DECL_CLASSOF(AllocOp, Alloc);
CAFFEINE_OP_DECL_CLASSOF(LoadOp, Load);
CAFFEINE_OP_DECL_CLASSOF(StoreOp, Store);
CAFFEINE_OP_DECL_CLASSOF(Undef, Undef);
CAFFEINE_OP_DECL_CLASSOF(FixedArray, FixedArray);

inline bool Constant::classof(const Operation* op) {
  return op->opcode() == ConstantNamed || op->opcode() == ConstantNumbered;
}
inline bool BinaryOp::classof(const Operation* op) {
  return BinaryOpFirst <= op->opcode() && op->opcode() <= BinaryOpLast;
}
inline bool UnaryOp::classof(const Operation* op) {
  return UnaryOpFirst <= op->opcode() && op->opcode() <= UnaryOpLast;
}
inline bool ICmpOp::classof(const Operation* op) {
  return detail::opcode(icmp_base, 0, 0) <= op->opcode() &&
         op->opcode() <= detail::opcode(icmp_base, 3, 0xF);
}
inline bool FCmpOp::classof(const Operation* op) {
  return detail::opcode(fcmp_base, 0, 0) <= op->opcode() &&
         op->opcode() <= detail::opcode(fcmp_base, 3, 0xF);
}

inline bool ArrayBase::classof(const Operation* op) {
  return op->opcode() == Alloc || op->opcode() == Store ||
         op->opcode() == FixedArray;
}

#undef CAFFEINE_OP_DECL_CLASSOF

/***************************************************
 * hashing implementations                         *
 ***************************************************/
llvm::hash_code hash_value(const Operation& op);
llvm::hash_code hash_value(const Symbol& symbol);

} // namespace caffeine

namespace std {

template <>
struct hash<caffeine::Operation> {
  std::size_t operator()(const caffeine::Operation& op) const noexcept {
    return static_cast<std::size_t>(caffeine::hash_value(op));
  }
};

} // namespace std

namespace magic_enum::customize {

template <>
struct enum_range<caffeine::Operation::Opcode> {
  static constexpr int16_t min = 0;
  static constexpr int16_t max = caffeine::Operation::Opcode::OpLast;

  static_assert(caffeine::Operation::Opcode::OpLast < INT16_MAX,
                "Opcode max opcode number must be less than INT16_MAX");
};

} // namespace magic_enum::customize

#endif
