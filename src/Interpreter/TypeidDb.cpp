#include <caffeine/Interpreter/TypeidDb.h>
#include <caffeine/Support/Assert.h>

#include "caffeine/Support/LLVMFmt.h"
#include <fmt/format.h>
#include <iostream>

namespace caffeine {

int32_t TypeidDb::get_selector(const llvm::Constant* exception_ty) {
  CAFFEINE_ASSERT(exception_ty, "must not be a null pointer");
  std::unique_lock lock(mutex);

  {
    auto val = values.find(exception_ty->stripPointerCasts());
    if (val != values.end()) {
      return val->second;
    }
  }

  values[exception_ty->stripPointerCasts()] = curr;
  int32_t res = curr;
  curr++;
  return res;
}

} // namespace caffeine
