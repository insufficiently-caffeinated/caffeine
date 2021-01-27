#ifndef CAFFEINE_IR_MATCHING_H
#define CAFFEINE_IR_MATCHING_H

#include "caffeine/IR/Operation.h"

namespace caffeine {
namespace matching {

  /**
   * Matching protocol:
   *
   * Every matching object exposes two methods:
   *  - bool matches(<ast node>) const
   *  - void on_match(<ast node>) const
   *
   * These methods are used to first check whether a match would occur and then
   * record whatever information is needed by the caller.
   *
   * Matchers can assume that on_match will only be passed ast nodes for which
   * matches returned true. Furthermore, they should
   */

  struct RefOperationMatcher {
  private:
    ref<Operation>* output;

  public:
    RefOperationMatcher(ref<Operation>& output) : output(&output) {}

    bool matches(const ref<Operation>&) const {
      return true;
    }
    void on_match(const ref<Operation>& op) const {
      *output = op;
    }
  };

  /**
   * There's a special case for ref<Operation> arguments since they don't have
   * the required methods but we'd like to use them as captures.
   */
  template <typename T>
  using MatcherImpl = std::conditional_t<std::is_same_v<T, ref<Operation>>,
                                         RefOperationMatcher, T>;

  /**
   * Matches any expression node and optionally captures a reference to that
   * expression node.
   *
   * This is more or less the simplest possible matcher.
   */
  struct Any {
    Any() = default;

    bool matches(const ref<Operation>&) const {
      return true;
    }
    void on_match(const ref<Operation>&) const {}
  };

  /**
   * Match a binary operation with a defined opcode.
   */
  template <Operation::Opcode opcode, typename M1, typename M2>
  class BinaryOpMatcher {
  private:
    MatcherImpl<M1> lhs;
    MatcherImpl<M2> rhs;

    static_assert(detail::opcode_nargs(opcode) == 2,
                  "Opcode was not a binary operation");

  public:
    template <typename T1, typename T2>
    BinaryOpMatcher(T1&& lhs, T2&& rhs)
        : lhs(std::forward<T1>(lhs)), rhs(std::forward<T2>(rhs)) {}

    bool matches(const ref<Operation>& op) const {
      if (op->opcode() != static_cast<uint16_t>(opcode))
        return false;

      return lhs.matches(op->operand_at(0)) && rhs.matches(op->operand_at(1));
    }
    void on_match(const ref<Operation>& op) const {
      lhs.on_match(op->operand_at(0));
      rhs.on_match(op->operand_at(1));
    }
  };

  /**
   * Match a unary operation with a defined opcode.
   */
  template <Operation::Opcode opcode, typename M>
  class UnaryOpMatcher {
  private:
    MatcherImpl<M> inner;

    static_assert(detail::opcode_nargs(opcode) == 1,
                  "Opcode was not a unary operation");

  public:
    template <typename T>
    UnaryOpMatcher(T&& inner) : inner(std::forward<T>(inner)) {}

    bool matches(const ref<Operation>& op) const {
      if (op->opcode() != static_cast<uint16_t>(opcode))
        return false;

      return inner.matches(op->operand_at(0));
    }
    void on_match(const ref<Operation>& op) const {
      inner.on_match(op->operand_at(0));
    }
  };

  // Note: We define an extra (unnecessary) type here so that error messages at
  //       least contain the names of the opcodes they're matching against.
  //
  // However, we put them in an internal namespace so that they don't pollute
  // the actual public interface.
#define CAFFEINE_DECL_UNOP_MATCHER(name, opcode)                               \
  namespace detail {                                                           \
    template <typename M>                                                      \
    struct name##Matcher : public UnaryOpMatcher<(opcode), M> {                \
      using UnaryOpMatcher<(opcode), M>::UnaryOpMatcher;                       \
    };                                                                         \
  }                                                                            \
  template <typename M>                                                        \
  detail::name##Matcher<std::decay_t<M>> name(M&& op) {                        \
    return detail::name##Matcher<std::decay_t<M>>(std::forward<M>(op));        \
  }                                                                            \
  static_assert(true)

