#pragma once

#include "caffeine/ADT/StringMap.h"
#include "caffeine/Interpreter/TypeidDb.h"
#include <llvm/IR/Intrinsics.h>
#include <memory>

namespace caffeine {

class ExternalFunction;
class ExecutionPolicy;
class ExecutionContextStore;
class Solver;
class SolverBuilder;
class FailureLogger;
class CoverageTracker;

/**
 * @brief Options controlling various behaviours of the caffeine interpreter.
 *
 * Any new options used by the interpreter should be added here.
 */
struct CaffeineOptions {
  /**
   * @brief Determines whether malloc will return null in addition to returning
   * an allocation.
   *
   * Most programs aren't written to handle allocation failures so we default
   * this to false.
   */
  bool malloc_can_return_null = false;

  /**
   * @brief Alignment of all pointers returned by malloc (for symbolic
   * pointers).
   *
   * This must be a power of two. Defaults to 16 since that is what most C and
   * C++ standard libraries use for their allocators. Must be at least as large
   * as the alignment required by the largest type (usually 8 bytes).
   */
  uint64_t malloc_alignment = 16;

  CaffeineOptions() = default;
};

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

  std::unique_ptr<ExecutionPolicy> policy_;
  std::unique_ptr<ExecutionContextStore> store_;
  std::unique_ptr<SolverBuilder> builder_;
  std::unique_ptr<FailureLogger> logger_;
  std::unique_ptr<CoverageTracker> cov_;
  CaffeineOptions options_;
  std::shared_ptr<TypeidDb> typeid_db_;

public:
  const ExternalFunction* function(std::string_view name) const;
  const ExternalFunction* intrinsic(llvm::Intrinsic::ID id) const;

  ExecutionPolicy* policy() const;
  ExecutionContextStore* store() const;
  FailureLogger* logger() const;
  CoverageTracker* coverage() const;
  const CaffeineOptions& options() const;

  std::shared_ptr<Solver> build_solver() const;

  // Returns the Typeid DB for the InterpreterContext
  std::shared_ptr<TypeidDb> typeid_db();

public:
  // Builder class for CaffeineContext.
  //
  // This is the only supported way of creating a CaffeineContext instance.
  class Builder {
  private:
    StringMap<std::unique_ptr<ExternalFunction>> functions_;
    tsl::hopscotch_map<llvm::Intrinsic::ID, std::unique_ptr<ExternalFunction>>
        intrinsics_;

    std::unique_ptr<ExecutionPolicy> policy_;
    std::unique_ptr<ExecutionContextStore> store_;
    std::unique_ptr<SolverBuilder> builder_;
    std::unique_ptr<FailureLogger> logger_;
    std::unique_ptr<CoverageTracker> cov_;
    CaffeineOptions options_;

  public:
    Builder() = default;
    ~Builder();

    Builder(const Builder&) = delete;
    Builder& operator=(const Builder&) = delete;

    Builder(Builder&&) = default;
    Builder& operator=(Builder&&) = default;

    // Build a new CaffeineContext from the components specified through this
    // builder. This will leave the builder empty as if it was moved.
    CaffeineContext build();

    // Set the policy used to determine whether to continue executing a live
    // context.
    //
    // If not specified then AlwaysAllowExecutionPolicy will be used.
    Builder& with_policy(std::unique_ptr<ExecutionPolicy>&& policy);

    // Set the store used to queue up contexts that are not currently being
    // executed.
    //
    // A store must be specified otherwise build() will throw an exception.
    Builder& with_store(std::unique_ptr<ExecutionContextStore>&& store);

    Builder& with_logger(std::unique_ptr<FailureLogger>&& logger);

    // Add a new external function with the provided name. If another external
    // function is already registered with the same name then this will
    // overwrite the previous function.
    Builder& with_function(const std::string& name,
                           std::unique_ptr<ExternalFunction>&& func);

    // Add a new intrinsic with the provided ID.
    Builder& with_intrinsic(llvm::Intrinsic::ID id,
                            std::unique_ptr<ExternalFunction>&& func);

    // Add an already-initialized solver builder.
    Builder& with_solver_builder(SolverBuilder&& builder);

    // Set the options used by this context.
    Builder& with_options(const CaffeineOptions& options);

    // Set the coverage counter used by this context.
    Builder& with_coverage(std::unique_ptr<CoverageTracker>&& tracker);

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
