#ifndef CAFFEINE_SOLVER_SOLVER_H
#define CAFFEINE_SOLVER_SOLVER_H

#include <functional>
#include <iosfwd>
#include <memory>
#include <vector>

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
class ModelEvaluator;

/**
 * A set of concrete value assignments to constants that satisfy the set of
 * assertions passed to a solver.
 */
class Model {
public:
  Model() = default;
  virtual ~Model() = default;

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
  friend class ModelEvaluator;
};

/**
 * Result returned from a solver query.
 *
 * A SolverResult is composed of a satisfiability result (either SAT, UNSAT, or
 * unknown) and, optionally, a model containing assignments to the various
 * symbolic constants contained within the assertions in the solver query.
 *
 * However, it is only valid for a SolverResult instance to contain a model if
 * the instance itself is SAT. Note that having a working model in any other
 * case would be a contradiction. To avoid bugs, the constructor will assert if
 * it is called with a model and a result other than SAT.
 */
class SolverResult {
public:
  enum Kind { UNSAT, SAT, Unknown };

public:
  SolverResult(Kind kind, std::unique_ptr<Model> model = nullptr);

  bool operator==(Kind kind) const;
  bool operator!=(Kind kind) const;

  Kind kind() const;
  // Get the model associated with this SolverResult. If this result doesn't
  // contain a model then returns nullptr.
  const Model* model() const;

  /**
   * Evaluate an expression using this model. Returns an appropriate constant
   * expression (i.e. is_constant returns true) with the value of said constant.
   *
   * It is invalid to call this method if the result does not contain a model.
   *
   * Usage: end users should use this method in order to get the value of an
   * expression in the given model.
   */
  Value evaluate(const Operation& expr) const;
  Value evaluate(const LLVMScalar& expr, Context& ctx) const;
  Value evaluate(const LLVMValue& expr, Context& ctx) const;

private:
  Kind kind_;
  std::unique_ptr<Model> model_;
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
   * if it isn't empty, is satisfiable and return a model. This is fairly
   * similar to check with the exception that it _must_ return a model if the
   * SolverResult is SAT.
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
   */
  virtual SolverResult resolve(AssertionList& assertions,
                               const Assertion& extra) = 0;
  // Calls resolve with an empty extra assertion.
  SolverResult resolve(AssertionList& assertions);

  Solver(const Solver&) = default;
  Solver(Solver&&) = default;

  Solver& operator=(const Solver&) = default;
  Solver& operator=(Solver&&) = default;
};

/**
 * Base class for solvers which perform transformations.
 */
class TransformSolver : public Solver {
public:
  TransformSolver(const std::shared_ptr<Solver>& base);

protected:
  /**
   * Perform some transformation on the list of assertions.
   *
   * This method may return either UNSAT or Unknown. If it returns UNSAT then no
   * lower solvers will be invoked and UNSAT will be returned, otherwise if it
   * returns Unknown then the modified list of assertions will passed onto the
   * inner query.
   */
  virtual SolverResult::Kind transform(AssertionList& assertions,
                                       const Assertion& extra) = 0;

protected:
  SolverResult check(AssertionList& assertions,
                     const Assertion& extra) override;
  SolverResult resolve(AssertionList& assertions,
                       const Assertion& extra) override;

protected:
  std::shared_ptr<Solver> base;
};

class SolverBuilder {
public:
  using BaseFn = std::function<std::shared_ptr<Solver>()>;
  using InterFn =
      std::function<std::shared_ptr<Solver>(const std::shared_ptr<Solver>&)>;

private:
  BaseFn base;
  std::vector<InterFn> stack;

public:
  // Create a solver with the initial bottom-level solver.
  SolverBuilder(const BaseFn& base);

  static SolverBuilder with_default();

  // Add a new solver to the top of the solver stack.
  SolverBuilder& with(const InterFn& func);

  template <typename T>
  SolverBuilder& with() {
    return with([](const std::shared_ptr<Solver>& solver) {
      return std::make_shared<T>(solver);
    });
  }

  // Build the full solver.
  //
  // This can be called from multiple threads safely provided all the individual
  // consructor functions are thread-safe.
  std::shared_ptr<Solver> build() const;
};

std::ostream& operator<<(std::ostream& os, const SolverResult& res);

} // namespace caffeine

#endif
