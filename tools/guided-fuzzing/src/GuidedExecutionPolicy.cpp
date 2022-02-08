#include "GuidedExecutionPolicy.h"

#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Support/Tracing.h"

#include <iostream>

// The AFL headers declare some single-letter macros that cause issues
// within llvm headers. We need to include them after.
extern "C" {
#include "afl-fuzz.h"
}

namespace caffeine {

Assertion create_size_assertion(const OpRef& data, size_t size) {
  auto array = llvm::dyn_cast<ArrayBase>(data.get());
  CAFFEINE_ASSERT(array, "OpRef `data` must be an array type");

  return Assertion(ICmpOp::CreateICmpEQ(array->size(), size));
}

GuidedExecutionPolicy::GuidedExecutionPolicy(std::string_view data,
                                             std::string symbol_name,
                                             CaffeineMutator* mutator,
                                             TestCaseStoragePtr cases)
    : mutator{mutator}, cases{cases}, data{data}, symbol_name{symbol_name} {
  CAFFEINE_ASSERT(mutator, "Mutator must not be null in GuidedExecutionPolicy");
}

bool GuidedExecutionPolicy::should_queue_path(const Context& ctx) {
  auto symbolic_buffer = ctx.constants.find(symbol_name);
  if (symbolic_buffer == nullptr) {
    // Since our symbolic allocation is currently not in scope we just continue
    return true;
  }

  AssertionList combined = ctx.extract_assertions();
  combined.insert(create_size_assertion(*symbolic_buffer, data.size()));

  const llvm::DataLayout& layout = ctx.mod->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();

  for (size_t i = 0; i < data.size(); i++) {
    combined.insert(Assertion(ICmpOp::CreateICmpEQ(
        LoadOp::Create(*symbolic_buffer,
                       ConstantInt::Create(llvm::APInt(bitwidth, i))),
        (uint8_t)data[i])));
  }

  return mutator->solver->check(combined) == SolverResult::SAT;
}

void GuidedExecutionPolicy::on_path_complete(const Context& ctx, ExitStatus,
                                             const Assertion& assertion) {
  auto assertions = ctx.extract_assertions();
  auto result = mutator->solver->resolve(assertions, assertion);
  notify_context_finished();

  if (result != SolverResult::SAT)
    return;

  auto tc = mutator->model_to_testcase(result.model(), ctx, symbol_name);
  if (tc == std::nullopt) {
    return;
  }
  std::string_view tcdata(tc->data(), tc->size());

  // Don't mutate to a no-change test case
  if (tcdata == data)
    return;

  cases->emplace_back(tcdata);
}

} // namespace caffeine
