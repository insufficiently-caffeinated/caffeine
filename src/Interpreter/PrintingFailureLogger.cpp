#include "caffeine/Interpreter/FailureLogger.h"

#include "caffeine/IR/Visitor.h"

#include <iostream>
#include <unordered_set>

namespace caffeine {

class ConstantPrinter : public ConstOpVisitor<ConstantPrinter> {
private:
  std::ostream& os;
  const Model* model;
  std::unordered_set<std::string_view> seen;

public:
  ConstantPrinter(std::ostream& os, const Model* model)
      : os(os), model(model) {}

  void visitOperation(const Operation& op) {
    for (const auto& operand : op.operands()) {
      visit(operand);
    }
  }

  void visitConstant(const Constant& c) {
    // TODO: Figure out how to print numbered constants and whether we'd want
    //       to.
    if (!c.is_named())
      return;

    // We've already printed this constant.
    if (!seen.insert(c.name()).second)
      return;

    auto value = model->lookup(c);

    os << "  " << c.name() << " = " << value << "\n";
  }
};

/***************************************************
 * PrintingFailureLogger                           *
 ***************************************************/

PrintingFailureLogger::PrintingFailureLogger(std::ostream& os) : os(&os) {}

void PrintingFailureLogger::log_failure(const Model& model, const Context& ctx,
                                        const Failure& failure) {
  CAFFEINE_ASSERT(model.result() == SolverResult::SAT);

  ConstantPrinter printer{*os, &model};

  *os << "Found assertion failure:\n";

  for (const auto& assertion : ctx.assertions()) {
    printer.visit(*assertion.value());
  }
  printer.visit(*failure.check.value());

  *os << std::flush;
}

} // namespace caffeine
