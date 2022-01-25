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
      UNINITIALIZED,
      SEARCHING,
      RETURNING,
      PROCESSING_CATCH,
      DONE,
    };

    enum CatchType : uint8_t { NONE, CATCH, FILTER, CLEANUP };

  public:
    struct UnwindPhaseState {
      State state = UNINITIALIZED;

      // Filters have a negative select value so we need to keep track of
      // what actually caught the exception
      CatchType catch_type = NONE;

      // The index of the frame that caught the exception
      int current_frame;

      // The landingpad clause which caught the exception
      llvm::Constant* catching_clause = nullptr;

      // Assertions to add to the new context
      AssertionList assertions;

      std::vector<UnwindPhaseState> possible_states;
      AssertionList unmatched_exceptions;
      size_t clause_num;

      UnwindPhaseState(State state, CatchType catch_type, int current_frame,
                       llvm::Constant* catching_clause,
                       AssertionList assertions)
          : state{state}, catch_type{catch_type}, current_frame{current_frame},
            catching_clause{catching_clause}, assertions{assertions} {}

      UnwindPhaseState() = default;

      UnwindPhaseState(const UnwindPhaseState&) = default;
    };

  private:
    bool getPossibleStates(InterpreterContext& ctx) {
      for (; uw_state.current_frame >= 0; uw_state.current_frame--) {
        StackFrame& frame_wrapper =
            ctx.context().stack.at(uw_state.current_frame);
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
          uw_state.possible_states.emplace_back(RETURNING, CLEANUP,
                                                uw_state.current_frame, nullptr,
                                                AssertionList());
          return true;
        }

        for (; uw_state.clause_num < lpad->getNumClauses();
             uw_state.clause_num++) {
          auto clause = lpad->getClause(uw_state.clause_num);
          if (lpad->isCatch(uw_state.clause_num)) {
            // Null clauses are also always entered
            if (clause->isNullValue()) {
              uw_state.possible_states.emplace_back(RETURNING, CATCH,
                                                    uw_state.current_frame,
                                                    clause, AssertionList());
              return true;
            }

            // TODO:
            // * call caffeine_can_catch
            // * set state PROCESSING_CATCH
            // * return false;
            // * deal with whether we can catch this there

            Assertion should_enter = ICmpOp::CreateICmpEQ(
                ctx.load(clause).scalar().pointer().value(ctx.context().heaps),
                args[0].scalar().pointer().value(ctx.context().heaps));

            if (ctx.check(should_enter) == SolverResult::SAT) {
              uw_state.possible_states.emplace_back(
                  RETURNING, CATCH, uw_state.current_frame, clause,
                  AssertionList(should_enter));
            }

            if (ctx.check(!should_enter) == SolverResult::SAT) {
              uw_state.unmatched_exceptions.insert(!should_enter);
            } else {
              // The exception always resolves to this clause
              return true;
            }
          } else if (lpad->isFilter(uw_state.clause_num)) {
            if (clause->isNullValue()) {
              uw_state.possible_states.emplace_back(RETURNING, FILTER,
                                                    uw_state.current_frame,
                                                    clause, AssertionList());
              return true;
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
              uw_state.possible_states.emplace_back(
                  RETURNING, FILTER, uw_state.current_frame, clause,
                  AssertionList(should_enter));
            }

            if (ctx.check(!should_enter) == SolverResult::SAT) {
              uw_state.unmatched_exceptions.insert(!should_enter);
            } else {
              // The exception always resolves to this clause
              return true;
            }
          } else {
            CAFFEINE_UNREACHABLE();
          }
        }

        uw_state.clause_num = 0;
      }

      uw_state.possible_states.emplace_back(RETURNING, NONE,
                                            uw_state.current_frame, nullptr,
                                            uw_state.unmatched_exceptions);

      return true;
    }

    void findLandingPad(InterpreterContext& ctx) {
      if (!getPossibleStates(ctx)) {
        return;
      }

      ctx.fork_external<UnwindPhase1>(uw_state.possible_states,
                                      [=](InterpreterContext&,
                                          UnwindPhase1* frame,
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
      case UNINITIALIZED: {
        uw_state.state = SEARCHING;

        // Subtract two because we don't want to check the current stack frame
        // (it's an ExternalStackFrame for UnwindPhase1)
        uw_state.current_frame = ctx.context().stack.size() - 2;

        uw_state.clause_num = 0;
      }
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

        if (uw_state.catch_type != NONE) {
          result = _URC_NO_REASON;
        }

        ctx.context().stack.pop_back();
        ctx.jump_return(LLVMValue(ConstantInt::Create(
            llvm::APInt(ret_ty->getIntegerBitWidth(), result))));

        return;
      }
      case PROCESSING_CATCH: {
        CAFFEINE_ASSERT(result_);
        CAFFEINE_ASSERT(!resume_value_);

        // TODO
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
      if (args.size() != 2) {
        ctx.fail("invalid UnwindPhase1Function signature (invalid number of "
                 "arguments)");
        return;
      }

      if (!func->getArg(0)->getType()->isPointerTy()) {
        ctx.fail(
            "invalid UnwindPhase1Function signature (invalid first argument)");
        return;
      }

      if (!func->getArg(1)->getType()->isPointerTy()) {
        ctx.fail(
            "invalid UnwindPhase1Function signature (invalid second argument)");
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
