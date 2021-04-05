#include "caffeine/Support/Assert.h"
#include "builtins.h"
#include <fmt/format.h>

namespace caffeine {

llvm::FunctionCallee generateAssert(llvm::Module* module) {
  using llvm::Attribute;

  llvm::AttrBuilder builder;
  builder.addAttribute(Attribute::ReadNone);
  builder.addAttribute(Attribute::NoUnwind);
  builder.addAttribute(Attribute::WillReturn);
  builder.addAttribute(Attribute::NoFree);
  builder.addAttribute(Attribute::ArgMemOnly);

  llvm::AttributeList attrs = llvm::AttributeList::get(
      module->getContext(), llvm::AttributeList::FunctionIndex, builder);

  return module->getOrInsertFunction(
      "caffeine_assert", attrs, llvm::Type::getVoidTy(module->getContext()),
      llvm::Type::getInt1Ty(module->getContext()));
}

} // namespace caffeine
