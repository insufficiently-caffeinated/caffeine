
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Support/UnsupportedOperation.h"

namespace caffeine {

InterpreterContext::ContextQueueEntry::ContextQueueEntry(Context&& ctx)
    : context(std::move(ctx)) {}

Context& InterpreterContext::context() {
  return entry_->context;
}
const Context& InterpreterContext::context() const {
  return entry_->context;
}

llvm::Module* InterpreterContext::getModule() const {
  return context().mod;
}

llvm::Function* InterpreterContext::getCurrentFunction() const {
  const auto& ctx = context();
  if (ctx.stack.empty())
    return nullptr;

  const auto& frame = ctx.stack_top();
  if (frame.is_regular())
    return frame.get_regular().current_block->getParent();

  CAFFEINE_UNIMPLEMENTED(
      "External stack frames do not currently have associated functions");
}

llvm::Instruction* InterpreterContext::getCurrentInstruction() const {
  const auto& ctx = context();
  if (ctx.stack.empty())
    return nullptr;

  const auto& frame = ctx.stack_top();
  if (frame.is_external())
    return nullptr;

  const auto& regular = frame.get_regular();
  if (regular.current == regular.current_block->end())
    return nullptr;
  return &*regular.current;
}

// TODO: This is basically a placeholder. We need to figure out how to deal
//       with variables in external stack frames. Note that external stack
//       frames will definitely have variables for argument values.
LLVMValue InterpreterContext::load(llvm::Value* value) {
  const auto& frame = context().stack_top();

  if (frame.is_external()) {
    CAFFEINE_UNIMPLEMENTED("Loading variables within external stack frames is "
                           "still being implemented");
  }

  return context().lookup(value);
}

void InterpreterContext::store(llvm::Value* ident, const LLVMValue& value) {
  auto& frame = context().stack_top();

  if (frame.is_external()) {
    CAFFEINE_UNIMPLEMENTED("Storing variables within external stack frames is "
                           "still being implemented");
  }

  auto& regular = frame.get_regular();
  regular.insert(ident, value);
}
void InterpreterContext::store(llvm::Value* ident, LLVMValue&& value) {
  auto& frame = context().stack_top();

  if (frame.is_external()) {
    CAFFEINE_UNIMPLEMENTED("Storing variables within external stack frames is "
                           "still being implemented");
  }

  auto& regular = frame.get_regular();
  regular.insert(ident, std::move(value));
}

const std::shared_ptr<Solver>& InterpreterContext::solver() const {
  return solver_;
}

// TODO: Should we be doing simplifications here or within AssertionList?
void InterpreterContext::add_assertion(const Assertion& assertion) {
  context().add(assertion);
}
void InterpreterContext::add_assertion(Assertion&& assertion) {
  context().add(std::move(assertion));
}

SolverResult InterpreterContext::check(const Assertion& extra) {
  return context().check(solver_, extra);
}

SolverResult InterpreterContext::resolve(const Assertion& extra) {
  return context().resolve(solver_, extra);
}

void InterpreterContext::assert_or_fail(const Assertion& assertion,
                                        std::string_view message) {
  if (is_dead())
    return;

  auto checked = !assertion;
  auto result = resolve(checked);
  if (result == SolverResult::SAT) {
    emit_failure(message, result.model(), checked);
    shared_->policy->on_path_complete(context(), ExecutionPolicy::Fail,
                                      checked);
  }

  add_assertion(assertion);
}

InterpreterContext InterpreterContext::fork() const {
  auto entry = std::make_unique<ContextQueueEntry>(context().fork_once());
  auto index = queue_->size();
  queue_->push_back(std::move(entry));

  return InterpreterContext(queue_, index, solver(), shared_);
}

InterpreterContext InterpreterContext::fork_existing(Context&& ctx) const {
  auto entry = std::make_unique<ContextQueueEntry>(std::move(ctx));
  auto index = queue_->size();
  queue_->push_back(std::move(entry));

  return InterpreterContext(queue_, index, solver(), shared_);
}

bool InterpreterContext::is_dead() const {
  return entry_->dead;
}

void InterpreterContext::kill() {
  entry_->dead = true;
  shared_->policy->on_path_complete(context(), ExecutionPolicy::Dead);
}

void InterpreterContext::fail(std::string_view message) {
  if (is_dead())
    return;

  auto result = resolve();
  if (result == SolverResult::SAT) {
    emit_failure(message, result.model(), Assertion::constant(true));
  }

  entry_->dead = true;
  shared_->policy->on_path_complete(context(), ExecutionPolicy::Fail);
}

void InterpreterContext::emit_failure(std::string_view message,
                                      const Model* model,
                                      const Assertion& assertion) {
  shared_->logger->log_failure(model, context(), Failure(assertion, message));
}

InterpreterContext::InterpreterContext(
    std::vector<std::unique_ptr<ContextQueueEntry>>* queue, size_t entry_index,
    const std::shared_ptr<Solver>& solver, SharedData* shared)
    : queue_(queue), entry_(queue_->at(entry_index).get()), shared_(shared),
      solver_(solver) {
  CAFFEINE_ASSERT(queue_);
  CAFFEINE_ASSERT(shared_);
  CAFFEINE_ASSERT(solver_);
  CAFFEINE_ASSERT(!queue_->empty());
}

} // namespace caffeine
