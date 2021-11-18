#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExternalFunction.h"

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
  auto it = functions_.find(id);
  if (it == functions_.end())
    return nullptr;
  return it->second.get();
}

// All builder functions

CaffeineContext Builder::build() {
  CaffeineContext ctx;
  ctx.functions_ = std::move(functions_);
  ctx.intrinsics_ = std::move(intrinsics_);

  return ctx;
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

Builder& Builder::with_default_functions() {
  return *this;
}

Builder& Builder::with_default_intrinsics() {
  return *this;
}

} // namespace caffeine
