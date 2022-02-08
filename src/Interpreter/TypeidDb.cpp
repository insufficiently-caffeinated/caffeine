#include <caffeine/Interpreter/TypeidDb.h>

namespace caffeine {

int32_t TypeidDb::get_selector(const llvm::Constant* exception_ty) {
  std::unique_lock lock(mutex);

  auto val = values.find(exception_ty);
  if (val != values.end()) {
    return val->second;
  }

  values[exception_ty] = curr;
  int32_t res = curr;
  curr++;
  return res;
}

} // namespace caffeine
