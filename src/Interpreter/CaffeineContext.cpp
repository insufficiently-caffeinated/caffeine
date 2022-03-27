#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Coverage.h"

namespace caffeine {

using Builder = CaffeineContext::Builder;

// Destructors must be declared in here since the header doesn't necessarily
// have the definitions for a bunch of the classes stored as pointers.
//
// This means that downstream classes don't need to include all the relevant
// headers in order to destroy a CaffeineContext.

CaffeineContext::~CaffeineContext() {}

Builder::~Builder() {}

Builder CaffeineContext::builder() {
  Builder builder;

  builder.with_default_functions();
  builder.with_default_intrinsics();

  return builder;
}

const ExternalFunction* CaffeineContext::function(std::string_view name) const {
  auto it = functions_.find(name);
  if (it == functions_.end())
    return nullptr;
  return it->second.get();
}

const ExternalFunction*
CaffeineContext::intrinsic(llvm::Intrinsic::ID id) const {
  auto it = intrinsics_.find(id);
  if (it == intrinsics_.end())
    return nullptr;
  return it->second.get();
}

ExecutionPolicy* CaffeineContext::policy() const {
  return policy_.get();
}

ExecutionContextStore* CaffeineContext::store() const {
  return store_.get();
}

FailureLogger* CaffeineContext::logger() const {
  return logger_.get();
}

const CaffeineOptions& CaffeineContext::options() const {
  return options_;
}

std::shared_ptr<Solver> CaffeineContext::build_solver() const {
  return builder_->build();
}

CoverageTracker* CaffeineContext::coverage() const {
  return cov_.get();
}

std::shared_ptr<TypeidDb> CaffeineContext::typeid_db() {
  return typeid_db_;
}

const EMatcher& CaffeineContext::matcher() const {
  return *matcher_;
}

// All builder functions

CaffeineContext Builder::build() {
  CaffeineContext ctx;
  ctx.functions_ = std::move(functions_);
  ctx.intrinsics_ = std::move(intrinsics_);
  ctx.options_ = std::move(options_);
  ctx.typeid_db_ = std::make_shared<TypeidDb>();

  if (policy_) {
    ctx.policy_ = std::move(policy_);
  } else {
    ctx.policy_ = std::make_unique<AlwaysAllowExecutionPolicy>();
  }

  if (!store_)
    throw std::logic_error("No store provided when building CaffeineContext");
  ctx.store_ = std::move(store_);
  if (!logger_)
    throw std::logic_error("No logger provided when building CaffeineContext");
  ctx.logger_ = std::move(logger_);
  ctx.cov_ = std::move(cov_);

  if (builder_) {
    ctx.builder_ = std::move(builder_);
  } else {
    ctx.builder_ =
        std::make_unique<SolverBuilder>(SolverBuilder::with_default());
  }

  auto builder = EMatcher::builder();
  builder.add_defaults();
  ctx.matcher_ = std::make_unique<EMatcher>(builder.build());

  return ctx;
}

Builder& Builder::with_policy(std::unique_ptr<ExecutionPolicy>&& policy) {
  policy_ = std::move(policy);
  return *this;
}

Builder& Builder::with_store(std::unique_ptr<ExecutionContextStore>&& store) {
  store_ = std::move(store);
  return *this;
}

Builder& Builder::with_logger(std::unique_ptr<FailureLogger>&& logger) {
  logger_ = std::move(logger);
  return *this;
}

Builder& Builder::with_function(const std::string& name,
                                std::unique_ptr<ExternalFunction>&& func) {
  auto it = functions_.find(name);
  if (it != functions_.end())
    functions_.erase(it);

  functions_.emplace(name, std::move(func));
  return *this;
}

Builder& Builder::with_intrinsic(llvm::Intrinsic::ID id,
                                 std::unique_ptr<ExternalFunction>&& func) {
  auto it = intrinsics_.find(id);
  if (it != intrinsics_.end())
    intrinsics_.erase(it);

  intrinsics_.emplace(id, std::move(func));
  return *this;
}

Builder& Builder::with_solver_builder(SolverBuilder&& builder) {
  builder_ = std::make_unique<SolverBuilder>(std::move(builder));
  return *this;
}

Builder& Builder::with_default_functions() {
  with_function("caffeine_assert", ExternalFunctions::caffeine_assert());
  with_function("caffeine_assume", ExternalFunctions::caffeine_assume());
  with_function("caffeine_builtin_resolve",
                ExternalFunctions::caffeine_builtin_resolve());
  with_function("caffeine_builtin_symbolic_alloca",
                ExternalFunctions::caffeine_builtin_symbolic_alloca());
  with_function("caffeine_calloc", ExternalFunctions::caffeine_calloc());
  with_function("caffeine_free", ExternalFunctions::caffeine_free());
  with_function("caffeine_malloc_aligned",
                ExternalFunctions::caffeine_malloc_aligned());
  with_function("caffeine_unwind_phase1",
                ExternalFunctions::caffeine_unwind_phase1());
  with_function("caffeine_unwind_phase2",
                ExternalFunctions::caffeine_unwind_phase2());

  with_function("abort", ExternalFunctions::abort());
  with_function("longjmp", ExternalFunctions::longjmp());
  with_function("setjmp", ExternalFunctions::setjmp());
  with_function("_setjmp", ExternalFunctions::setjmp());

  return *this;
}

Builder& Builder::with_default_intrinsics() {
  with_intrinsic(llvm::Intrinsic::abs, Intrinsics::abs());
  with_intrinsic(llvm::Intrinsic::umul_with_overflow,
                 Intrinsics::umul_with_overflow());
  with_intrinsic(llvm::Intrinsic::smul_with_overflow,
                 Intrinsics::smul_with_overflow());
  with_intrinsic(llvm::Intrinsic::memset, Intrinsics::memset());
  with_intrinsic(llvm::Intrinsic::memcpy, Intrinsics::memcpy());
  with_intrinsic(llvm::Intrinsic::bswap, Intrinsics::bswap());
  with_intrinsic(llvm::Intrinsic::eh_typeid_for, Intrinsics::eh_typeid_for());

  return *this;
}

Builder& Builder::with_coverage(std::unique_ptr<CoverageTracker>&& tracker) {
  cov_ = std::move(tracker);
  return *this;
}

} // namespace caffeine