#define CAFFEINE_DECL_BINOP_MATCHER(name, opcode)                              \
  namespace detail {                                                           \
    template <typename M1, typename M2>                                        \
    struct name##Matcher : public BinaryOpMatcher<(opcode), M1, M2> {          \
      using BinaryOpMatcher<(opcode), M1, M2>::BinaryOpMatcher;                \
    };                                                                         \
  }                                                                            \
  template <typename M1, typename M2>                                          \
  detail::name##Matcher<std::decay_t<M1>, std::decay_t<M2>> name(M1&& lhs,     \
                                                                 M2&& rhs) {   \
    return detail::name##Matcher<std::decay_t<M1>, std::decay_t<M2>>(          \
        std::forward<M1>(lhs), std::forward<M2>(rhs));                         \
  }                                                                            \
  static_assert(true)

  CAFFEINE_DECL_BINOP_MATCHER(Add, Operation::Add);
  CAFFEINE_DECL_BINOP_MATCHER(Sub, Operation::Sub);
  CAFFEINE_DECL_BINOP_MATCHER(Mul, Operation::Mul);
  CAFFEINE_DECL_BINOP_MATCHER(UDiv, Operation::UDiv);
  CAFFEINE_DECL_BINOP_MATCHER(SDiv, Operation::SDiv);
  CAFFEINE_DECL_BINOP_MATCHER(URem, Operation::URem);
  CAFFEINE_DECL_BINOP_MATCHER(SRem, Operation::SRem);

  CAFFEINE_DECL_BINOP_MATCHER(And, Operation::And);
  CAFFEINE_DECL_BINOP_MATCHER(Or, Operation::Or);
  CAFFEINE_DECL_BINOP_MATCHER(Xor, Operation::Xor);
  CAFFEINE_DECL_BINOP_MATCHER(Shl, Operation::Shl);
  CAFFEINE_DECL_BINOP_MATCHER(LShr, Operation::LShr);
  CAFFEINE_DECL_BINOP_MATCHER(AShr, Operation::AShr);

  CAFFEINE_DECL_BINOP_MATCHER(FAdd, Operation::FAdd);
  CAFFEINE_DECL_BINOP_MATCHER(FSub, Operation::FSub);
  CAFFEINE_DECL_BINOP_MATCHER(FMul, Operation::FMul);
  CAFFEINE_DECL_BINOP_MATCHER(FDiv, Operation::FDiv);
  CAFFEINE_DECL_BINOP_MATCHER(FRem, Operation::FRem);

  CAFFEINE_DECL_UNOP_MATCHER(Not, Operation::Not);
  CAFFEINE_DECL_UNOP_MATCHER(FNeg, Operation::FNeg);
  CAFFEINE_DECL_UNOP_MATCHER(FIsNaN, Operation::FIsNaN);

  CAFFEINE_DECL_UNOP_MATCHER(Trunc, Operation::Trunc);
  CAFFEINE_DECL_UNOP_MATCHER(SExt, Operation::SExt);
  CAFFEINE_DECL_UNOP_MATCHER(ZExt, Operation::ZExt);
  CAFFEINE_DECL_UNOP_MATCHER(FpTrunc, Operation::FpTrunc);
  CAFFEINE_DECL_UNOP_MATCHER(FpExt, Operation::FpExt);
  CAFFEINE_DECL_UNOP_MATCHER(FpToUI, Operation::FpToUI);
  CAFFEINE_DECL_UNOP_MATCHER(FpToSI, Operation::FpToSI);
  CAFFEINE_DECL_UNOP_MATCHER(UIToFp, Operation::UIToFp);
  CAFFEINE_DECL_UNOP_MATCHER(SIToFp, Operation::SIToFp);
  CAFFEINE_DECL_UNOP_MATCHER(Bitcast, Operation::Bitcast);

#undef CAFFEINE_DECL_UNOP_MATCHER
#undef CAFFEINE_DECL_BINOP_MATCHER

} // namespace matching

template <typename Matcher>
bool matches(const ref<Operation>& op, const Matcher& matcher) {
  bool is_match = matcher.matches(op);
  if (is_match)
    matcher.on_match(op);
  return is_match;
}

} // namespace caffeine

#endif
