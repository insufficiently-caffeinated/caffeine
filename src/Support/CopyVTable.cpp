#include "caffeine/Support/CopyVTable.h"
#include <cstring>

namespace caffeine {

void CopyVTable::copy_vtable(const CopyVTable& base) noexcept {
  if (this != &base) {
    std::memcpy((void*)this, (const void*)&base, sizeof(*this));
  }
}

CopyVTable::CopyVTable(const CopyVTable& base) noexcept {
  copy_vtable(base);
}
CopyVTable::CopyVTable(CopyVTable&& base) noexcept {
  copy_vtable(base);
}

CopyVTable& CopyVTable::operator=(const CopyVTable& base) noexcept {
  copy_vtable(base);
  return *this;
}
CopyVTable& CopyVTable::operator=(CopyVTable&& base) noexcept {
  copy_vtable(base);
  return *this;
}

} // namespace caffeine
