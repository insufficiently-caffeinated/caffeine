#ifndef CAFFEINE_SOLVER_Z3_H
#define CAFFEINE_SOLVER_Z3_H

#include <memory>
#include <z3++.h>

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Value.h"
#include "caffeine/IR/Visitor.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

class Z3OpVisitor : public ConstOpVisitor<Z3OpVisitor, z3::expr> {
  z3::context* ctx;
  std::map<std::string, z3::expr*>& constMap;

public:
  Z3OpVisitor(z3::context* ctx, std::map<std::string, z3::expr*>& constMap);

  // clang-format off
  z3::expr visitConstant     (const Constant& op);
  z3::expr visitConstantInt  (const ConstantInt& op);
  z3::expr visitConstantFloat(const ConstantFloat& op);

  // Binary operations
  z3::expr visitAdd (const BinaryOp& op);
  z3::expr visitSub (const BinaryOp& op);
  z3::expr visitMul (const BinaryOp& op);
  z3::expr visitUDiv(const BinaryOp& op);
  z3::expr visitSDiv(const BinaryOp& op);
  z3::expr visitURem(const BinaryOp& op);
  z3::expr visitSRem(const BinaryOp& op);
  z3::expr visitAnd (const BinaryOp& op);
  z3::expr visitOr  (const BinaryOp& op);
  z3::expr visitXor (const BinaryOp& op);
  z3::expr visitShl (const BinaryOp& op);
  z3::expr visitLShr(const BinaryOp& op);
  z3::expr visitAShr(const BinaryOp& op);
  z3::expr visitFAdd(const BinaryOp& op);
  z3::expr visitFSub(const BinaryOp& op);
  z3::expr visitFMul(const BinaryOp& op);
  z3::expr visitFDiv(const BinaryOp& op);
  z3::expr visitFRem(const BinaryOp& op);

  z3::expr visitICmp(const ICmpOp& op);
  z3::expr visitFCmp(const FCmpOp& op);

  // Unary operations
  z3::expr visitNot (const UnaryOp& op);
  z3::expr visitFNeg(const UnaryOp& op);
  // clang-format on
};

class Z3Model : public Model {
protected:
  z3::context* ctx;
  z3::model model;
  std::map<std::string, z3::expr*> constants;

public:
  Z3Model(SolverResult, z3::context*, z3::model,
          std::map<std::string, z3::expr*>);
  /**
   * Evaluate an expression using this model. Returns an appropriate constant
   * expression (i.e. is_constant returns true) with the value of said constant.
   *
   * It is invalid to call this method if the model is not SAT.
   */
  Value evaluate(const ref<Operation>& expr) const;

  /**
   * Look up the value of a symbolic constant in this model. Returns an
   * appropriate constant expression with the value of said constant.
   *
   * If there are no constants with the given name then returns a null pointer.
   *
   * It is invalid to call this method if the model is not SAT.
   */
  Value lookup(const Constant& constant) const;
}; // class Z3Model

class Z3Solver : public Solver {
  z3::context ctx;

public:
  Z3Solver();

  /**
   * Validate whether the set of assertions combined with the extra assertion,
   * if it isn't empty, is satisfiable.
   *
   * Solvers are free to perform any modifications to the assertions vector
   * provided as long as they
   * 1. don't change the satisfiability of the end result or the space of valid
   *    models, and
   * 2. don't incorporate any information from `extra`. As an example, if the
   *    assertion vector contains `x < 5` and `x = 2` then it would be valid to
   *    simplify that to `true` and `x = 2`. But if extra is `x = 2` then it
   *    wouldn't be valid to perform that simplification. Note, however, that
   *    the final SAT/UNSAT result should take extra into account.
   *
   * This includes modifying the backing expression trees and so on. Note that
   * care must be taken not to modify expressions that have multiple references
   * (refcount > 1) as that could modify unrelated expressions.
   *
   * Default Implementation
   * ======================
   * By default this is implemented by calling resolve and then throwing away
   * the model.
   *
   * Solver adapters should forward this method (after performing any applicable
   * modifications to the assertions) as it may be more efficient for some
   * solvers.
   */
  SolverResult check(std::vector<Assertion>& assertions,
                     const Assertion& extra);

  /**
   * Validate whether the set of assertions combined with the extra assertion,
   * if it isn't empty, is satisfiable and return a model.
   *
   * Solvers are free to perform any modifications to the assertions vector
   * provided as long as they
   * 1. don't change the satisfiability of the end result or the space of valid
   *    models, and
   * 2. don't incorporate any information from `extra`. As an example, if the
   *    assertion vector contains `x < 5` and `x = 2` then it would be valid to
   *    simplify that to `true` and `x = 2`. But if extra is `x = 2` then it
   *    wouldn't be valid to perform that simplification. Note, however, that
   *    the final SAT/UNSAT result should take extra into account.
   *
   * This includes modifying the backing expression trees and so on. Note that
   * care must be taken not to modify expressions that have multiple references
   * (refcount > 1) as that could modify unrelated expressions.
   */
  std::unique_ptr<Model> resolve(std::vector<Assertion>& assertions,
                                 const Assertion& extra);
};

} // namespace caffeine
#endif
