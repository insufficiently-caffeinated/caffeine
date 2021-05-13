#ifndef CAFFEINE_SOLVER_SEQUENCESOLVER_H
#define CAFFEINE_SOLVER_SEQUENCESOLVER_H

#include "caffeine/Solver/Solver.h"

#include <memory>
#include <tuple>
#include <type_traits>

namespace caffeine {

/**
 * Solver which calls a sequence of other solvers in series.
 *
 * If any of the solvers in the chain return a result other than Unknown then
 * execution of the sequence stops there and that result is returned. If none of
 * the solvers return a result then Unknown is returned.
 */
template <typename... Ts>
class SequenceSolver final : public Solver {
private:
  std::tuple<Ts...> solvers;

public:
  SequenceSolver(Ts&&... solvers) : solvers(std::move(solvers)...) {}
  SequenceSolver(const Ts&... solvers) : solvers(solvers...) {}

  SolverResult check(AssertionList& assertions,
                     const Assertion& extra) override {
    return do_internal<0>(
        [&](auto& solver) { return solver.check(assertions, extra); });
  }

  SolverResult resolve(AssertionList& assertions,
                       const Assertion& extra) override {
    return do_internal<0>(
        [&](auto& solver) { return solver.resolve(assertions, extra); });
  }

private:
  template <size_t i, typename F>
  SolverResult do_internal(F&& func) {
    SolverResult result = func(std::get<i>(solvers));
    if (result != SolverResult::Unknown)
      return result;

    if constexpr (i != sizeof...(Ts) - 1) {
      return do_internal<i + 1>(func);
    } else {
      return SolverResult::Unknown;
    }
  }

  static_assert(sizeof...(Ts) != 0);
  static_assert((... && std::is_base_of_v<Solver, Ts>));
};

template <typename... Ts>
std::shared_ptr<SequenceSolver<std::decay_t<Ts>...>>
make_sequence_solver(Ts&&... solvers) {
  return std::make_shared<SequenceSolver<std::decay_t<Ts>...>>(
      std::forward<Ts>(solvers)...);
}

} // namespace caffeine

#endif
