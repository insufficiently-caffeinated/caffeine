#include "GuidedExecutionPolicy.h"

#include "caffeine/Interpreter/Interpreter.h"

#include <iostream>

namespace caffeine {

Assertion create_size_assertion(const OpRef* data, size_t size) {
  auto fixed_array = llvm::dyn_cast<FixedArray>(data->get());
  if (fixed_array) {
    return Assertion(ICmpOp::CreateICmpEQ(fixed_array->size(), size));
  }

  auto constant_array = llvm::dyn_cast<ConstantArray>(data->get());
  CAFFEINE_ASSERT(constant_array,
                  "OpRef `data` must be either a FixedArray or ConstantArray");
  return Assertion(ICmpOp::CreateICmpEQ(constant_array->size(), size));
}

GuidedExecutionPolicy::GuidedExecutionPolicy(caffeine::Span<char> data,
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

  AssertionList combined = ctx.assertions;
  combined.insert(create_size_assertion(symbolic_buffer, data.size()));

  const llvm::DataLayout& layout = ctx.mod->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();

  // Small hack: if we have a FixedArray, and AFL tries to pass in a
  // larger testcase, we get an assertion failure. To fix this, we take
  // the minimum of the AFL data, and the FixedArray length.
  size_t array_len = data.size();
  auto fixed_array = llvm::dyn_cast<FixedArray>(symbolic_buffer->get());
  if (fixed_array && fixed_array->data().size() > data.size()) {
    return false;
  } else if (fixed_array) {
    array_len = std::min(array_len, fixed_array->data().size());
  }

  for (size_t i = 0; i < array_len; i++) {
    combined.insert(Assertion(ICmpOp::CreateICmpEQ(
        LoadOp::Create(*symbolic_buffer,
                       ConstantInt::Create(llvm::APInt(bitwidth, i))),
        data.data()[i])));
  }

  auto all_assertions_sat = mutator->solver->resolve(combined);
  if (all_assertions_sat.kind() == SolverResult::Kind::SAT) {
    all_assertions_sat.evaluate(*ctx.constants.find(symbol_name)->get())
        .array();
    cases->push_back(mutator->model_to_testcase(all_assertions_sat.model(), ctx,
                                                symbol_name));
    return true;
  }

  AssertionList assertions_copy = ctx.assertions;
  SolverResult partial = mutator->solver->resolve(assertions_copy);
  if (partial.kind() == SolverResult::Kind::SAT) {
    partial.evaluate(*ctx.constants.find(symbol_name)->get()).array();
    cases->push_back(
        mutator->model_to_testcase(partial.model(), ctx, symbol_name));
  }

  return false;
}

void GuidedExecutionPolicy::on_path_complete(const Context& ctx,
                                             ExitStatus status,
                                             const Assertion& assertion) {
  if (status == ExitStatus::Fail) {
    Context ctx_copy = ctx;
    cases->push_back(mutator->model_to_testcase(
        ctx_copy.resolve(mutator->solver, assertion).model(), ctx_copy,
        symbol_name));
  }
}

} // namespace caffeine
