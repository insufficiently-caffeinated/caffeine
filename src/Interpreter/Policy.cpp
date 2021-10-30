#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Context.h"

namespace caffeine {

void ExecutionPolicy::on_path_forked(Context&) {}
void ExecutionPolicy::on_path_dequeued(Context&) {}
void ExecutionPolicy::on_path_complete(const Context&, ExitStatus,
                                       const Assertion&) {
  notify_context_finished();
}

bool AlwaysAllowExecutionPolicy::should_queue_path(const Context&) {
  return true;
}

} // namespace caffeine
