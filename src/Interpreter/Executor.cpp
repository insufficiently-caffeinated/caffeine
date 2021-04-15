#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Store.h"

#include "caffeine/Solver/CanonicalizingSolver.h"
#include "caffeine/Solver/SequenceSolver.h"
#include "caffeine/Solver/SimplifyingSolver.h"
#include "caffeine/Solver/Z3Solver.h"

#include <thread>
#include <z3++.h>

namespace caffeine {

void run_worker(Executor* exec, FailureLogger* logger,
                ExecutionContextStore* store) {
  auto solver = caffeine::make_sequence_solver(caffeine::SimplifyingSolver(),
                                               caffeine::CanonicalizingSolver(),
                                               caffeine::Z3Solver());
  while (auto ctx = store->next_context()) {
    Interpreter interp(&ctx.value(), exec->policy, store, logger, solver);
    interp.execute();
  }
}

Executor::Executor(ExecutionPolicy* policy, ExecutionContextStore* store,
                   FailureLogger* logger, const ExecutorOptions& options)
    : policy(policy), store(store), logger(logger), options(options) {}

void Executor::run() {
  std::vector<std::thread> threads;

  for (uint32_t i = 0; i < options.num_threads; i++) {
    threads.emplace_back(run_worker, this, logger, store);
  }

  for (auto& thread : threads) {
    thread.join();
  }
}

} // namespace caffeine
