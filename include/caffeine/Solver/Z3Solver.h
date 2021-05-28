#ifndef CAFFEINE_SOLVER_Z3_H
#define CAFFEINE_SOLVER_Z3_H

#include "caffeine/Solver/Solver.h"

#include <memory>

namespace z3 {
class context;
class solver;
class expr;
} // namespace z3

namespace caffeine {

class Model;
class Assertion;

class Z3Solver : public Solver {
private:
  class Impl;

  // Use a unique_ptr here so we don't have to include z3++.h
  std::unique_ptr<Impl> impl;

public:
  Z3Solver();
  ~Z3Solver();

  Z3Solver(Z3Solver&& solver) noexcept;
  Z3Solver& operator=(Z3Solver&& solver) noexcept;

  SolverResult check(AssertionList& assertions,
                     const Assertion& extra) override;

  SolverResult resolve(AssertionList& assertions,
                       const Assertion& extra) override;

  // Evaluate an expression to a z3::expr. This is exposed for testing purposes.
  z3::context& context();
  z3::expr evaluate(const OpRef& expr, z3::solver& solver);
};

} // namespace caffeine
#endif
