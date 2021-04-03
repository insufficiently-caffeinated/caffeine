#include "caffeine/Interpreter/FailureLogger.h"

#include "caffeine/IR/Visitor.h"

#include <boost/range/adaptor/reversed.hpp>
#include <iostream>
#include <sstream>
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

    auto value = model->evaluate(c);

    os << "  " << c.name() << " = " << value << "\n";
  }

  void visitConstantArray(const ConstantArray& c) {
    const auto& symbol = c.symbol();
    if (!symbol.is_named())
      return;

    if (!seen.insert(symbol.name()).second)
      return;

    auto array = model->evaluate(c).array();
    char* data = array.data();

    os << "  " << symbol.name() << " = ";

    for (size_t i = 0; i < array.size(); ++i) {
      uint8_t value = data[i];

      os << inttohex(value & 0xF) << inttohex(value >> 4);
    }
    os << "\n";
  }

private:
  static char inttohex(uint8_t value) {
    if (value < 10)
      return '0' + value;
    return ('A' - 10) + value;
  }
};

/***************************************************
 * PrintingFailureLogger                           *
 ***************************************************/

PrintingFailureLogger::PrintingFailureLogger(std::ostream& os) : os(&os) {}

static void print_context_backtrace(std::ostream& os, const Context& ctx) {
  size_t i = 0;
  const auto& stack = ctx.stack;

  for (const auto& frame : boost::adaptors::reverse(stack)) {
    llvm::Function* func = frame.current_block->getParent();

    os << "  #" << i << " " << func->getName().str() << "\n";
    i += 1;
  }
}

void PrintingFailureLogger::log_failure(const Model& model, const Context& ctx,
                                        const Failure& failure) {
  CAFFEINE_ASSERT(model.result() == SolverResult::SAT);

  std::stringstream ss;
  ConstantPrinter printer{ss, &model};

  ss << "Found assertion failure:\n";

  for (const auto& assertion : ctx.assertions) {
    printer.visit(*assertion.value());
  }
  printer.visit(*failure.check.value());

  ss << "Backtrace:\n";
  print_context_backtrace(ss, ctx);

  if (!failure.message.empty())
    ss << "Reason:\n  " << failure.message << '\n';

  std::unique_lock lock(mtx);
  *os << ss.str() << std::flush;
}

} // namespace caffeine
