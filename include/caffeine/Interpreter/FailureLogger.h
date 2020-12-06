#ifndef CAFFEINE_INTERPRETER_FAILURELOGGER_H
#define CAFFEINE_INTERPRETER_FAILURELOGGER_H

#include "caffeine/Interpreter/Context.h"
#include "caffeine/Solver/Solver.h"

#include <iosfwd>

namespace caffeine {

struct Failure {
  Assertion check;
  std::string_view message;

  explicit Failure(const Assertion& check) : check(check), message("") {}
  Failure(const Assertion& check, std::string_view msg)
      : check(check), message(msg) {}
};

class FailureLogger {
public:
  FailureLogger() = default;
  virtual ~FailureLogger() = default;

  virtual void log_failure(const Model& model, const Context& context,
                           const Failure& failure) = 0;

protected:
  FailureLogger(const FailureLogger&) = default;
  FailureLogger(FailureLogger&&) = default;

  FailureLogger& operator=(const FailureLogger&) = default;
  FailureLogger& operator=(FailureLogger&&) = default;
};

class PrintingFailureLogger : public FailureLogger {
private:
  std::ostream* os;

public:
  PrintingFailureLogger(std::ostream& os);

  void log_failure(const Model& model, const Context& context,
                   const Failure& failure) override;
};

} // namespace caffeine

#endif
