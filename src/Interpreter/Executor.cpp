#include "caffeine/Interpreter/Executor.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <boost/range/algorithm/remove_if.hpp>
#include <thread>
#include <z3++.h>

namespace caffeine {

void Executor::run_worker() {
  auto solver = builder->build();
  InterpreterContext::BackingList queue;
  InterpreterContext::SharedData shared{logger, policy};

  while (auto ctx = store->next_context()) {
    queue.clear();
    queue.push_back(std::make_unique<InterpreterContext::ContextQueueEntry>(
        std::move(ctx.value())));

    auto guard =
        UnsupportedOperation::SetCurrentContext(&queue.front()->context);

    while (!queue.empty()) {
      guard.update(&queue.front()->context);

      InterpreterContext ictx{&queue, 0, solver, &shared};

      try {
        Interpreter interp{policy, store, logger, &ictx, solver};
        interp.execute();
      } catch (UnsupportedOperationException&) {
        // The assert that threw this already printed an error message
        // TODO: We should have a better way to indicate that this failed to the
        //       parent program.

        logger->log_failure(
            nullptr, ctx.value(),
            Failure(Assertion(), "internal error: unsupported operation"));
        break;
      }

      auto it = boost::remove_if(queue,
                                 [](const auto& entry) { return entry->dead; });
      queue.erase(it, queue.end());

      while (queue.size() > 1) {
        store->add_context(std::move(queue.back()->context));
        queue.pop_back();
      }
    }
  }
}

Executor::Executor(ExecutionPolicy* policy, ExecutionContextStore* store,
                   FailureLogger* logger, const SolverBuilder* builder,
                   const ExecutorOptions& options)
    : policy(policy), store(store), logger(logger), builder(builder),
      options(options) {}

void Executor::run() {
  if (options.num_threads == 1) {
    run_worker();
    return;
  }

  std::vector<std::thread> threads;

  for (uint32_t i = 0; i < options.num_threads; i++) {
    threads.emplace_back([&] { run_worker(); });
  }

  for (auto& thread : threads) {
    thread.join();
  }
}

} // namespace caffeine
