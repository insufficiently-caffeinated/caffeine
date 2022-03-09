#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/ExternalFuncs/GenericUnwinding.h"
#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Support/LLVMFmt.h"
#include <boost/range/algorithm/find_if.hpp>
#include <fmt/format.h>
#include <iterator>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <iostream>

#include "unwind.h"

#include "caffeine/Support/LLVMFmt.h"
#include <fmt/format.h>

namespace caffeine {

namespace {

  class UnwindPhase2 final : public GenericUnwinding {
  public:
    using GenericUnwinding::GenericUnwinding;
    using GenericUnwinding::step;
    void returningStep(InterpreterContext& ctx) override {
      uw_state.state = DONE;

      if (uw_state.catch_type == NONE) {
        ctx.fail("No landingpad for thrown exception!");
        return;
      }

      // Have to get args[2] here because if we pop the stacks off earlier
      // the LLVMValue becomes corrupted somehow
      std::vector<LLVMValue> result;
      result.push_back(args[2]);

      size_t wanted_stack_size = uw_state.current_frame + 1;
      while (wanted_stack_size < ctx.context().stack.size()) {
        ctx.context().stack.pop_back();
      }

      auto curr_func = ctx.getCurrentFunction();
      CAFFEINE_ASSERT(curr_func);

      auto ret_ty = curr_func->getReturnType();
      CAFFEINE_ASSERT(ret_ty);

      int32_t selector = 0;

      if (uw_state.catch_type == CLEANUP) {
        selector = 0;
      } else if (uw_state.catch_type == FILTER) {
        selector = -1;
      } else if (uw_state.catch_type == CATCH) {
        selector =
            ctx.caffeine().typeid_db()->get_selector(uw_state.catching_clause);
      }

      result.push_back(
          LLVMValue(ConstantInt::Create(llvm::APInt(32, selector))));

      ctx.jump_resume(LLVMValue(result));
    }

    std::unique_ptr<ExternalStackFrame> clone() const override {
      return std::make_unique<UnwindPhase2>(
          *dynamic_cast_if_supported<const UnwindPhase2*>(this));
    }
  };

  class UnwindPhase2Function : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 3) {
        ctx.fail("invalid UnwindPhase2Function signature (invalid number of "
                 "arguments)");
        return;
      }

      if (!func->getArg(0)->getType()->isPointerTy()) {
        ctx.fail("invalid UnwindPhase2Function signature (invalid first "
                 "argument)");
        return;
      }

      if (!func->getArg(1)->getType()->isPointerTy()) {
        ctx.fail("invalid UnwindPhase2Function signature (invalid second "
                 "argument)");
        return;
      }

      if (!func->getArg(2)->getType()->isPointerTy()) {
        ctx.fail("invalid UnwindPhase2Function signature (invalid third "
                 "argument)");
        return;
      }

      ctx.call_external_function(std::make_unique<UnwindPhase2>(
          std::vector<LLVMValue>(args.begin(), args.end()), func));
    }
  };

} // namespace

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_unwind_phase2() {
  return std::make_unique<UnwindPhase2Function>();
}

} // namespace caffeine
