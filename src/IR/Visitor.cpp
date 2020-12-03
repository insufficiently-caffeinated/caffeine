#include "caffeine/IR/Visitor.h"

#include <fmt/format.h>

namespace caffeine::detail::visitor {

std::string unknown_opcode_msg(const Operation& op) {
  return fmt::format("Unknown operation opcode '{}' with value {}",
                     op.opcode_name(), op.opcode());
}

} // namespace caffeine::detail::visitor
