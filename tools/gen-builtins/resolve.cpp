#include "builtins.h"
#include "caffeine/Support/Assert.h"
#include <fmt/format.h>

namespace caffeine {

llvm::FunctionCallee generateResolve(llvm::Module* module, llvm::Type* ptr_ty,
                                     llvm::Type* size_ty) {
  using llvm::Attribute;

  CAFFEINE_ASSERT(ptr_ty->isPointerTy());
  CAFFEINE_ASSERT(ptr_ty->getPointerElementType()->isIntegerTy());
  CAFFEINE_ASSERT(size_ty->isIntegerTy());

  std::string funcname = fmt::format(
      "caffeine.resolve.p{}i{}.i{}", ptr_ty->getPointerAddressSpace(),
      ptr_ty->getPointerElementType()->getIntegerBitWidth(),
      size_ty->getIntegerBitWidth());

  llvm::AttrBuilder builder;
  builder.addAttribute(Attribute::ReadNone);
  builder.addAttribute(Attribute::ReadNone);
  builder.addAttribute(Attribute::NoUnwind);
  builder.addAttribute(Attribute::WillReturn);
  builder.addAttribute(Attribute::NoFree);
  builder.addAttribute(Attribute::ArgMemOnly);

  llvm::AttributeList attrs = llvm::AttributeList::get(
      module->getContext(), llvm::AttributeList::FunctionIndex, builder);

  return module->getOrInsertFunction(funcname, attrs, ptr_ty, ptr_ty, size_ty);
}

} // namespace caffeine
