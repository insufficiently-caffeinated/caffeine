#ifndef CAFFEINE_SOLVER_Z3_H
#define CAFFEINE_SOLVER_Z3_H

#include <memory>
#include <z3++.h>

#include "Solver.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Visitor.h"

namespace caffeine {

class Z3OpVisitor : public ConstOpVisitor<Z3OpVisitor, z3::expr> {
  Z3OpVisitor(z3::context *ctx, z3::solver *solver);

  // clang-format off
  z3::expr visitConstant     (Constant& op);
  z3::expr visitConstantInt  (ConstantInt& op);
  z3::expr visitConstantFloat(ConstantFloat& op);

  // Binary operations
  z3::expr visitAdd (BinaryOp& op);
  z3::expr visitSub (BinaryOp& op);
  z3::expr visitMul (BinaryOp& op);
  z3::expr visitUDiv(BinaryOp& op);
  z3::expr visitSDiv(BinaryOp& op);
  z3::expr visitURem(BinaryOp& op);
  z3::expr visitSRem(BinaryOp& op);
  z3::expr visitAnd (BinaryOp& op);
  z3::expr visitOr  (BinaryOp& op);
  z3::expr visitXor (BinaryOp& op);
  z3::expr visitShl (BinaryOp& op);
  z3::expr visitLShr(BinaryOp& op);
  z3::expr visitAShr(BinaryOp& op);
  z3::expr visitFAdd(BinaryOp& op);
  z3::expr visitFSub(BinaryOp& op);
  z3::expr visitFMul(BinaryOp& op);
  z3::expr visitFDiv(BinaryOp& op);
  z3::expr visitFRem(BinaryOp& op);

  z3::expr visitICmp(ICmpOp& op);
  z3::expr visitFCmp(FCmpOp& op);

  // Unary operations
  z3::expr visitNot (UnaryOp& op);
  z3::expr visitFNeg(UnaryOp& op);

  // clang-format on
protected:
  z3::context *ctx;
  z3::solver *solver;
};

class Z3Model : Model {
protected:
  z3::context* ctx;
  z3::model model;

public:
  Z3Model(SolverResult, z3::context*, z3::model);
  /**
   * Evaluate an expression using this model. Returns an appropriate constant
   * expression (i.e. is_constant returns true) with the value of said constant.
   *
   * It is invalid to call this method if the model is not SAT.
   */
  ref<Operation> evaluate(const ref<Operation>& expr) const;

  /**
   * Look up the value of a symbolic constant in this model. Returns an
   * appropriate constant expression with the value of said constant.
   *
   * If there are no constants with the given name then returns a null pointer.
   *
   * It is invalid to call this method if the model is not SAT.
   */
  ref<Operation> lookup(const Constant& constant) const;
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
