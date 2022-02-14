#include "caffeine/IR/EGraphMatching.h"

namespace caffeine::ematching {

bool SubClauseFilter::operator==(const SubClauseFilter& filter) const {
  if (type != filter.type)
    return false;

  return is_equal(filter);
}
bool SubClauseFilter::operator!=(const SubClauseFilter& filter) const {
  return !(*this == filter);
}

llvm::hash_code hash_value(const SubClauseFilter& filter) {
  return llvm::hash_combine(filter.type, filter.hash());
}

} // namespace caffeine::ematching
