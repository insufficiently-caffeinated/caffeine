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

namespace caffeine {

namespace {

  class UnwindPhase1 final : public GenericUnwinding {
  public:
    using GenericUnwinding::GenericUnwinding;
    using GenericUnwinding::step;
    void returningStep(InterpreterContext& ctx) override {
      uw_state.state = DONE;

      auto curr_func = ctx.getCurrentFunction();
      CAFFEINE_ASSERT(curr_func);

      auto ret_ty = curr_func->getReturnType();
      CAFFEINE_ASSERT(ret_ty);

      _Unwind_Reason_Code result = _URC_END_OF_STACK;

      if (uw_state.catch_type != NONE) {
        result = _URC_NO_REASON;
      }

      ctx.context().stack.pop_back();
      ctx.jump_return(LLVMValue(ConstantInt::Create(
          llvm::APInt(ret_ty->getIntegerBitWidth(), result))));
    }

    std::unique_ptr<ExternalStackFrame> clone() const override {
      return std::make_unique<UnwindPhase1>(
          *dynamic_cast_if_supported<const UnwindPhase1*>(this));
    }
  };

  class UnwindPhase1Function : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 2) {
        ctx.fail("invalid UnwindPhase1Function signature (invalid number of "
                 "arguments)");
        return;
      }

      if (!func->getArg(0)->getType()->isPointerTy()) {
        ctx.fail("invalid UnwindPhase1Function signature (invalid first "
                 "argument)");
        return;
      }

      if (!func->getArg(1)->getType()->isPointerTy()) {
        ctx.fail("invalid UnwindPhase1Function signature (invalid second "
                 "argument)");
        return;
      }

      ctx.call_external_function(std::make_unique<UnwindPhase1>(
          std::vector<LLVMValue>(args.begin(), args.end()), func));
    }
  };

} // namespace

std::unique_ptr<ExternalFunction> ExternalFunctions::caffeine_unwind_phase1() {
  return std::make_unique<UnwindPhase1Function>();
}

} // namespace caffeine
