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

  class UnwindPhase1 final : public ExternalStackFrameMixin<UnwindPhase1> {
  private:
    enum State : uint8_t {
      SEARCHING,
      RETURNING,
      DONE,
    };

  public:
    struct UnwindPhaseState {
      State state = SEARCHING;

      // Filters have a negative select value so we need to keep track of
      // what actually caught the exception
      bool was_catch = true;

      // The index of the frame that caught the exception
      std::optional<size_t> catching_frame = std::nullopt;

      // The landingpad clause which caught the exception
      llvm::Constant* catching_clause = nullptr;

      // Assertions to add to the new context
      AssertionList assertions;

      UnwindPhaseState(State state, bool was_catch,
                       std::optional<size_t> catching_frame,
                       llvm::Constant* catching_clause,
                       AssertionList assertions)
          : state{state}, was_catch{was_catch}, catching_frame{catching_frame},
            catching_clause{catching_clause}, assertions{assertions} {}

      UnwindPhaseState() = default;

      UnwindPhaseState(const UnwindPhaseState&) = default;
    };

  private:
    std::vector<UnwindPhaseState> getPossibleStates(InterpreterContext& ctx) {
      AssertionList unmatched_exceptions;
      std::vector<UnwindPhaseState> possible_states;

      // Subtract two because we don't want to check the current stack frame
      // (it's an ExternalStackFrame for UnwindPhase1)
      for (int i = ctx.context().stack.size() - 2; i >= 0; i--) {
        StackFrame& frame_wrapper = ctx.context().stack.at(i);
        if (frame_wrapper.is_external()) {
          continue;
        }

        IRStackFrame& frame = frame_wrapper.get_regular();
        if (!frame.func->hasPersonalityFn()) {
          continue;
        }

        auto* personality_func =
            frame.func->getPersonalityFn()->stripPointerCasts();
        CAFFEINE_ASSERT(personality_func);

        CAFFEINE_ASSERT(personality_func->getName() == "__gxx_personality_v0",
                        fmt::format("unknown personality function! {}",
                                    personality_func->getName()));

        auto inst =
            llvm::dyn_cast<llvm::InvokeInst>(frame.get_current_instruction());

        if (!inst) {
          continue;
        }

        llvm::BasicBlock* bb = inst->getUnwindDest();
        CAFFEINE_ASSERT(bb->isLandingPad());

        auto lpad = bb->getLandingPadInst();
        if (lpad->isCleanup()) {
          // Always enter a cleanup clause
          possible_states.emplace_back(RETURNING, true, i, nullptr,
                                       AssertionList());
          return possible_states;
        }

        for (size_t j = 0; j < lpad->getNumClauses(); j++) {
          auto clause = lpad->getClause(j);
          if (lpad->isCatch(j)) {
            Assertion should_enter = ICmpOp::CreateICmpEQ(
                ctx.load(clause).scalar().pointer().value(ctx.context().heaps),
                args[0].scalar().pointer().value(ctx.context().heaps));

            // Null clauses are also always entered
            if (clause->isNullValue()) {
              possible_states.emplace_back(RETURNING, true, i, clause,
                                           AssertionList());
              return possible_states;
            }

            if (ctx.check(should_enter) == SolverResult::SAT) {
              possible_states.emplace_back(RETURNING, true, i, clause,
                                           AssertionList(should_enter));
            }

            if (ctx.check(!should_enter) == SolverResult::SAT) {
              unmatched_exceptions.insert(!should_enter);
            } else {
              // The exception always resolves to this clause
              return possible_states;
            }
          } else if (lpad->isFilter(j)) {
            if (clause->isNullValue()) {
              possible_states.emplace_back(RETURNING, false, i, clause,
                                           AssertionList());
              return possible_states;
            }

            LLVMValue clause_value = ctx.load(clause);
            CAFFEINE_ASSERT(clause_value.is_aggregate(),
                            "filter clauses should be aggregate");

            OpRef matches_any_ele = ConstantInt::Create(false);
            for (size_t i = 0; i < clause_value.aggregate().size(); i++) {
              matches_any_ele = BinaryOp::CreateOr(
                  matches_any_ele,
                  ICmpOp::CreateICmpEQ(
                      clause_value.aggregate()[i].scalar().pointer().value(
                          ctx.context().heaps),
                      args[0].scalar().pointer().value(ctx.context().heaps)));
            }

            Assertion should_enter = !Assertion(matches_any_ele);

            if (ctx.check(should_enter) == SolverResult::SAT) {
              possible_states.emplace_back(RETURNING, false, i, clause,
                                           AssertionList(should_enter));
            }

            if (ctx.check(!should_enter) == SolverResult::SAT) {
              unmatched_exceptions.insert(!should_enter);
            } else {
              // The exception always resolves to this clause
              return possible_states;
            }
          } else {
            CAFFEINE_UNREACHABLE();
          }
        }
      }

      possible_states.emplace_back(RETURNING, true, std::nullopt, nullptr,
                                   unmatched_exceptions);

      return possible_states;
    }

    void findLandingPad(InterpreterContext& ctx) {
      std::vector<UnwindPhaseState> possible_states = getPossibleStates(ctx);

      ctx.fork_external<UnwindPhase1>(
          possible_states, [=](InterpreterContext&, UnwindPhase1* frame,
                               const UnwindPhaseState& s) {
            frame->uw_state = s;
            frame->uw_state.state = RETURNING;
          });
    }

  public:
    using ExternalStackFrameMixin<UnwindPhase1>::ExternalStackFrameMixin;

    UnwindPhase1(const UnwindPhase1&) = default;
    void step(InterpreterContext& ctx) override {

      switch (uw_state.state) {
      case SEARCHING: {
        findLandingPad(ctx);
        return;
      }
      case RETURNING: {
        uw_state.state = DONE;

        auto curr_func = ctx.getCurrentFunction();
        CAFFEINE_ASSERT(curr_func);

        auto ret_ty = curr_func->getReturnType();
        CAFFEINE_ASSERT(ret_ty);

        _Unwind_Reason_Code result = _URC_END_OF_STACK;

        if (uw_state.catching_frame) {
          result = _URC_NO_REASON;
        }

        ctx.context().stack.pop_back();
        ctx.jump_return(LLVMValue(ConstantInt::Create(
            llvm::APInt(ret_ty->getIntegerBitWidth(), result))));

        return;
      }

      default:
        CAFFEINE_ABORT(
            "UnwindPhase1 function implementation entered an invalid state");
      }
    }

  private:
    UnwindPhaseState uw_state;
  };

  class UnwindPhase1Function : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      if (args.size() != 1) {
        ctx.fail("invalid UnwindPhase1Function signature (invalid number of "
                 "arguments)");
        return;
      }

      if (!func->getArg(0)->getType()->isPointerTy()) {
        ctx.fail(
            "invalid UnwindPhase1Function signature (invalid first argument)");
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
