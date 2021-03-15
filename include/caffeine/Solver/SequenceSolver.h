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

  SolverResult check(std::vector<Assertion>& assertions,
                     const Assertion& extra) override {
    return check_internal<0>(assertions, extra);
  }

  std::unique_ptr<Model> resolve(std::vector<Assertion>& assertions,
                                 const Assertion& extra) override {
    return resolve_internal<0>(assertions, extra);
  }

private:
  template <size_t i>
  SolverResult check_internal(std::vector<Assertion>& assertions,
                              const Assertion& extra) {
    SolverResult result = std::get<i>(solvers).check(assertions, extra);
    if (result != SolverResult::Unknown)
      return result;

    if constexpr (i != sizeof...(Ts) - 1) {
      return check_internal<i + 1>(assertions, extra);
    } else {
      return SolverResult::Unknown;
    }
  }

  template <size_t i>
  std::unique_ptr<Model> resolve_internal(std::vector<Assertion>& assertions,
                                          const Assertion& extra) {
    std::unique_ptr<Model> model =
        std::get<i>(solvers).resolve(assertions, extra);
    if (model->result() != SolverResult::Unknown)
      return model;

    if constexpr (i != sizeof...(Ts) - 1) {
      return resolve_internal<i + 1>(assertions, extra);
    } else {
      return std::make_unique<EmptyModel>(SolverResult::Unknown);
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
