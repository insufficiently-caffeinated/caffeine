#include <mutex>
#include <unordered_map>

#include <llvm/IR/Constant.h>

namespace caffeine {

class TypeidDb {
public:
  int32_t get_selector(const llvm::Constant* exception_ty);

private:
  // For thread safety
  mutable std::mutex mutex;
  // For keeping track of which constants match which
  // select values
  std::unordered_map<const llvm::Constant*, int32_t> values;
  int32_t curr = 1;
};

} // namespace caffeine
