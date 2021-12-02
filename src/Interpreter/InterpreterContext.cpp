
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

namespace caffeine {

InterpreterContext::ContextQueueEntry::ContextQueueEntry(Context&& ctx)
    : context(std::move(ctx)) {}

Context& InterpreterContext::context() {
  return entry_->context;
}
const Context& InterpreterContext::context() const {
  return entry_->context;
}

const CaffeineContext& InterpreterContext::caffeine() const {
  return *shared_;
}

llvm::Module* InterpreterContext::getModule() const {
  return context().mod;
}

llvm::Function* InterpreterContext::getCurrentFunction() const {
  const auto& ctx = context();
  if (ctx.stack.empty())
    return nullptr;

  const auto& frame = ctx.stack_top();
  if (frame.is_regular()) {
    return frame.get_regular().current_block->getParent();
  }

  return frame.get_external()->func;
}

llvm::Instruction* InterpreterContext::getCurrentInstruction() const {
  const auto& ctx = context();
  if (ctx.stack.empty())
    return nullptr;

  const auto& frame = ctx.stack_top();
  if (frame.is_external())
    return nullptr;

  const auto& regular = frame.get_regular();
  if (regular.current == regular.current_block->begin()) {
    if (!regular.prev_block)
      return nullptr;

    return regular.prev_block->getTerminator();
  }

  return &*std::prev(regular.current);
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

Pointer InterpreterContext::allocate(const OpRef& size, const OpRef& align,
                                     const OpRef& data, unsigned address_space,
                                     AllocationKind kind,
                                     AllocationPermissions perms) {
  const llvm::DataLayout& layout = getModule()->getDataLayout();
  unsigned ptr_width = layout.getPointerSizeInBits(address_space);

  AllocId alloc = context().heaps[address_space].allocate(
      size, align, data, kind, perms, context());

  // Alloca allocations are meant to be automatically cleaned up at the end of
  // the frame. For this to happen we need to add it to the clean-up list within
  // the current stack frame.
  if (kind == AllocationKind::Alloca) {
    // TODO: Make this work with external functions
    context().stack_top().get_regular().allocations.emplace_back(alloc,
                                                                 address_space);
  }

  return Pointer(alloc, ConstantInt::CreateZero(ptr_width), address_space);
}

Pointer InterpreterContext::allocate_repeated(
    const OpRef& size, const OpRef& align, const OpRef& byte,
    unsigned address_space, AllocationKind kind, AllocationPermissions perms) {
  return allocate(size, align, AllocOp::Create(size, byte), address_space, kind,
                  perms);
}

void InterpreterContext::jump_to(llvm::BasicBlock* block) {
  CAFFEINE_ASSERT(!context().stack.empty());
  CAFFEINE_ASSERT(
      block->getParent() == getCurrentFunction(),
      "attempted to jump to basic block not within the current function");
  CAFFEINE_ASSERT(context().stack_top().is_regular());

  context().stack_top().get_regular().jump_to(block);
}

void InterpreterContext::jump_return(std::optional<LLVMValue> retval) {
  CAFFEINE_ASSERT(!context().stack.empty());

  if (auto inst = getCurrentInstruction()) {
    CAFFEINE_ASSERT(
        llvm::isa<llvm::CallInst>(inst) || llvm::isa<llvm::InvokeInst>(inst),
        "called jump_return when the previous instruction was not a "
        "call/invoke instruction");
  }

  context().stack_top().set_result(std::move(retval), std::nullopt);
}

void InterpreterContext::jump_resume(const LLVMValue& resume) {
  CAFFEINE_ASSERT(!context().stack.empty());

  if (auto inst = getCurrentInstruction()) {
    if (llvm::isa<llvm::CallInst>(inst)) {
      fail("attempted to unwind from a function call made using the 'call' "
           "instruction.");
      return;
    }

    CAFFEINE_ASSERT(llvm::isa<llvm::InvokeInst>(inst),
                    "called jump_ret when the previous instruction was not a "
                    "call/invoke instruction");
  }

  context().stack_top().set_result(std::nullopt, resume);
}

void InterpreterContext::function_return(std::optional<LLVMValue> retval) {
  if (getCurrentFunction() &&
      getCurrentFunction()->getReturnType()->isVoidTy()) {
    CAFFEINE_ASSERT(!retval.has_value());
  } else {
    CAFFEINE_ASSERT(retval.has_value());
  }

  auto& ctx = context();
  ctx.pop();

  if (ctx.stack.empty()) {
    kill();
    return;
  }

  ctx.stack_top().set_result(retval, std::nullopt);
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
    shared_->policy()->on_path_complete(context(), ExecutionPolicy::Fail,
                                        checked);
  }

  add_assertion(assertion);
}

void InterpreterContext::assert_ptr_valid(const Pointer& ptr,
                                          const OpRef& width,
                                          std::string_view message) {
  auto& ctx = context();
  auto assertion = !ctx.heaps.check_valid(ptr, width);
  auto result = resolve(assertion);

  if (result == SolverResult::SAT) {
    emit_failure(message, result.model(), assertion);
    set_dead(ExecutionPolicy::Fail, assertion);
  }
}
void InterpreterContext::assert_ptr_valid(const Pointer& ptr, uint32_t width,
                                          std::string_view message) {
  assert_ptr_valid(
      ptr,
      ConstantInt::Create(llvm::APInt(ptr.offset()->type().bitwidth(), width)),
      message);
}

llvm::SmallVector<Pointer, 1>
InterpreterContext::resolve_ptr(const Pointer& ptr, uint32_t width,
                                std::string_view message) {
  return resolve_ptr(
      ptr,
      ConstantInt::Create(llvm::APInt(ptr.offset()->type().bitwidth(), width)),
      message);
}
llvm::SmallVector<Pointer, 1>
InterpreterContext::resolve_ptr(const Pointer& ptr, const OpRef& width,
                                std::string_view message) {
  assert_ptr_valid(ptr, width, message);

  if (is_dead())
    return {};

  return context().heaps.resolve(solver(), ptr, context());
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
  set_dead(ExecutionPolicy::Dead);
}

void InterpreterContext::fail(std::string_view message) {
  if (is_dead())
    return;

  auto result = resolve();
  if (result == SolverResult::SAT) {
    emit_failure(message, result.model(), Assertion::constant(true));
  }

  set_dead(ExecutionPolicy::Fail);
}

void InterpreterContext::emit_failure(std::string_view message,
                                      const Model* model,
                                      const Assertion& assertion) {
  shared_->logger()->log_failure(model, context(), Failure(assertion, message));
}

void InterpreterContext::set_dead(ExecutionPolicy::ExitStatus status,
                                  const Assertion& assertion) {
  entry_->dead = true;
  shared_->policy()->on_path_complete(context(), status, assertion);
}

void InterpreterContext::call_external_function(
    std::unique_ptr<ExternalStackFrame>&& frame) {
  context().stack.push_back(StackFrame(std::move(frame)));
}

InterpreterContext::InterpreterContext(BackingList* queue, size_t entry_index,
                                       const std::shared_ptr<Solver>& solver,
                                       CaffeineContext* shared)
    : queue_(queue), entry_(queue->at(entry_index).get()), shared_(shared),
      solver_(solver) {
  CAFFEINE_ASSERT(queue_);
  CAFFEINE_ASSERT(shared_);
  CAFFEINE_ASSERT(solver_);
  CAFFEINE_ASSERT(!queue_->empty());
}

} // namespace caffeine
