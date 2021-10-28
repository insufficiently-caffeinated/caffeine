#include "caffeine/Interpreter/TransformBuilder.h"
#include "caffeine/Interpreter/Interpreter.h"
#include <immer/map.hpp>
#include <stack>

namespace caffeine {

TransformBuilder::ContextState::ContextState(Context&& ctx, Interpreter* interp)
    : ctx(std::move(ctx)), interpreter(interp) {}

LLVMValue TransformBuilder::ContextState::lookup(const Argument& arg) {
  if (auto val = std::get_if<llvm::Value*>(&arg))
    return ctx.lookup(*val);
  return values.at(std::get<TransformBuilder::Value>(arg).index);
}

void TransformBuilder::ContextState::insert(Value key, LLVMValue val) {
  values = std::move(values).insert({key.index, std::move(val)});
}

TransformBuilder::ContextState
TransformBuilder::ContextState::fork(const Context& newctx) const {
  return fork(Context(newctx));
}
TransformBuilder::ContextState
TransformBuilder::ContextState::fork(Context&& newctx) const {
  ContextState clone{std::move(newctx), interpreter};
  clone.inst = inst;
  clone.values = values;
  return clone;
}

TransformBuilder::Value TransformBuilder::ContextState::current() const {
  return Value(inst - 1);
}

ExecutionResult TransformBuilder::execute(Interpreter* interp) const {
  std::stack<ContextState> stack;
  stack.push(ContextState(interp->ctx->fork_once(), interp));

  // We use an erased function here to avoid having to expose internal data
  // structures to all downstream functions.
  InsertFn insert_fn = [&](ContextState&& state) {
    stack.push(std::move(state));
  };

  ExecutionResult::ContextVec output;
  while (!stack.empty()) {
    ContextState state = std::move(stack.top());
    stack.pop();

    if (state.inst >= operations.size()) {
      output.push_back(std::move(state.ctx));
      continue;
    }

    const Operation& op = operations[state.inst];
    state.inst += 1;

    // The operation function is responsible for putting states back onto the
    // stack if they're supposed to continue being executed.
    op.func(std::move(state), insert_fn);
  }

  if (output.size() == 1) {
    *interp->ctx = std::move(output[0]);
    return ExecutionResult::Continue;
  } else {
    return ExecutionResult(std::move(output), ExecutionResult::Status::Dead);
  }
}

TransformBuilder::Value TransformBuilder::resolve(Argument pointer,
                                                  llvm::Type* type,
                                                  bool die_on_failure) {
  return transform_fork([=](ContextState&& state, InsertFn& insert_fn) {
    Context& ctx = state.ctx;
    auto solver = state.interpreter->solver;
    const llvm::DataLayout& layout = ctx.mod->getDataLayout();

    auto result_id = state.current();
    auto unresolved = state.lookup(pointer).scalar().pointer();
    auto assertion =
        ctx.heaps.check_valid(unresolved, layout.getTypeStoreSize(type));
    if (ctx.check(solver, !assertion) == SolverResult::SAT) {
      state.interpreter->logFailure(ctx, !assertion,
                                    "invalid pointer load/store");

      if (die_on_failure) {
        // If we're getting an out-of-bounds access then there's a pretty
        // good chance that we'll find that we can overlap with just about
        // any other allocation. This isn't likely to produce useful bugs so
        // we'll kill the context here.
        return;
      }
    }

    auto resolved = ctx.heaps.resolve(solver, unresolved, ctx);
    auto forks = ctx.fork(resolved.size());

    for (auto [fork, ptr] : llvm::zip(forks, resolved)) {
      Allocation& alloc = fork.heaps[ptr.heap()][ptr.alloc()];
      fork.add(
          alloc.check_inbounds(ptr.offset(), layout.getTypeStoreSize(type)));

      if (!unresolved.is_resolved()) {
        fork.backprop(unresolved, ptr);
      }

      ContextState newstate = state.fork(std::move(fork));
      newstate.insert(result_id, LLVMValue(ptr));
      insert_fn(std::move(newstate));
    }
  });
}

TransformBuilder::Value TransformBuilder::transform_fork(TransformFn&& func) {
  operations.emplace_back(std::move(func));
  return Value(operations.size() - 1);
}

void TransformBuilder::assign(llvm::Value* value, Argument arg) {
  transform([=](ContextState& state) {
    state.ctx.stack_top().insert(value, state.lookup(arg));
  });
}
void TransformBuilder::assign(llvm::Value* value, LLVMValue arg) {
  transform([value, marg = std::move(arg)](ContextState& state) {
    state.ctx.stack_top().insert(value, marg);
  });
}
void TransformBuilder::assign(llvm::Value* value, LLVMScalar arg) {
  assign(value, LLVMValue(std::move(arg)));
}

TransformBuilder::Value TransformBuilder::read(Argument arg, llvm::Type* type) {
  return transform([=](ContextState& state) {
    const auto& layout = state.ctx.mod->getDataLayout();

    auto ptr = state.lookup(arg).scalar().pointer();
    Allocation& alloc = state.ctx.heaps.ptr_allocation(ptr);
    state.insert(state.current(), alloc.read(ptr.offset(), type, layout));
  });
}

} // namespace caffeine
