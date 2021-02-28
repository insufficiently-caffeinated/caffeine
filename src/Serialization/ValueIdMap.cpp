#include "caffeine/Serialization/ValueIdMap.h"

#include <llvm/IR/Module.h>

#include "caffeine/Protos/operation.capnp.h"

namespace caffeine_distributed {

ValueIdMap::ValueIdMap(llvm::Function* func) : func_{func} {
  ValueId curr = 0;
  for (auto& basic_block : *func) {
    for (auto& instr : basic_block) {
      mapping_.insert({&instr, curr});
      curr++;
    }
  }

  auto* module = func->getParent();
  for (auto& global : module->getGlobalList()) {
    mapping_.insert({&global, curr});
    curr++;
  }
};

std::optional<ValueId> ValueIdMap::getValueId(llvm::Value* val) {
  if (mapping_.find(val) == mapping_.end()) {
    return std::nullopt;
  }

  return mapping_.at(val);
}

} // namespace caffeine_distributed
