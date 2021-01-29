#ifndef CAFFEINE_SOLVER_DECOMPSOLVER_H
#define CAFFEINE_SOLVER_DECOMPSOLVER_H

#include "caffeine/Solver/Solver.h"

namespace caffeine {

/**
 * Solver that tries to break down large but complex assertions into multiple
 * simpler ones that are equivalent to the original one.
 *
 * Always returns unknown.
 */
class DecompSolver final : public Solver {
public:
  SolverResult check(std::vector<Assertion>& assertions,
                     const Assertion& extra) override;

  std::unique_ptr<Model> resolve(std::vector<Assertion>& assertions,
                                 const Assertion& extra) override;

  DecompSolver() = default;
  DecompSolver(const DecompSolver&) = default;
  DecompSolver(DecompSolver&&) = default;
  DecompSolver& operator=(const DecompSolver&) = default;
  DecompSolver& operator=(DecompSolver&&) = default;

private:
  void transform(std::vector<Assertion>& assertions);
};

} // namespace caffeine

#endif
