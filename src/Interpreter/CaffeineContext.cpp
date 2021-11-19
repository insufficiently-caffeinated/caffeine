#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Solver/Solver.h"

namespace caffeine {

using Builder = CaffeineContext::Builder;

// Destructors must be declared in here since the header doesn't necessarily
// have the definition for ExternalFunction.

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

std::shared_ptr<Solver> CaffeineContext::build_solver() const {
  return builder_->build();
}

// All builder functions

CaffeineContext Builder::build() {
  CaffeineContext ctx;
  ctx.functions_ = std::move(functions_);
  ctx.intrinsics_ = std::move(intrinsics_);

  if (policy_) {
    ctx.policy_ = std::move(policy_);
  } else {
    ctx.policy_ = std::make_unique<AlwaysAllowExecutionPolicy>();
  }

  if (!store_)
    throw std::logic_error("No store provided when building CaffeineContext");
  ctx.store_ = std::move(store_);

  if (builder_) {
    ctx.builder_ = std::move(builder_);
  } else {
    ctx.builder_ =
        std::make_unique<SolverBuilder>(SolverBuilder::with_default());
  }

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
  return *this;
}

Builder& Builder::with_default_intrinsics() {
  return *this;
}

} // namespace caffeine
