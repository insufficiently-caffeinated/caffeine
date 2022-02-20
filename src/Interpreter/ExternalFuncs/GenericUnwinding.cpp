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

bool GenericUnwinding::getPossibleStates(InterpreterContext& ctx) {
  for (; uw_state.current_frame >= 0; uw_state.current_frame--) {
    StackFrame& frame_wrapper = ctx.context().stack.at(uw_state.current_frame);
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
      uw_state.possible_states.emplace_back(
          RETURNING, CLEANUP, uw_state.current_frame, nullptr, AssertionList());
      return true;
    }

    for (; uw_state.clause_num < lpad->getNumClauses(); uw_state.clause_num++) {
      auto clause = lpad->getClause(uw_state.clause_num);
      if (lpad->isCatch(uw_state.clause_num)) {
        // Null clauses are also always entered
        if (clause->isNullValue()) {
          uw_state.possible_states.emplace_back(RETURNING, CATCH,
                                                uw_state.current_frame, clause,
                                                AssertionList());
          return true;
        }

        std::vector<LLVMValue> args_ = {args[0], ctx.load(clause), args[1]};
        ctx.call_function(can_catch_func, args_);
        uw_state.state = PROCESSING_CATCH;
        uw_state.catching_clause = clause;
        return false;
      } else if (lpad->isFilter(uw_state.clause_num)) {
        if (clause->isNullValue()) {
          uw_state.possible_states.emplace_back(RETURNING, FILTER,
                                                uw_state.current_frame, clause,
                                                AssertionList());
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
          uw_state.possible_states.emplace_back(RETURNING, FILTER,
                                                uw_state.current_frame, clause,
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

  uw_state.possible_states.emplace_back(RETURNING, NONE, uw_state.current_frame,
                                        nullptr, uw_state.unmatched_exceptions);

  return true;
}

void GenericUnwinding::findLandingPad(InterpreterContext& ctx) {
  if (!getPossibleStates(ctx)) {
    return;
  }

  uw_state.state = FORKING;
}

void GenericUnwinding::step(InterpreterContext& ctx) {

  switch (uw_state.state) {
  case UNINITIALIZED: {
    uw_state.state = SEARCHING;

    // Subtract two because we don't want to check the current stack frame
    // (it's an ExternalStackFrame for GenericUnwinding)
    uw_state.current_frame = ctx.context().stack.size() - 2;

    uw_state.clause_num = 0;

    can_catch_func = ctx.getModule()->getFunction("caffeine_can_catch");
    CAFFEINE_ASSERT(can_catch_func);
    return;
  }
  case SEARCHING: {
    findLandingPad(ctx);
    return;
  }
  case RETURNING: {
    returningStep(ctx);
    return;
  }
  case PROCESSING_CATCH: {
    CAFFEINE_ASSERT(result_);
    CAFFEINE_ASSERT(!resume_value_);

    Assertion should_enter = ICmpOp::CreateICmpEQ((*result_).scalar().expr(),
                                                  ConstantInt::Create(true));

    if (ctx.check(should_enter) == SolverResult::SAT) {
      uw_state.possible_states.emplace_back(
          RETURNING, CATCH, uw_state.current_frame, uw_state.catching_clause,
          AssertionList(should_enter));
    }

    if (ctx.check(!should_enter) == SolverResult::SAT) {
      uw_state.unmatched_exceptions.insert(!should_enter);
      // Keep searching
      uw_state.state = SEARCHING;
    } else {
      // The exception always resolves to this clause
      uw_state.state = FORKING;
    }

    return;
  }

  case FORKING: {
    ctx.fork_external<GenericUnwinding>(uw_state.possible_states,
                                        [=](InterpreterContext&,
                                            GenericUnwinding* frame,
                                            const UnwindPhaseState& s) {
                                          frame->uw_state = s;
                                          frame->uw_state.state = RETURNING;
                                        });
    return;
  }

  default:
    CAFFEINE_ABORT(
        "GenericUnwinding function implementation entered an invalid state");
  }
}

} // namespace caffeine
