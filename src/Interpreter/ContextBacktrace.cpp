#include "caffeine/Interpreter/Context.h"
#include "caffeine/Support/LLVMFmt.h"
#include <boost/algorithm/string/trim.hpp>
#include <boost/range/adaptor/reversed.hpp>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <iostream>
#include <llvm/ADT/SmallString.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>
#include <llvm/IR/ModuleSlotTracker.h>

namespace caffeine {

/**
 * Notes on formatting
 * ===================
 * The full format should look something like this
 *
 *  #n program::being::interpreted + <instr offset>
 *     -> <source file>:<source line>
 *      | <IR instruction>
 *
 * However most of those will be optional depending on whether the information
 * is present as well as how broken the context state is.
 */
void Context::print_backtrace(std::ostream& OS) const {
  if (!mod) {
    OS << "  <unable to print backtrace>\n";
    return;
  }

  llvm::ModuleSlotTracker MST{mod};
  std::string output;
  size_t index = 0;

  for (const auto& frame_ : boost::adaptors::reverse(stack)) {
    llvm::Instruction* current = nullptr;
    std::optional<size_t> offset;
    std::optional<std::string> source_loc;
    std::string prefix = fmt::format(FMT_STRING("#{}"), index);
    std::string name = "<unknown>";

    if (frame_.is_regular()) {
      const auto& frame = frame_.get_regular();
      current = frame.get_current_instruction();

      if (frame.current_block) {
        if (llvm::Function* func = frame.current_block->getParent()) {
          MST.incorporateFunction(*func);

          name = func->getName();

          if (current) {
            int slot = MST.getLocalSlot(current);
            if (slot != -1)
              offset = (size_t)slot;
          }
        }
      }

      if (current) {
        if (const auto& debug_loc = current->getDebugLoc()) {
          source_loc =
              fmt::format(FMT_STRING("{}:{}:{}"), debug_loc->getFilename(),
                          debug_loc->getLine(), debug_loc->getColumn());
        }
      }
    } else {
      const auto& frame = frame_.get_external();

      if (frame->func) {
        name = frame->func->getName();
      } else {
        name = "<unknown external>";
      }
    }

    fmt::print(OS, FMT_STRING("{:>3} {}"), prefix, name);
    if (offset)
      fmt::print(OS, FMT_STRING("+{}"), *offset);
    if (source_loc)
      fmt::print(OS, FMT_STRING("\n    -> {}"), *source_loc);
    if (current) {
      llvm::raw_string_ostream ss{output};
      ss << *current;
      ss.flush();
      boost::algorithm::trim(output);
      fmt::print(OS, FMT_STRING("\n     | {}"), output);
      output.clear();
    }
    fmt::print(OS, "\n");

    index += 1;
  }
}

} // namespace caffeine
