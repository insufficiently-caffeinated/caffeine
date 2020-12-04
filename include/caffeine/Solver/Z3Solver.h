#ifndef CAFFEINE_SOLVER_Z3_H
#define CAFFEINE_SOLVER_Z3_H

#include "caffeine/Solver/Solver.h"

#include <memory>

namespace z3 {
class context;
}

namespace caffeine {

class Model;
class Assertion;

class Z3Solver : public Solver {
private:
  // Use a unique_ptr here so we don't have to include z3++.h
  std::unique_ptr<z3::context> ctx;

public:
  Z3Solver();
  ~Z3Solver();

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
                                 const Assertion& extra) override;
};

} // namespace caffeine
#endif
