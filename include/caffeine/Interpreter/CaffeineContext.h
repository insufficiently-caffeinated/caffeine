#pragma once

#include "caffeine/ADT/StringMap.h"
#include <llvm/IR/Intrinsics.h>
#include <memory>

namespace caffeine {

class ExternalFunction;

/**
 * @brief Global info/context shared by all interpreter and executor instances.
 *
 * At the moment, this only includes external function and intrinsic registries.
 */
class CaffeineContext {
private:
  // All external functions along with their corresponding names.
  StringMap<std::unique_ptr<ExternalFunction>> functions_;
  // All intrinsic functions by LLVM Intrinsic ID.
  tsl::hopscotch_map<llvm::Intrinsic::ID, std::unique_ptr<ExternalFunction>>
      intrinsics_;

public:
  const ExternalFunction* function(std::string_view name) const;
  const ExternalFunction* intrinsic(llvm::Intrinsic::ID id) const;

public:
  // Builder class for CaffeineContext.
  //
  // This is the only supported way of creating a CaffeineContext instance.
  class Builder {
  private:
    StringMap<std::unique_ptr<ExternalFunction>> functions_;
    tsl::hopscotch_map<llvm::Intrinsic::ID, std::unique_ptr<ExternalFunction>>
        intrinsics_;

  public:
    Builder() = default;
    ~Builder();

    Builder(const Builder&) = delete;
    Builder& operator=(const Builder&) = delete;

    Builder(Builder&&) = default;
    Builder& operator=(Builder&&) = default;

    CaffeineContext build();

    // Add a new external function with the provided name. If another external
    // function is already registered with the same name then this will
    // overwrite the previous function.
    Builder& with_function(const std::string& name,
                           std::unique_ptr<ExternalFunction>&& func);

    // Add a new intrinsic with the provided ID.
    Builder& with_intrinsic(llvm::Intrinsic::ID id,
                            std::unique_ptr<ExternalFunction>&& func);

    Builder& with_default_functions();
    Builder& with_default_intrinsics();
  };

  static Builder builder();

private:
  CaffeineContext() = default;
  CaffeineContext(const CaffeineContext&) = delete;
  CaffeineContext& operator=(const CaffeineContext&) = delete;

  friend class Builder;

public:
  CaffeineContext(CaffeineContext&&) = default;
  CaffeineContext& operator=(CaffeineContext&&) = default;

  ~CaffeineContext();
};

} // namespace caffeine
