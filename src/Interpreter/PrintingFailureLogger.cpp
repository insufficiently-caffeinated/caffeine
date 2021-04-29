#include "caffeine/IR/Visitor.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include <boost/range/adaptor/reversed.hpp>
#include <cctype>
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

    os << "  " << symbol.name() << " = \"";

    for (size_t i = 0; i < array.size(); ++i) {
      uint8_t value = data[i];

      if (std::isprint(value)) {
        os << (char)value;
      } else {
        switch (value) {
        case '\\':
          os << "\\\\";
          break;
        case '\n':
          os << "\\n";
          break;
        case '\t':
          os << "\\t";
          break;
        case '\r':
          os << "\\r";
          break;
        case '\0':
          os << "\\0";
          break;
        default:
          os << "\\x" << inttohex(value >> 4) << inttohex(value & 0xF);
          break;
        }
      }
    }
    os << "\"\n";
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

void PrintingFailureLogger::log_failure(const Model& model, const Context& ctx,
                                        const Failure& failure) {
  std::stringstream ss;
  ss << "Found assertion failure:\n";

  if (model.result() == SolverResult::SAT) {
    ConstantPrinter printer{ss, &model};

    for (const auto& assertion : ctx.assertions) {
      printer.visit(*assertion.value());
    }
    printer.visit(*failure.check.value());

    ss << "Backtrace:\n";
    ctx.print_backtrace(ss);
  }
  if (!failure.message.empty())
    ss << "Reason:\n  " << failure.message << '\n';

  std::unique_lock lock(mtx);
  *os << ss.str() << std::flush;
}

} // namespace caffeine
