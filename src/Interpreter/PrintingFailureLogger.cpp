#include "caffeine/IR/Visitor.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include <boost/range/adaptor/reversed.hpp>
#include <cctype>
#include <iostream>
#include <sstream>
#include <unordered_set>

namespace caffeine {

namespace {
  static char inttohex(uint8_t value) {
    if (value < 10)
      return '0' + value;
    return ('A' - 10) + value;
  }

  void print_value(std::ostream& os, const Value& value) {
    CAFFEINE_ASSERT(value.is_array());

    const auto& array = value.array();
    os << '\"';

    for (uint8_t value : array) {
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
    os << '\"';
  }
} // namespace

/***************************************************
 * PrintingFailureLogger                           *
 ***************************************************/

PrintingFailureLogger::PrintingFailureLogger(std::ostream& os) : os(&os) {}

void PrintingFailureLogger::log_failure(const Model& model, const Context& ctx,
                                        const Failure& failure) {
  std::stringstream ss;
  ss << "Found assertion failure:\n";

  if (model.result() == SolverResult::SAT) {
    // ConstantPrinter printer{ss, &model};

    for (const auto& [name, constant] : ctx.constants) {
      ss << "  " << name << " = ";
      print_value(ss, model.evaluate(*constant));
      ss << '\n';
    }

    // for (const auto& assertion : ctx.assertions) {
    //   printer.visit(*assertion.value());
    // }
    // printer.visit(*failure.check.value());

    ss << "Backtrace:\n";
    ctx.print_backtrace(ss);
  }
  if (!failure.message.empty())
    ss << "Reason:\n  " << failure.message << '\n';

  std::unique_lock lock(mtx);
  *os << ss.str() << std::flush;
}

} // namespace caffeine
