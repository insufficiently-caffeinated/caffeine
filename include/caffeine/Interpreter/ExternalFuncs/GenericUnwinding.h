#include "caffeine/Interpreter/InterpreterContext.h"

namespace caffeine {

class GenericUnwinding : public ExternalStackFrame {
protected:
  enum State : uint8_t {
    UNINITIALIZED,
    SEARCHING,
    RETURNING,
    PROCESSING_CATCH,
    DONE,
    FORKING,
  };

  enum CatchType : uint8_t { NONE, CATCH, FILTER, CLEANUP };

public:
  using ExternalStackFrame::ExternalStackFrame;
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
                     llvm::Constant* catching_clause, AssertionList assertions)
        : state{state}, catch_type{catch_type}, current_frame{current_frame},
          catching_clause{catching_clause}, assertions{assertions} {}

    UnwindPhaseState() = default;

    UnwindPhaseState(const UnwindPhaseState&) = default;
  };

protected:
  // Returns whether all the possible states have been returned or if this
  // function needs to be called again
  bool getPossibleStates(InterpreterContext& ctx);

  void findLandingPad(InterpreterContext& ctx);

public:
  GenericUnwinding(const GenericUnwinding&) = default;
  GenericUnwinding(std::vector<LLVMValue>&& args, llvm::Function* func,
                   bool evaluate_cleanup);
  virtual void step(InterpreterContext& ctx) override;
  virtual void returningStep(InterpreterContext&) = 0;

protected:
  UnwindPhaseState uw_state;
  llvm::Function* can_catch_func;
  // Cleanups should not be checked in phase1
  bool evaluate_cleanup = true;
};

} // namespace caffeine
