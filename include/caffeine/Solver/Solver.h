#ifndef CAFFEINE_SOLVER_SOLVER_H
#define CAFFEINE_SOLVER_SOLVER_H

#include <iosfwd>
#include <memory>
#include <vector>
#include <iosfwd>

#include "caffeine/ADT/Ref.h"
#include "caffeine/IR/Value.h"
#include "caffeine/Interpreter/AssertionList.h"
#include "caffeine/Interpreter/Value.h"

namespace caffeine {

class Assertion;
class Operation;
class Constant;
class Context;
class LLVMScalar;
class LLVMValue;
class Symbol;

enum SolverResult { UNSAT, SAT, Unknown };

/**
 * A set of concrete value assignments to constants that satisfy the set of
 * assertions passed to a solver.
 *
 * In the case of the model being UNSAT or Unknown there are no such possible
 * assignments and so trying to use them is an error.
 */
class Model {
private:
  SolverResult result_;

public:
  Model(SolverResult result);
  virtual ~Model() = default;

  SolverResult result() const {
    return result_;
  }

  /**
   * Evaluate an expression using this model. Returns an appropriate constant
   * expression (i.e. is_constant returns true) with the value of said constant.
   *
   * It is invalid to call this method if the model is not SAT.
   *
   * Usage: end users should use this method in order to get the value of an
   * expression in the given model.
   */
  Value evaluate(const Operation& expr) const;
  Value evaluate(const LLVMScalar& expr, Context& ctx) const;
  Value evaluate(const LLVMValue& expr, Context& ctx) const;

protected:
  /**
   * Look up the value of a symbolic constant in this model. Returns an
   * appropriate constant expression with the value of said constant. If the
   * lookup is for an array constant then size will have a value.
   *
   * If there are no constants with the given name then returns a null pointer.
   *
   * It is invalid to call this method if the model is not SAT.
   *
   * Usage: subclasses should override this method and implement appropriate
   * lookup logic. End users should use the `evaluate` method because it
   * performs the appropriate operations on the expression tree to evaluate it
   * (it uses `lookup` under the hood).
   */
  virtual Value lookup(const Symbol& symbol,
                       std::optional<size_t> size = std::nullopt) const = 0;

  Model(const Model&) = default;
  Model(Model&&) = default;

  Model& operator=(const Model&) = default;
  Model& operator=(Model&&) = default;

  friend class ExprEvaluator;
};

/**
 * SAT solver interface.
 *
 * TODO: Better explanation of how it should usually be used.
 */
class Solver {
public:
  Solver() = default;
  virtual ~Solver() = default;

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
  virtual SolverResult check(AssertionList& assertions, const Assertion& extra);
  // Calls check with an empty extra assertion.
  SolverResult check(AssertionList& assertions);

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
  virtual std::unique_ptr<Model> resolve(AssertionList& assertions,
                                         const Assertion& extra) = 0;
  // Calls resolve with an empty extra assertion.
  std::unique_ptr<Model> resolve(AssertionList& assertions);

  Solver(const Solver&) = default;
  Solver(Solver&&) = default;

  Solver& operator=(const Solver&) = default;
  Solver& operator=(Solver&&) = default;
};

class EmptyModel final : public Model {
public:
  EmptyModel(SolverResult result);

  Value lookup(const Symbol& symbol, std::optional<size_t> size) const override;
};

std::ostream& operator<<(std::ostream& os, SolverResult res);

} // namespace caffeine

#endif
