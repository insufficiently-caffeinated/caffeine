#ifndef CAFFEINE_IR_MATCHING_H
#define CAFFEINE_IR_MATCHING_H

#include "caffeine/IR/Operation.h"

namespace caffeine {
namespace matching {

  /**
   * Writing a Matcher
   * =================
   * Every matching object exposes two methods:
   *  - bool matches(const ref<Operation>&) const
   *    Returns true if the provided operation node satisfies the current
   *    matcher.
   *  - void on_match(const ref<Operation>&) const
   *    Does whatever processing the current matcher decides to do when a match
   *    occurs. Usually this will be something like saving captured variables.
   *    This method will always be called with an expression node for which
   *    matches returned true.
   *
   * For an example of a simple matcher, check out RefOperationMatcher (right
   * below this comment).
   *
   * If the matcher doesn't need to be generic (no need for sub-matchers on
   * internal elements) then just following the above should be enough. However,
   * if you're implementing one that will be used as part of a tree of matchers
   * (like BinaryOpMatcher) then there's a few more details to what you need to
   * do.
   *
   * For convenience reasons, we'd like to be able to do
   *
   *    ref<Operation> first, second;
   *    if (matches(<expr>, Add(first, second))) {
   *       // do things with first and second
   *    }
   *
   * and have first and second be set to the expression nodes that were matched
   * against. However, ref<Operation> doesn't implement the protocol (and you'd
   * need a reference anyway). To work around this matchers use the MatcherImpl
   * type internally. This is a template which resolves to T unless T is a
   * ref<Operation> in which case it resolves to RefOperationMatcher.
   *
   * For an example of how this used check out UnaryOpMatcher. Custom matchers
   * should be implemented along the same lines.
   */

  /**
   * Matcher to capture an expression tree node.
   */
  struct RefOperationMatcher {
  private:
    ref<Operation>* output;

  public:
    RefOperationMatcher(ref<Operation>& output) : output(&output) {}
    RefOperationMatcher(ref<Operation>* output) : output(output) {}

    bool matches(const ref<Operation>&) const {
      return true;
    }
    void on_match(const ref<Operation>& op) const {
      *output = op;
    }
  };

  namespace detail {
    /**
     * Effectively acts as a type-based match statement.
     * Works like this
     *  select<
     *    T,
     *    std::pair<A, B>,
     *    std::pair<C, D>,
     *    E
     * >::type
     *
     * This boils down to a type-level
     *        if T == A { return B; }
     *   else if T == C { return D; }
     *   else           { return E; }
     */
    template <typename U, typename... Ts>
    struct select;

    template <typename T, typename P1, typename P2, typename... Ts>
    struct select<T, std::pair<P1, P2>, Ts...> {
      using type = std::conditional_t<std::is_same_v<T, P1>, P2,
                                      typename select<T, Ts...>::type>;
    };

    template <typename T, typename U>
    struct select<T, U> {
      using type = U;
    };
  } // namespace detail

  // clang-format off
  // Using custom formatting since it makes things more understandable.
  /**
   * There's a special case for ref<Operation> arguments since they don't have
   * the required methods but we'd like to use them as captures.
   */
  template <typename T>
  using MatcherImpl = typename detail::select<T, 
    std::pair<ref<Operation>, RefOperationMatcher>,
    std::pair<ref<Operation>*, RefOperationMatcher>,
    T
  >::type;
  // clang-format on

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

    static_assert(caffeine::detail::opcode_nargs(opcode) == 2,
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

    static_assert(caffeine::detail::opcode_nargs(opcode) == 1,
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
