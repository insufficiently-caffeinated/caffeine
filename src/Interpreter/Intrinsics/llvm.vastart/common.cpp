#include "caffeine/Interpreter/ExternalFunction.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "vastart.h"
#include <boost/algorithm/string.hpp>
#include <fmt/format.h>
#include <llvm/IR/Module.h>

namespace caffeine::intrin::vastart {
llvm::StructType* getListTagType(llvm::Module* module) {
  auto named = module->getIdentifiedStructTypes();
  auto it = std::find_if(named.begin(), named.end(), [](llvm::StructType* st) {
    return st->getStructName() == "struct.__va_list_tag";
  });
  CAFFEINE_ASSERT(it != named.end(),
                  "varargs functions without the __va_list_tag type present");

  return *it;
}
} // namespace caffeine::intrin::vastart

namespace caffeine {

using namespace intrin::vastart;

namespace {
  class VaStartIntrinsic : public ExternalFunction {
  public:
    void call(llvm::Function* func, InterpreterContext& ctx,
              Span<LLVMValue> args) const override {
      CAFFEINE_ASSERT(args.size() == 1);
      CAFFEINE_ASSERT(args[0].is_scalar());
      CAFFEINE_ASSERT(args[0].scalar().is_pointer());

      auto* module = ctx.getModule();
      auto curfunc = ctx.getCurrentFunction();

      if (!curfunc->isVarArg()) {
        ctx.fail(fmt::format("va_start called within a non-varargs function {}",
                             func->getName().str()));
        return;
      }

      if (boost::algorithm::starts_with(module->getTargetTriple(),
                                        std::string_view("x86_64-"))) {
        ctx.call_external_function(std::make_unique<x86_64VaStart>(
            args.vec(), func,
            llvm::cast<llvm::CallBase>(ctx.getCurrentInstruction())));
      } else {
        ctx.fail(fmt::format("va_start is not implemented for target triple {}",
                             module->getTargetTriple()));
      }
    }
  };
} // namespace

std::unique_ptr<ExternalFunction> Intrinsics::vastart() {
  return std::make_unique<VaStartIntrinsic>();
}

} // namespace caffeine
