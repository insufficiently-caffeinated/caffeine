#include "caffeine/Support/CopyVTable.h"
#include <cstring>

namespace caffeine {

void CopyVTable::copy_vtable(const CopyVTable& base) noexcept {
  if (this != &base) {
    std::memcpy((void*)this, (const void*)&base, sizeof(*this));
  }
}

} // namespace caffeine
